@implementation HKGraphView

- (HKGraphView)initWithFrame:(CGRect)a3
{
  HKGraphView *v3;
  NSMutableArray *v4;
  NSMutableArray *seriesGroupRows;
  void *v6;
  HKGraphRenderView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  HKGraphRenderer *renderView;
  HKGraphRenderView *v14;
  HKGraphRenderer *yAxisLabelContent;
  void *v16;
  HKGraphViewSelectionStyle *v17;
  HKGraphViewSelectionStyle *selectionStyle;
  HKGraphViewSelectionStyle *v19;
  void *v20;
  void *v21;
  HKPropertyAnimationApplier *v22;
  HKPropertyAnimationApplier *animationApplier;
  NSMutableDictionary *v24;
  NSMutableDictionary *currentAnimationProperties;
  uint64_t v26;
  HKValueRange *effectiveAxisRange;
  uint64_t v28;
  NSCalendar *currentCalendar;
  HKBorderLineView *v30;
  HKBorderLineView *leftMarginView;
  void *v32;
  id v33;
  void *v34;
  int v35;
  HKGraphViewTileThread *graphViewTileThread;
  HKGraphViewTileThread *v37;
  HKGraphViewTileThread *v38;
  _HKGraphViewOverlayView *v39;
  _HKGraphViewOverlayView *overlayView;
  void *v41;
  NSTimer *startupTimer;
  id externalSelectionModelCoordinate;
  void *v44;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)HKGraphView;
  v3 = -[HKGraphView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    seriesGroupRows = v3->_seriesGroupRows;
    v3->_seriesGroupRows = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView setBackgroundColor:](v3, "setBackgroundColor:", v6);

    v7 = [HKGraphRenderView alloc];
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = -[HKGraphRenderView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    renderView = v3->_renderView;
    v3->_renderView = (HKGraphRenderer *)v12;

    -[HKGraphRenderer setUserInteractionEnabled:](v3->_renderView, "setUserInteractionEnabled:", 0);
    -[HKGraphRenderer setRenderDelegate:](v3->_renderView, "setRenderDelegate:", v3);
    -[HKGraphView addSubview:](v3, "addSubview:", v3->_renderView);
    v14 = -[HKGraphRenderView initWithFrame:]([HKGraphRenderView alloc], "initWithFrame:", v8, v9, v10, v11);
    yAxisLabelContent = v3->_yAxisLabelContent;
    v3->_yAxisLabelContent = (HKGraphRenderer *)v14;

    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphRenderer setBackgroundColor:](v3->_yAxisLabelContent, "setBackgroundColor:", v16);

    -[HKGraphRenderer setUserInteractionEnabled:](v3->_yAxisLabelContent, "setUserInteractionEnabled:", 1);
    -[HKGraphRenderer setRenderDelegate:](v3->_yAxisLabelContent, "setRenderDelegate:", v3);
    -[HKGraphView addSubview:](v3, "addSubview:", v3->_yAxisLabelContent);
    -[HKGraphView _addTapGestureRecognizerForTapOnView:](v3, "_addTapGestureRecognizerForTapOnView:", v3->_yAxisLabelContent);
    v3->_yAxisLabelMinimumWidth = 0.0;
    -[HKGraphView _loadScrollView](v3, "_loadScrollView");
    v3->_disableSelection = 0;
    v17 = objc_alloc_init(HKGraphViewSelectionStyle);
    selectionStyle = v3->_selectionStyle;
    v3->_selectionStyle = v17;

    -[HKGraphViewSelectionStyle setUnselectedSeriesAlpha:](v3->_selectionStyle, "setUnselectedSeriesAlpha:", 0.3);
    v19 = v3->_selectionStyle;
    HKHealthKeyColor();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v20, 2.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphViewSelectionStyle setSelectedPointLineStrokeStyle:](v19, "setSelectedPointLineStrokeStyle:", v21);

    v3->_moveSelectedSeriesToFront = 1;
    v3->_animationAutoscaleInProgress = 0;
    v22 = objc_alloc_init(HKPropertyAnimationApplier);
    animationApplier = v3->_animationApplier;
    v3->_animationApplier = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    currentAnimationProperties = v3->_currentAnimationProperties;
    v3->_currentAnimationProperties = v24;

    v3->_shouldInformDelegateOfUpdates = 1;
    -[HKGraphView _defaultXAxisValueRange](v3, "_defaultXAxisValueRange");
    v26 = objc_claimAutoreleasedReturnValue();
    effectiveAxisRange = v3->_effectiveAxisRange;
    v3->_effectiveAxisRange = (HKValueRange *)v26;

    objc_storeStrong((id *)&v3->_actualAxisRange, v3->_effectiveAxisRange);
    objc_storeStrong((id *)&v3->_effectiveVisibleRangeCadence, v3->_actualAxisRange);
    objc_storeStrong((id *)&v3->_effectiveVisibleRangeActive, v3->_effectiveVisibleRangeCadence);
    objc_storeStrong((id *)&v3->_actualVisibleRange, v3->_effectiveVisibleRangeCadence);
    v3->_scrollingOptions = 0;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v28 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v3->_currentCalendar;
    v3->_currentCalendar = (NSCalendar *)v28;

    v3->_shouldListenToScrollViewDelegate = 0;
    v3->_enableStickySelection = 1;
    v3->_contentWidthFromTimeScope = 1;
    v3->_enableZoomInGesture = 0;
    v30 = -[HKBorderLineView initWithFrame:]([HKBorderLineView alloc], "initWithFrame:", v8, v9, v10, v11);
    leftMarginView = v3->_leftMarginView;
    v3->_leftMarginView = v30;

    -[HKBorderLineView setEdges:](v3->_leftMarginView, "setEdges:", 8);
    -[HKBorderLineView setBorderWidth:](v3->_leftMarginView, "setBorderWidth:", HKUIOnePixel());
    -[HKBorderLineView setBorderLineColor:](v3->_leftMarginView, "setBorderLineColor:", v3->_outlineColor);
    -[HKGraphView backgroundColor](v3, "backgroundColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKBorderLineView setBackgroundColor:](v3->_leftMarginView, "setBackgroundColor:", v32);

    -[HKGraphView addSubview:](v3, "addSubview:", v3->_leftMarginView);
    -[HKGraphView setHardLeftMarginWidth:](v3, "setHardLeftMarginWidth:", 0.0);
    v3->_subviewsHaveBeenLaidOut = 0;
    v3->_contentOffsetIsSet = 0;
    v3->_tilingDisabled = 0;
    v3->_tilesTransientDisabled = 0;
    v3->_tileInitialRedrawCount = 0;
    v3->_tilesWaitingForInitialRender = 1;
    v33 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v34 = (void *)objc_msgSend(v33, "initWithSuiteName:", *MEMORY[0x1E0CB7608]);
    v35 = objc_msgSend(v34, "BOOLForKey:", CFSTR("DisableTileThreading"));
    LODWORD(v20) = objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall");

    if ((_DWORD)v20 && v35)
    {
      graphViewTileThread = v3->_graphViewTileThread;
      v3->_graphViewTileThread = 0;

    }
    else
    {
      v37 = -[HKGraphViewTileThread initWithGraphView:]([HKGraphViewTileThread alloc], "initWithGraphView:", v3);
      v38 = v3->_graphViewTileThread;
      v3->_graphViewTileThread = v37;

      -[HKGraphViewTileThread setName:](v3->_graphViewTileThread, "setName:", CFSTR("HKGraphViewTileThread"));
      -[HKGraphViewTileThread start](v3->_graphViewTileThread, "start");
    }
    v3->_prefersOpaqueLegends = 0;
    v3->_drawsGridlinesPerSeriesGroup = 0;
    v3->_lastSingleSelectionXValue = 2.22507386e-308;
    v39 = -[_HKGraphViewOverlayView initWithFrame:]([_HKGraphViewOverlayView alloc], "initWithFrame:", v8, v9, v10, v11);
    overlayView = v3->_overlayView;
    v3->_overlayView = v39;

    -[_HKGraphViewOverlayView setHidden:](v3->_overlayView, "setHidden:", 1);
    -[HKGraphView addSubview:](v3, "addSubview:", v3->_overlayView);
    -[HKGraphView setPreviousOverlayType:](v3, "setPreviousOverlayType:", 0);
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 10);
    -[HKGraphView setOverlayInteractiveViews:](v3, "setOverlayInteractiveViews:", v41);

    v3->_measuringStartupTime = -[HKGraphView _measureStartupFlagFromEnvironment](v3, "_measureStartupFlagFromEnvironment");
    v3->_startTime = 0.0;
    v3->_lastEndTime = 0.0;
    startupTimer = v3->_startupTimer;
    v3->_startupTimer = 0;

    v3->_firstNonemptyDrawTime = 0.0;
    v3->_measurementStartupAutoscale = 0;
    externalSelectionModelCoordinate = v3->_externalSelectionModelCoordinate;
    v3->_externalSelectionModelCoordinate = 0;

    v3->_externalSelectionScheduled = 0;
    v3->_externalSelectionLastLocation = -1.79769313e308;
    v3->_xAxisDateZoom = 8;
    objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartAccessibilityIdentifier:", CFSTR("BodyView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v44);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_graphViewTileThread)
    -[HKGraphView _shutdownTilingThread](self, "_shutdownTilingThread");
  v3.receiver = self;
  v3.super_class = (Class)HKGraphView;
  -[HKGraphView dealloc](&v3, sel_dealloc);
}

- (BOOL)_measureStartupFlagFromEnvironment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MEASURE_CHART_STARTUP_TIME"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4 && objc_msgSend(v4, "length");

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKGraphView;
  v4 = a3;
  -[HKGraphView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v10.receiver, v10.super_class);

  -[HKGraphView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[HKGraphView backgroundColor](self, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView _captureColor:](self, "_captureColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView setCapturedTileBackgroundColor:](self, "setCapturedTileBackgroundColor:", v9);

    -[HKGraphView resetAndRedraw](self, "resetAndRedraw");
  }
}

- (void)resetAndRedraw
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  HKGraphView *v18;
  NSMutableArray *obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
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
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HKAxis clearCache](self->_xAxis, "clearCache");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = self;
  obj = self->_seriesGroupRows;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v33;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(obj);
        v22 = v3;
        v4 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v3);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v4, "zoomToSeriesMapping", v18);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v29 != v7)
                objc_enumerationMutation(v23);
              v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              v24 = 0u;
              v25 = 0u;
              v26 = 0u;
              v27 = 0u;
              objc_msgSend(v4, "zoomToSeriesMapping");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKey:", v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v25;
                do
                {
                  for (j = 0; j != v13; ++j)
                  {
                    if (*(_QWORD *)v25 != v14)
                      objc_enumerationMutation(v11);
                    v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                    objc_msgSend(v16, "yAxis");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "clearCache");

                    objc_msgSend(v16, "clearCaches");
                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
                }
                while (v13);
              }

            }
            v6 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v6);
        }

        v3 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v21);
  }

  -[HKGraphView _reconfigureScrollingTiles](v18, "_reconfigureScrollingTiles");
  -[HKGraphView setNeedsReloadSeries](v18, "setNeedsReloadSeries");
  -[HKGraphRenderer setNeedsRender](v18->_yAxisLabelContent, "setNeedsRender");
}

- (BOOL)_axisRangeIsDateRange
{
  HKValueRange *effectiveAxisRange;
  void *v3;
  char isKindOfClass;

  effectiveAxisRange = self->_effectiveAxisRange;
  if (effectiveAxisRange)
  {
    -[HKValueRange minValue](effectiveAxisRange, "minValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_walkAllSeries:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_seriesGroupRows;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v10, "currentSeries");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
              v17 = 0;
              v4[2](v4, v16, &v17);
              if (v17)
              {

                goto LABEL_18;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }
LABEL_18:

}

- (BOOL)_needsYAxisUpdateDuringRender
{
  BOOL v3;
  BOOL v4;

  v3 = -[UIScrollView isDragging](self->_scrollView, "isDragging");
  v4 = -[HKGraphView animationAutoscaleInProgress](self, "animationAutoscaleInProgress");
  return (v3 | -[UIScrollView isScrollAnimating](self->_scrollView, "isScrollAnimating")) ^ 1 | v4;
}

- (BOOL)_configureYAxisViewIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  double yAxisLabelMinimumWidth;
  double Width;
  CGFloat v17;
  _QWORD v18[10];
  uint64_t v19;
  CGRect *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  CGRect v25;

  -[HKGraphRenderer bounds](self->_yAxisLabelContent, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HKGraphView zoomScale](self, "zoomScale");
  v19 = 0;
  v20 = (CGRect *)&v19;
  v21 = 0x4010000000;
  v22 = &unk_1D7BC951A;
  v11 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v23 = *MEMORY[0x1E0C9D628];
  v24 = v11;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42__HKGraphView__configureYAxisViewIfNeeded__block_invoke;
  v18[3] = &unk_1E9C40650;
  v18[5] = v4;
  v18[6] = v6;
  v18[7] = v8;
  v18[8] = v10;
  v18[9] = v12;
  v18[4] = &v19;
  -[HKGraphView _walkAllSeries:](self, "_walkAllSeries:", v18);
  if (CGRectIsNull(v20[1])
    || CGRectGetWidth(v20[1]) <= self->_yAxisLabelMinimumWidth
    || -[HKGraphView _drawingDuringScrolling](self, "_drawingDuringScrolling"))
  {
    v13 = 0;
  }
  else
  {
    yAxisLabelMinimumWidth = self->_yAxisLabelMinimumWidth;
    Width = CGRectGetWidth(v20[1]);
    -[HKBorderLineView frame](self->_leftMarginView, "frame");
    v17 = CGRectGetWidth(v25);
    if (Width >= v17)
      v17 = Width;
    self->_yAxisLabelMinimumWidth = v17;
    -[HKGraphView setNeedsLayout](self, "setNeedsLayout");
    -[HKGraphView _setNeedsUpdateGraphViewConfiguration](self, "_setNeedsUpdateGraphViewConfiguration");
    -[HKGraphView _notifyDelegateOfYAxisWidth:toWidth:](self, "_notifyDelegateOfYAxisWidth:toWidth:", yAxisLabelMinimumWidth, self->_yAxisLabelMinimumWidth);
    v13 = 1;
  }
  _Block_object_dispose(&v19, 8);
  return v13;
}

void __42__HKGraphView__configureYAxisViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  CGRect v14;

  v13 = a2;
  objc_msgSend(v13, "yAxis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v13, "visibleValueRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "labelRectWithModelRange:chartRect:zoomScale:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v14);

}

- (double)yAxisWidth
{
  return self->_yAxisLabelMinimumWidth;
}

- (CGRect)leftMarginViewRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[HKGraphView bounds](self, "bounds");
  -[HKGraphView _adjustLeftMarginRectForBaselines:](self, "_adjustLeftMarginRectForBaselines:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_adjustLeftMarginRectForBaselines:(CGRect)a3
{
  CGFloat width;
  double y;
  double x;
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
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double MaxY;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double height;
  CGRect v35;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[HKGraphView _bottomBaselineYValueForChartRect:](self, "_bottomBaselineYValueForChartRect:");
  v16 = v15;
  -[HKGraphView _topBaselineYValueForChartRect:](self, "_topBaselineYValueForChartRect:", v8, v10, v12, v14);
  if (v17 <= 0.00000011920929)
  {
    v20 = x + 0.0;
    v19 = v10 + 4.0;
    v18 = 4.0 + 0.0;
  }
  else
  {
    v18 = v17 - y;
    v19 = y + v17 - y;
    v20 = x;
  }
  v21 = height - v18;
  if (v16 <= v17 || v16 <= 0.00000011920929)
    v23 = v21;
  else
    v23 = v16 - v19;
  if (y >= v19)
    v24 = y;
  else
    v24 = v19;
  v25 = v20;
  v26 = v24;
  v27 = width;
  MaxY = CGRectGetMaxY(*(CGRect *)(&v23 - 3));
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v29 = CGRectGetMaxY(v35);
  if (MaxY < v29)
    v29 = MaxY;
  v30 = v29 - v24;
  v31 = v20;
  v32 = v24;
  v33 = width;
  result.size.height = v30;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (double)_detailViewWidth
{
  double v3;

  if (!self->_detailView)
    return 0.0;
  -[HKGraphView frame](self, "frame");
  return v3 + -125.0 - self->_hardLeftMarginWidth + -16.0;
}

- (CGRect)_scrollingAreaRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double yAxisLabelMinimumWidth;
  double hardLeftMarginWidth;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[HKGraphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  yAxisLabelMinimumWidth = self->_yAxisLabelMinimumWidth;
  hardLeftMarginWidth = self->_hardLeftMarginWidth;
  -[HKGraphView _detailViewWidth](self, "_detailViewWidth");
  v14 = hardLeftMarginWidth + v13;
  v15 = v4 + hardLeftMarginWidth + v13;
  v16 = v6 + 0.0;
  v17 = v8 - (yAxisLabelMinimumWidth + v14);
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_verticalAxisRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[HKGraphView bounds](self, "bounds");
  v4 = v3 - self->_yAxisLabelMinimumWidth;
  v6 = v5 + v4;
  v8 = v7 + 0.0;
  v9 = v3 - (v4 + 0.0);
  v11 = v10 - (self->_axisInset.bottom + 0.0);
  result.size.height = v11;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (UIEdgeInsets)_dataAreaInsets
{
  double top;
  double left;
  double right;
  double v5;
  UIEdgeInsets result;

  top = self->_axisInset.top;
  left = self->_axisInset.left;
  right = self->_axisInset.right;
  v5 = self->_axisInset.bottom + self->_xAxisSpace;
  if (top < 0.00000011920929)
    top = 2.0;
  if (v5 < 0.00000011920929)
    v5 = 2.0;
  result.right = right;
  result.bottom = v5;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)_dataAreaRect
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  CGRect result;

  -[HKGraphView _scrollingAreaRect](self, "_scrollingAreaRect");
  v4 = v3;
  v6 = v5;
  -[HKGraphView _dataAreaInsets](self, "_dataAreaInsets");
  v8 = v7 + 0.0;
  v11 = v4 - (v9 + v10);
  v13 = v6 - (v7 + v12);
  v14 = v9 + 0.0;
  v15 = v8;
  v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_overlayAreaRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[HKGraphView _scrollingAreaRect](self, "_scrollingAreaRect");
  v4 = v3 + 0.0;
  v6 = v5 + -2.0;
  v8 = v7 + 2.0;
  result.size.height = v8;
  result.size.width = v2;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (void)_updateScene
{
  HKGraphRenderer *renderView;
  HKGraphRenderer *v4;

  renderView = self->_renderView;
  -[HKGraphView _scrollingAreaRect](self, "_scrollingAreaRect");
  -[HKGraphRenderer setFrame:](renderView, "setFrame:");
  v4 = self->_renderView;
  -[HKGraphView _scrollingAreaRect](self, "_scrollingAreaRect");
  -[HKGraphRenderer convertRect:fromView:](v4, "convertRect:fromView:", self);
  -[HKGraphRenderer setAxisRect:](v4, "setAxisRect:");
  -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
  -[HKGraphRenderer setNeedsRender](self->_yAxisLabelContent, "setNeedsRender");
  -[HKGraphView _notifyDelegateOfVisibleValueRange:changeContext:](self, "_notifyDelegateOfVisibleValueRange:changeContext:", self->_effectiveVisibleRangeActive, 2);
}

- (HKValueRange)chartableValueRange
{
  HKValueRange *chartableValueRange;

  chartableValueRange = self->_chartableValueRange;
  if (chartableValueRange)
    return chartableValueRange;
  -[HKGraphView effectiveAxisRange](self, "effectiveAxisRange");
  return (HKValueRange *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)allSeries
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_seriesGroupRows;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "currentSeries", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isScrollViewDecelerating
{
  return -[UIScrollView isDecelerating](self->_scrollView, "isDecelerating");
}

- (void)_loadScrollView
{
  id v3;
  UIScrollView *v4;
  void *v5;
  UIScrollView *scrollView;
  UIScrollView *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v4 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIScrollView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setDecelerationRate:](v4, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
  -[UIScrollView setDelegate:](v4, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[UIScrollView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  -[UIScrollView setBounces:](v4, "setBounces:", 1);
  -[UIScrollView setBouncesZoom:](v4, "setBouncesZoom:", 0);
  -[HKGraphView addSubview:](self, "addSubview:", v4);
  scrollView = self->_scrollView;
  self->_scrollView = v4;
  v7 = v4;

  if (self->_disableSelection)
    -[HKGraphView _removeSelectionRecognizerFromView:](self, "_removeSelectionRecognizerFromView:", v7);
  else
    -[HKGraphView _addSelectionRecognizerToView:](self, "_addSelectionRecognizerToView:", v7);
  -[HKGraphView _addTapGestureRecognizerForTogglingStickyToView:](self, "_addTapGestureRecognizerForTogglingStickyToView:", v7);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  _QWORD v35[9];

  -[HKGraphView leftMarginViewRect](self, "leftMarginViewRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HKGraphView _verticalAxisRect](self, "_verticalAxisRect");
  v33 = v12;
  v34 = v11;
  v31 = v14;
  v32 = v13;
  -[HKGraphView _scrollingAreaRect](self, "_scrollingAreaRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v29 = v24;
  v30 = v23;
  v27 = v26;
  v28 = v25;
  -[HKBorderLineView setFrame:](self->_leftMarginView, "setFrame:", v4, v6, v8, v10);
  -[HKGraphRenderer setFrame:](self->_renderView, "setFrame:", v16, v18, v20, v22);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __29__HKGraphView_layoutSubviews__block_invoke;
  v35[3] = &unk_1E9C40678;
  v35[4] = self;
  *(double *)&v35[5] = v16;
  *(double *)&v35[6] = v18;
  *(double *)&v35[7] = v20;
  *(double *)&v35[8] = v22;
  -[HKGraphView _updateScrollViewPropertiesIgnoringScrollViewCallbacks:](self, "_updateScrollViewPropertiesIgnoringScrollViewCallbacks:", v35);
  -[HKGraphRenderer setFrame:](self->_yAxisLabelContent, "setFrame:", v34, v33, v32, v31);
  -[HKGraphView _layoutLegendsForChartRect:](self, "_layoutLegendsForChartRect:", v30, v29, v28, v27);
  -[HKGraphView _layoutOverlayView](self, "_layoutOverlayView");
  if (!self->_subviewsHaveBeenLaidOut)
  {
    -[HKGraphView _hideTilesWithForce](self, "_hideTilesWithForce");
    self->_subviewsHaveBeenLaidOut = 1;
  }
}

uint64_t __29__HKGraphView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)willMoveToWindow:(id)a3
{
  _BOOL4 v5;
  void *v6;
  NSObject **v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];

  -[HKGraphView setStartTime:](self, "setStartTime:", CACurrentMediaTime());
  v5 = -[HKGraphView measuringStartupTime](self, "measuringStartupTime");
  if (a3)
  {
    if (v5)
    {
      -[HKGraphView startupTimer](self, "startupTimer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[HKGraphView startTime](self, "startTime");
        -[HKGraphView setLastEndTime:](self, "setLastEndTime:");
        v7 = (NSObject **)MEMORY[0x1E0CB5378];
        v8 = _HKLogSignpostIDGenerate();
        _HKInitializeLogging();
        v9 = *v7;
        if (os_signpost_enabled(v9))
        {
          v10 = v9;
          v11 = v10;
          if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v13 = 0;
            _os_signpost_emit_with_name_impl(&dword_1D7813000, v11, OS_SIGNPOST_EVENT, v8, "chart-ppt-start", ", v13, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__startupTimerCallback_, 0, 1, 0.1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKGraphView setStartupTimer:](self, "setStartupTimer:", v12);

      }
    }
  }
}

- (void)_startupTimerCallback:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v4 = CACurrentMediaTime();
  -[HKGraphView lastEndTime](self, "lastEndTime");
  if (v4 - v5 >= 3.0)
  {
    -[HKGraphView firstNonemptyDrawTime](self, "firstNonemptyDrawTime");
    if (v6 <= 0.0)
      -[HKGraphView lastEndTime](self, "lastEndTime");
    else
      -[HKGraphView firstNonemptyDrawTime](self, "firstNonemptyDrawTime");
    v8 = v7;
    -[HKGraphView startTime](self, "startTime");
    v10 = v9;
    -[HKGraphView delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[HKGraphView delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[HKGraphView delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "graphView:startupTime:", self, vcvtmd_s64_f64((v8 - v10) * 1000000.0));

      }
    }
    -[HKGraphView setMeasuringStartupTime:](self, "setMeasuringStartupTime:", 0);
    -[HKGraphView setStartTime:](self, "setStartTime:", 0.0);
    -[HKGraphView setLastEndTime:](self, "setLastEndTime:", 0.0);
    -[HKGraphView startupTimer](self, "startupTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    -[HKGraphView setStartupTimer:](self, "setStartupTimer:", 0);
  }
}

- (void)_recordLastRenderTime
{
  NSObject **v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  if (!-[HKGraphView measurementStartupAutoscale](self, "measurementStartupAutoscale"))
  {
    -[HKGraphView setMeasurementStartupAutoscale:](self, "setMeasurementStartupAutoscale:", -[HKGraphView animationAutoscaleInProgress](self, "animationAutoscaleInProgress"));
    -[HKGraphView setLastEndTime:](self, "setLastEndTime:", CACurrentMediaTime());
    v3 = (NSObject **)MEMORY[0x1E0CB5378];
    v4 = _HKLogSignpostIDGenerate();
    _HKInitializeLogging();
    v5 = *v3;
    if (os_signpost_enabled(v5))
    {
      v6 = v5;
      v7 = v6;
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)v8 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D7813000, v7, OS_SIGNPOST_EVENT, v4, "chart-ppt-render", ", v8, 2u);
      }

    }
  }
}

- (BOOL)_graphViewIsConfigured
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HKGraphView xAxis](self, "xAxis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKGraphView xAxis](self, "xAxis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_msgSend(v4, "requiresScaling") & 1) == 0 && self->_subviewsHaveBeenLaidOut;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_createLegendsIfNecessary
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_seriesGroupRows;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "legendView", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {

        }
        else if (-[HKGraphView _seriesGroupHasLegendEntries:](self, "_seriesGroupHasLegendEntries:", v8))
        {
          -[HKGraphView _createLegendForSeriesGroup:](self, "_createLegendForSeriesGroup:", v8);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)_seriesGroupHasLegendEntries:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "currentSeries", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "titleLegendEntries");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {

LABEL_13:
          v11 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v8, "detailLegendEntries");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          goto LABEL_13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (void)_updateLegendForSeriesGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "legendView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v4;
    objc_msgSend(v4, "currentSeries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v14 = -[HKGraphView xAxisDateZoom](self, "xAxisDateZoom");
          -[HKGraphView effectiveVisibleRangeActive](self, "effectiveVisibleRangeActive");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "updateLegendsForTimeScope:range:drawingDuringScrolling:", v14, v15, -[HKGraphView _drawingDuringScrolling](self, "_drawingDuringScrolling"));

          objc_msgSend(v13, "titleLegendEntries");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (v17)
          {
            objc_msgSend(v13, "titleLegendEntries");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObjectsFromArray:", v18);

          }
          objc_msgSend(v13, "detailLegendEntries");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (v20)
          {
            objc_msgSend(v13, "detailLegendEntries");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObjectsFromArray:", v21);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v10);
    }

    v4 = v32;
    if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
    {
      objc_msgSend(v32, "legendView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLeftEntries:rightEntries:", v6, v7);

      -[HKGraphView _currentLegendInsets](self, "_currentLegendInsets");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      objc_msgSend(v32, "legendView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setEdgeInsets:", v24, v26, v28, v30);

    }
  }

}

- (void)_updateLegendsForAllSeriesGroups
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_seriesGroupRows;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[HKGraphView _updateLegendForSeriesGroup:](self, "_updateLegendForSeriesGroup:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (UIEdgeInsets)_currentLegendInsets
{
  double v3;
  double v4;
  void *v5;
  double virtualLeftMarginWidth;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  -[HKGraphView _inactiveRightAreaForRect:](self, "_inactiveRightAreaForRect:");
  v4 = v3;
  -[HKGraphView detailView](self, "detailView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  virtualLeftMarginWidth = 16.0;
  if (!v5)
    virtualLeftMarginWidth = self->_virtualLeftMarginWidth;

  +[HKLegendView modifiedInsetsForOpaqueLegend:originalInsets:](HKLegendView, "modifiedInsetsForOpaqueLegend:originalInsets:", self->_prefersOpaqueLegends, 0.0, virtualLeftMarginWidth, 0.0, v4 + self->_virtualRightMarginWidth);
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)_createLegendForSeriesGroup:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  HKLegendView *v11;

  v4 = a3;
  -[HKGraphView _currentLegendInsets](self, "_currentLegendInsets");
  v11 = -[HKLegendView initWithEdgeInsets:opaqueBackground:]([HKLegendView alloc], "initWithEdgeInsets:opaqueBackground:", self->_prefersOpaqueLegends, v5, v6, v7, v8);
  -[HKGraphView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "seriesSelectionLineColorForGraphView:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLegendView setLollipopColor:](v11, "setLollipopColor:", v10);

  objc_msgSend(v4, "setLegendView:", v11);
  objc_msgSend(v4, "setLastLegendSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[HKGraphView addSubview:](self, "addSubview:", v11);
  -[HKGraphView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_renderView, v11);
  -[HKGraphView bringSubviewToFront:](self, "bringSubviewToFront:", self->_scrollView);
  -[HKGraphView _updateLegendForSeriesGroup:](self, "_updateLegendForSeriesGroup:", v4);

}

- (void)_layoutLegendsForChartRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  void *v11;
  _BOOL4 IsNull;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double hardLeftMarginWidth;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v40;
  double v41;
  id v42;
  CGRect v43;
  CGRect v44;

  v5 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (-[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    v8 = 0;
    v37 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
    v38 = *MEMORY[0x1E0DC4FF8];
    do
    {
      -[HKGraphView _locationSpanForSeriesGroupRow:chartRect:](self, "_locationSpanForSeriesGroupRow:chartRect:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(_QWORD *)&v37, *(_QWORD *)&v38);
      v10 = v9;
      -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v43.origin.x = v5;
      v43.origin.y = v4;
      v43.size.width = v7;
      v43.size.height = v6;
      IsNull = CGRectIsNull(v43);
      if (v10 < v4 || IsNull)
      {
        v4 = v10;
        v5 = 0.0;
      }
      objc_msgSend(v11, "legendView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v40 = v6;
        v41 = v7;
        objc_msgSend(v11, "legendView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "systemLayoutSizeFittingSize:", v38, v37);
        v17 = v16;

        -[HKGraphView bounds](self, "bounds");
        v19 = v18;
        v20 = 0.0;
        if (-[HKGraphView _anySeriesWantsInternalLegends:](self, "_anySeriesWantsInternalLegends:", v8))
        {
          -[HKGraphView _visibleSeriesForSeriesGroup:](self, "_visibleSeriesForSeriesGroup:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "yAxis");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "offsetForLegendView");
            v20 = v24;
          }

        }
        objc_msgSend(v11, "legendView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKLegendView horizontalOffsetWithOpaque:](HKLegendView, "horizontalOffsetWithOpaque:", objc_msgSend(v25, "opaqueBackground"));
        v27 = v26;

        hardLeftMarginWidth = self->_hardLeftMarginWidth;
        v29 = v27 + hardLeftMarginWidth;
        v30 = v10 + v20;
        v31 = v19 - hardLeftMarginWidth - self->_yAxisLabelMinimumWidth - v27;
        v32 = HKUIEqualCGFloats(v4, v10);
        v33 = v40;
        v7 = v41;
        if (v32)
        {
          v33 = v17;
          v7 = v31;
          v4 = v30;
          v5 = v29;
        }
        objc_msgSend(v11, "legendView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setFrame:", v29, v30, v31, v17);

        v35 = v31;
        v6 = v33;
        objc_msgSend(v11, "setLastLegendSize:", v35, v17);
        objc_msgSend(v11, "legendView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKGraphView bringSubviewToFront:](self, "bringSubviewToFront:", v36);

      }
      ++v8;
    }
    while (v8 < -[NSMutableArray count](self->_seriesGroupRows, "count"));
  }
  v44.origin.x = v5;
  v44.origin.y = v4;
  v44.size.width = v7;
  v44.size.height = v6;
  if (!CGRectIsNull(v44))
  {
    -[HKGraphView delegate](self, "delegate");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "graphView:didUpdateLegendViewsWithTopLegendFrame:", self, v5, v4, v7, v6);

  }
}

- (void)_layoutDetailView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[UIView topAnchor](self->_detailView, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView topAnchor](self, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 40.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  -[UIView leftAnchor](self->_detailView, "leftAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView leftAnchor](self, "leftAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, self->_hardLeftMarginWidth + 16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[UIView bottomAnchor](self->_detailView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -30.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[HKGraphRenderer leftAnchor](self->_renderView, "leftAnchor");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView rightAnchor](self->_detailView, "rightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v12, 16.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

}

- (id)_graphSeriesForZoom:(int64_t)a3 seriesGroupRow:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoomToSeriesMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "graphView:graphSeriesForZoom:stackOffset:", self, a3, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v13;
    v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v10);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v18, "setDelegate:", self, (_QWORD)v23);
          objc_msgSend(v18, "yAxis");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "clearCache");

        }
        v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    if (v10)
    {
      objc_msgSend(v7, "zoomToSeriesMapping");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, v21);

    }
  }

  return v10;
}

- (void)_shareYAxesForSeriesGroup:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "currentSeries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v5, "currentSeries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
        objc_msgSend(v13, "yAxis");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v13, "yAxis");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_11;
    }
    else
    {
LABEL_10:

LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphView.m"), 894, CFSTR("At least one series in the series group must have a valid Y Axis"));

      v16 = 0;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v5, "currentSeries");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v21, "yAxis");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "independentAxes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v5, "independentAxes");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "containsObject:", v22);

          }
          else
          {
            v25 = 0;
          }

          if ((v25 & 1) == 0 && v22 != v16)
            objc_msgSend(v21, "setYAxis:", v16);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v18);
    }

  }
}

- (void)_loadSeriesForZoom:(int64_t)a3
{
  id WeakRetained;
  uint64_t v6;
  _HKGraphViewSeriesGroup *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "stackCountForGraphView:", self);

  if (v6 != -[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    -[HKGraphView removeSeries](self, "removeSeries");
    if (v6 >= 1)
    {
      do
      {
        v7 = objc_alloc_init(_HKGraphViewSeriesGroup);
        -[NSMutableArray addObject:](self->_seriesGroupRows, "addObject:", v7);

        --v6;
      }
      while (v6);
    }
  }
  if (-[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    v8 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKGraphView _graphSeriesForZoom:seriesGroupRow:](self, "_graphSeriesForZoom:seriesGroupRow:", a3, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCurrentSeries:", v10);

      -[HKGraphView _shareYAxesForSeriesGroup:](self, "_shareYAxesForSeriesGroup:", v9);
      ++v8;
    }
    while (v8 < -[NSMutableArray count](self->_seriesGroupRows, "count"));
  }
}

- (void)setNeedsReloadSeries
{
  -[HKGraphView removeSeries](self, "removeSeries");
  -[HKGraphView _reloadViewScope](self, "_reloadViewScope");
  -[HKGraphView _markTilesDirtyWithCompletion:](self, "_markTilesDirtyWithCompletion:", 0);
}

- (void)removeSeries
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_seriesGroupRows;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "axisAnnotationHandler", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_forceClearAxisAnnotations");

        objc_msgSend(v8, "legendView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeFromSuperview");

        objc_msgSend(v8, "setLegendView:", 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[HKGraphView _finishSelection](self, "_finishSelection");
  -[NSMutableArray removeAllObjects](self->_seriesGroupRows, "removeAllObjects");
}

- (void)invalidateDataSourceCaches
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = self->_seriesGroupRows;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        objc_msgSend(v7, "currentSeries", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "dataSource");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "invalidateCache");

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

}

- (void)_clearRenderViewIfNecessary
{
  HKGraphRenderer *renderView;
  HKGraphRenderer *v4;

  renderView = self->_renderView;
  if (renderView)
  {
    -[HKGraphRenderer setRenderDelegate:](renderView, "setRenderDelegate:", 0);
    -[HKGraphRenderer removeFromSuperview](self->_renderView, "removeFromSuperview");
    v4 = self->_renderView;
    self->_renderView = 0;

  }
}

- (void)setRenderView:(id)a3
{
  HKGraphRenderer *v4;
  HKGraphRenderer *renderView;
  HKGraphRenderer *v6;
  HKGraphRenderer *v7;

  v4 = (HKGraphRenderer *)a3;
  -[HKGraphView _clearRenderViewIfNecessary](self, "_clearRenderViewIfNecessary");
  -[HKGraphView _scrollingAreaRect](self, "_scrollingAreaRect");
  -[HKGraphRenderer setFrame:](self->_renderView, "setFrame:");
  renderView = self->_renderView;
  self->_renderView = v4;
  v7 = v4;

  -[HKGraphView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_renderView, self->_scrollView);
  -[HKGraphRenderer setRenderDelegate:](self->_renderView, "setRenderDelegate:", self);
  v6 = self->_renderView;
  -[HKGraphView _scrollingAreaRect](self, "_scrollingAreaRect");
  -[HKGraphRenderer convertRect:fromView:](v6, "convertRect:fromView:", self);
  -[HKGraphRenderer setAxisRect:](self->_renderView, "setAxisRect:");
  -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKGraphView;
  v4 = a3;
  -[HKGraphView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[HKGraphRenderer setBackgroundColor:](self->_renderView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (void)setXAxis:(id)a3
{
  HKAxis **p_xAxis;
  HKAxis *v6;
  void *v7;
  id v8;

  p_xAxis = &self->_xAxis;
  objc_storeStrong((id *)&self->_xAxis, a3);
  v8 = a3;
  v6 = *p_xAxis;
  -[HKGraphView chartableValueRange](self, "chartableValueRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxis setAxisChartableValueRange:](v6, "setAxisChartableValueRange:", v7);

  -[HKGraphView _updateAxisZoomScaleValueRange](self, "_updateAxisZoomScaleValueRange");
  -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");

}

- (void)setChartableValueRange:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_chartableValueRange) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_chartableValueRange, a3);
    -[HKAxis setAxisChartableValueRange:](self->_xAxis, "setAxisChartableValueRange:", v5);
    -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
  }

}

- (void)setHardLeftMarginWidth:(double)a3
{
  if (self->_hardLeftMarginWidth != a3)
  {
    self->_hardLeftMarginWidth = a3;
    -[HKBorderLineView setHidden:](self->_leftMarginView, "setHidden:", a3 <= 0.0);
    -[HKGraphView setNeedsLayout](self, "setNeedsLayout");
    -[HKGraphView _setNeedsUpdateGraphViewConfiguration](self, "_setNeedsUpdateGraphViewConfiguration");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HKGraphView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  self->_shouldListenToScrollViewDelegate = 0;
  v16.receiver = self;
  v16.super_class = (Class)HKGraphView;
  -[HKGraphView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  self->_shouldListenToScrollViewDelegate = 1;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectEqualToRect(v17, v18))
  {
    if (!-[HKGraphView externalSelectionScheduled](self, "externalSelectionScheduled"))
      -[HKGraphView _cancelAndFinishSelection](self, "_cancelAndFinishSelection");
    -[HKGraphView _notifyDelegateOfSizeChange](self, "_notifyDelegateOfSizeChange");
    -[HKGraphView _setNeedsUpdateGraphViewConfiguration](self, "_setNeedsUpdateGraphViewConfiguration");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HKGraphView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  self->_shouldListenToScrollViewDelegate = 0;
  v16.receiver = self;
  v16.super_class = (Class)HKGraphView;
  -[HKGraphView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  self->_shouldListenToScrollViewDelegate = 1;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectEqualToRect(v17, v18))
  {
    if (!-[HKGraphView externalSelectionScheduled](self, "externalSelectionScheduled"))
      -[HKGraphView _cancelAndFinishSelection](self, "_cancelAndFinishSelection");
    -[HKGraphView _notifyDelegateOfSizeChange](self, "_notifyDelegateOfSizeChange");
    -[HKGraphView _setNeedsUpdateGraphViewConfiguration](self, "_setNeedsUpdateGraphViewConfiguration");
  }
}

- (void)setAxisInset:(UIEdgeInsets)a3
{
  double top;
  double left;
  double bottom;
  double right;

  top = self->_axisInset.top;
  left = self->_axisInset.left;
  bottom = self->_axisInset.bottom;
  right = self->_axisInset.right;
  self->_axisInset = a3;
  if (a3.left != left || a3.top != top || a3.right != right || a3.bottom != bottom)
    -[HKGraphView _setNeedsUpdateGraphViewConfiguration](self, "_setNeedsUpdateGraphViewConfiguration");
}

- (void)setOutlineColor:(id)a3
{
  UIColor **p_outlineColor;
  id v6;

  p_outlineColor = &self->_outlineColor;
  objc_storeStrong((id *)&self->_outlineColor, a3);
  v6 = a3;
  -[HKBorderLineView setBorderLineColor:](self->_leftMarginView, "setBorderLineColor:", *p_outlineColor);

  -[HKGraphView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_setVisibleRangesForEffectiveRangeCadence:(id)a3
{
  double v4;
  HKAxis *xAxis;
  HKValueRange *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  HKValueRange *effectiveVisibleRangeCadence;
  HKValueRange *v15;
  HKValueRange *v16;
  HKValueRange *v17;
  HKValueRange *actualVisibleRange;
  HKValueRange *v19;

  v19 = (HKValueRange *)a3;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  xAxis = self->_xAxis;
  v6 = v19;
  if (xAxis)
  {
    v6 = v19;
    if (v4 > 0.0)
    {
      -[HKAxis adjustedRangeForFittedRange:chartRange:](xAxis, "adjustedRangeForFittedRange:chartRange:", v19, 0.0, v4);
      v6 = (HKValueRange *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (self->_actualAxisRange)
  {
    -[HKValueRange minValue](v6, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKValueRange maxValue](v6, "maxValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKValueRange minValue](self->_effectiveAxisRange, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKValueRange maxValue](self->_effectiveAxisRange, "maxValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (HKUIObjectIsSmaller(v7, (uint64_t)v9))
    {
      v11 = v9;

      v7 = v11;
    }
    if (HKUIObjectIsSmaller(v10, (uint64_t)v8))
    {
      v12 = v10;

      v8 = v12;
    }
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v7, v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (HKValueRange *)v13;
  }
  effectiveVisibleRangeCadence = self->_effectiveVisibleRangeCadence;
  self->_effectiveVisibleRangeCadence = v6;
  v15 = v6;

  v16 = self->_effectiveVisibleRangeCadence;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  -[HKGraphView _actualVisibleRangeFromEffectiveVisibleRange:dataAreaRect:](self, "_actualVisibleRangeFromEffectiveVisibleRange:dataAreaRect:", v16);
  v17 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
  actualVisibleRange = self->_actualVisibleRange;
  self->_actualVisibleRange = v17;

}

- (void)_updateRangesForEffectiveAxisRange:(id)a3 effectiveVisibleRangeCadence:(id)a4 effectiveVisibleRangeActive:(id)a5
{
  HKValueRange *v8;
  HKValueRange *v9;
  HKValueRange *effectiveAxisRange;
  id v11;
  HKValueRange *effectiveVisibleRangeActive;
  HKValueRange *v13;
  HKValueRange *v14;
  HKValueRange *actualAxisRange;
  HKValueRange *v16;

  v8 = (HKValueRange *)a3;
  v9 = (HKValueRange *)a5;
  effectiveAxisRange = self->_effectiveAxisRange;
  self->_effectiveAxisRange = v8;
  v16 = v8;
  v11 = a4;

  -[HKGraphView _setVisibleRangesForEffectiveRangeCadence:](self, "_setVisibleRangesForEffectiveRangeCadence:", v11);
  effectiveVisibleRangeActive = self->_effectiveVisibleRangeActive;
  self->_effectiveVisibleRangeActive = v9;
  v13 = v9;

  -[HKGraphView _findActualAxisRangeFromVisibleRanges](self, "_findActualAxisRangeFromVisibleRanges");
  v14 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
  actualAxisRange = self->_actualAxisRange;
  self->_actualAxisRange = v14;

}

- (void)_updateGraphViewConfiguration
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__HKGraphView__updateGraphViewConfiguration__block_invoke;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = self;
  -[HKGraphView _updateScrollViewPropertiesIgnoringScrollViewCallbacks:](self, "_updateScrollViewPropertiesIgnoringScrollViewCallbacks:", v3);
  -[HKGraphView _reloadViewScope](self, "_reloadViewScope");
}

uint64_t __44__HKGraphView__updateGraphViewConfiguration__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateRangesForEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680));
  objc_msgSend(*(id *)(a1 + 32), "_updateZoomForParameters");
  objc_msgSend(*(id *)(a1 + 32), "_autoScaleXAxis");
  objc_msgSend(*(id *)(a1 + 32), "_reconfigureScrollingTiles");
  objc_msgSend(*(id *)(a1 + 32), "_scrollToCurrentVisibleRangeAnimated:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateScene");
}

- (void)setVirtualLeftMargin:(double)a3
{
  -[HKGraphView _updateEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:virtualLeftMarginWidth:virtualRightMarginWidth:](self, "_updateEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:virtualLeftMarginWidth:virtualRightMarginWidth:", self->_effectiveAxisRange, self->_effectiveVisibleRangeCadence, self->_effectiveVisibleRangeActive, a3, self->_virtualRightMarginWidth);
}

- (void)setVirtualRightMargin:(double)a3
{
  -[HKGraphView _updateEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:virtualLeftMarginWidth:virtualRightMarginWidth:](self, "_updateEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:virtualLeftMarginWidth:virtualRightMarginWidth:", self->_effectiveAxisRange, self->_effectiveVisibleRangeCadence, self->_effectiveVisibleRangeActive, self->_virtualLeftMarginWidth, a3);
}

- (void)setVirtualLeftMarginStyle:(int64_t)a3
{
  if (self->_virtualLeftMarginStyle != a3)
  {
    self->_virtualLeftMarginStyle = a3;
    if (!-[HKGraphView _drawingDuringScrolling](self, "_drawingDuringScrolling"))
      -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
  }
}

- (void)setVirtualRightMarginStyle:(int64_t)a3
{
  if (self->_virtualRightMarginStyle != a3)
  {
    self->_virtualRightMarginStyle = a3;
    if (!-[HKGraphView _drawingDuringScrolling](self, "_drawingDuringScrolling"))
      -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
  }
}

- (id)_rangeFromRange:(id)a3 withStartOfRange:(id)a4
{
  HKAxis *xAxis;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;

  xAxis = self->_xAxis;
  v7 = a4;
  v8 = a3;
  -[HKAxis transform](xAxis, "transform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinateForValue:", v10);
  v12 = v11;

  -[HKAxis transform](self->_xAxis, "transform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maxValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "coordinateForValue:", v14);
  v16 = v15;

  v17 = v16 - v12;
  -[HKAxis transform](self->_xAxis, "transform");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "coordinateForValue:", v19);
  v21 = v20;

  v22 = (void *)objc_opt_class();
  -[HKGraphView xAxis](self, "xAxis");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_rangeFromModelCoordinateMin:max:axis:", v23, v21, v17 + v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (double)_modelCoordinateSpanForRange:(id)a3 axis:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "transform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinateForValue:", v8);
  v10 = v9;

  objc_msgSend(v5, "transform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "maxValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "coordinateForValue:", v12);
  v14 = v13;

  return v14 - v10;
}

+ (id)_rangeFromModelCoordinateMin:(double)a3 max:(double)a4 axis:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  objc_msgSend(v7, "transform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForCoordinate:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "transform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "valueForCoordinate:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_setRangesForActiveVisibleRange:(id)a3
{
  HKValueRange *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  HKValueRange *v14;
  HKValueRange *v15;
  BOOL v16;
  HKValueRange *effectiveVisibleRangeActive;
  HKValueRange *v18;

  v4 = (HKValueRange *)a3;
  v5 = (void *)objc_opt_class();
  -[HKGraphView xAxis](self, "xAxis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_modelCoordinateSpanForRange:axis:", v4, v6);
  v8 = v7;

  v9 = (void *)objc_opt_class();
  -[HKGraphView effectiveVisibleRangeCadence](self, "effectiveVisibleRangeCadence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView xAxis](self, "xAxis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_modelCoordinateSpanForRange:axis:", v10, v11);
  v13 = v12;

  if (fabs(v13) <= 2.22044605e-16 || v8 / v13 > 0.99)
  {
    v14 = v4;
  }
  else
  {
    -[HKGraphView _rangeFromRange:withStartOfRange:](self, "_rangeFromRange:withStartOfRange:", self->_effectiveVisibleRangeCadence, v4, v8 / v13);
    v14 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  -[HKGraphView _setVisibleRangesForEffectiveRangeCadence:](self, "_setVisibleRangesForEffectiveRangeCadence:", v14);
  v16 = -[HKGraphView _compareRange:toRange:](self, "_compareRange:toRange:", v4, self->_effectiveVisibleRangeActive);
  effectiveVisibleRangeActive = self->_effectiveVisibleRangeActive;
  self->_effectiveVisibleRangeActive = v4;
  v18 = v4;

  return !v16;
}

- (void)setEffectiveVisibleRangeActive:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (-[HKGraphView _setRangesForActiveVisibleRange:](self, "_setRangesForActiveVisibleRange:", a3))
    -[HKGraphView _finishSelection](self, "_finishSelection");
  -[HKGraphView _scrollToCurrentVisibleRangeAnimated:](self, "_scrollToCurrentVisibleRangeAnimated:", v4);
}

- (BOOL)_compareChartDate:(id)a3 toDate:(id)a4
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceDate:", a4);
  return fabs(v4) < 0.001;
}

- (BOOL)_compareRange:(id)a3 toRange:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  char isKindOfClass;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "startDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v7, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HKGraphView _compareChartDate:toDate:](self, "_compareChartDate:toDate:", v11, v12))
      {
        objc_msgSend(v6, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HKGraphView _compareChartDate:toDate:](self, "_compareChartDate:toDate:", v13, v14);
LABEL_9:
        v24 = v15;

LABEL_12:
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  objc_msgSend(v6, "minValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "minValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v24 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v6, "minValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v19 = v18;
    objc_msgSend(v7, "minValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    if (HKUIEqualCGFloats(v19, v20))
    {
      objc_msgSend(v6, "maxValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v22 = v21;
      objc_msgSend(v7, "maxValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v15 = HKUIEqualCGFloats(v22, v23);
      goto LABEL_9;
    }
LABEL_11:
    v24 = 0;
    goto LABEL_12;
  }
  v24 = 0;
LABEL_13:

LABEL_14:
  return v24;
}

- (void)_updateEffectiveAxisRange:(id)a3 effectiveVisibleRangeCadence:(id)a4 effectiveVisibleRangeActive:(id)a5 virtualLeftMarginWidth:(double)a6 virtualRightMarginWidth:(double)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  HKAxis *xAxis;
  void *v18;
  _QWORD v19[5];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[HKGraphView effectiveVisibleRangeActive](self, "effectiveVisibleRangeActive");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKGraphView _compareRange:toRange:](self, "_compareRange:toRange:", v14, v15);

  if (!v16)
    -[HKGraphView _finishSelection](self, "_finishSelection");
  self->_virtualLeftMarginWidth = a6;
  self->_virtualRightMarginWidth = a7;
  -[HKGraphView _updateRangesForEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:](self, "_updateRangesForEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", v12, v13, v14);
  xAxis = self->_xAxis;
  -[HKGraphView chartableValueRange](self, "chartableValueRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxis setAxisChartableValueRange:](xAxis, "setAxisChartableValueRange:", v18);

  -[HKGraphView _updateAxisZoomScaleValueRange](self, "_updateAxisZoomScaleValueRange");
  -[HKGraphView _updateGraphViewConfiguration](self, "_updateGraphViewConfiguration");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __145__HKGraphView__updateEffectiveAxisRange_effectiveVisibleRangeCadence_effectiveVisibleRangeActive_virtualLeftMarginWidth_virtualRightMarginWidth___block_invoke;
  v19[3] = &unk_1E9C3F0D0;
  v19[4] = self;
  -[HKGraphView _updateScrollViewPropertiesIgnoringScrollViewCallbacks:](self, "_updateScrollViewPropertiesIgnoringScrollViewCallbacks:", v19);
  -[HKGraphView _notifyDelegateOfVisibleValueRange:changeContext:](self, "_notifyDelegateOfVisibleValueRange:changeContext:", self->_effectiveVisibleRangeActive, 2);

}

uint64_t __145__HKGraphView__updateEffectiveAxisRange_effectiveVisibleRangeCadence_effectiveVisibleRangeActive_virtualLeftMarginWidth_virtualRightMarginWidth___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollToCurrentVisibleRangeAnimated:", 0);
}

- (void)setEffectiveAxisRange:(id)a3 effectiveVisibleRangeCadence:(id)a4 effectiveVisibleRangeActive:(id)a5
{
  -[HKGraphView _updateEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:virtualLeftMarginWidth:virtualRightMarginWidth:](self, "_updateEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:virtualLeftMarginWidth:virtualRightMarginWidth:", a3, a4, a5, self->_virtualLeftMarginWidth, self->_virtualRightMarginWidth);
}

- (id)_actualVisibleRangeFromEffectiveVisibleRange:(id)a3 dataAreaRect:(CGRect)a4
{
  double width;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  width = a4.size.width;
  x = a4.origin.x;
  v7 = a3;
  if (-[HKGraphView _axisRangeIsDateRange](self, "_axisRangeIsDateRange"))
  {
    -[HKAxis transform](self->_xAxis, "transform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinateForValue:", v9);
    v11 = v10;
    -[HKAxis transform](self->_xAxis, "transform");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maxValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateForValue:", v13);
    v15 = v14;

    +[HKAxis expandByPointsLow:high:modelRange:pointRange:](HKAxis, "expandByPointsLow:high:modelRange:pointRange:", self->_virtualLeftMarginWidth, self->_virtualRightMarginWidth, v11, v15, x, x + width);
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_opt_class();
    -[HKGraphView xAxis](self, "xAxis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_rangeFromModelCoordinateMin:max:axis:", v21, v17, v19);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = v7;
  }

  return v22;
}

- (id)_effectiveVisibleRangeFromActualVisibleRange:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  if (-[HKGraphView _axisRangeIsDateRange](self, "_axisRangeIsDateRange"))
  {
    -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
    v6 = v5;
    v8 = v5 + v7;
    -[HKAxis transform](self->_xAxis, "transform");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinateForValue:", v10);
    v12 = v11;
    -[HKAxis transform](self->_xAxis, "transform");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "coordinateForValue:", v14);
    v16 = v15;

    +[HKAxis contractByPointsLow:high:modelRange:pointRange:](HKAxis, "contractByPointsLow:high:modelRange:pointRange:", self->_virtualLeftMarginWidth, self->_virtualRightMarginWidth, v12, v16, v6, v8);
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_opt_class();
    -[HKGraphView xAxis](self, "xAxis");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_rangeFromModelCoordinateMin:max:axis:", v22, v18, v20);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v4;
  }

  return v23;
}

- (id)_findActualAxisRangeFromVisibleRanges
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;

  -[HKAxis transform](self->_xAxis, "transform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange minValue](self->_effectiveVisibleRangeCadence, "minValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateForValue:", v4);
  v6 = v5;
  -[HKAxis transform](self->_xAxis, "transform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange minValue](self->_actualVisibleRange, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinateForValue:", v8);
  v10 = v6 - v9;

  -[HKAxis transform](self->_xAxis, "transform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange maxValue](self->_actualVisibleRange, "maxValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateForValue:", v12);
  v14 = v13;
  -[HKAxis transform](self->_xAxis, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange maxValue](self->_effectiveVisibleRangeCadence, "maxValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coordinateForValue:", v16);
  v18 = v14 - v17;

  -[HKAxis transform](self->_xAxis, "transform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange minValue](self->_effectiveAxisRange, "minValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "coordinateForValue:", v20);
  v22 = v21;

  -[HKAxis transform](self->_xAxis, "transform");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange maxValue](self->_effectiveAxisRange, "maxValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "coordinateForValue:", v24);
  v26 = v25;

  v27 = (void *)objc_opt_class();
  -[HKGraphView xAxis](self, "xAxis");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_rangeFromModelCoordinateMin:max:axis:", v28, v22 - v10, v18 + v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)setDisableXAxis:(BOOL)a3
{
  self->_disableXAxis = a3;
  -[HKGraphView _updateScene](self, "_updateScene");
}

- (void)seriesDidInvalidatePaths:(id)a3 newDataArrived:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphView.m"), 1308, CFSTR("HKGraphView seriesDidInvalidatePaths must be called on the main thread"));

  }
  if (!-[HKGraphView _drawingDuringScrolling](self, "_drawingDuringScrolling"))
  {
    -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
    -[HKGraphRenderer setNeedsRender](self->_yAxisLabelContent, "setNeedsRender");
  }
  if (v4 && -[HKGraphView _tilesAreEnabled](self, "_tilesAreEnabled"))
    -[HKGraphView _markTilesDirtyWithCompletion:](self, "_markTilesDirtyWithCompletion:", 0);
  -[HKGraphView _notifyDelegateSeriesUpdate:newDataArrived:](self, "_notifyDelegateSeriesUpdate:newDataArrived:", v8, v4);

}

- (void)nonemptyDrawComplete
{
  double v3;
  NSObject **v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[HKGraphView firstNonemptyDrawTime](self, "firstNonemptyDrawTime");
    if (v3 == 0.0)
    {
      -[HKGraphView setFirstNonemptyDrawTime:](self, "setFirstNonemptyDrawTime:", CACurrentMediaTime());
      v4 = (NSObject **)MEMORY[0x1E0CB5378];
      v5 = _HKLogSignpostIDGenerate();
      _HKInitializeLogging();
      v6 = *v4;
      if (os_signpost_enabled(v6))
      {
        v7 = v6;
        v8 = v7;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
        {
          *(_WORD *)v9 = 0;
          _os_signpost_emit_with_name_impl(&dword_1D7813000, v8, OS_SIGNPOST_EVENT, v5, "chart-ppt-nonempty-draw", ", v9, 2u);
        }

      }
    }
  }
}

- (double)snapScreenCoordinateToXAxisResolution:(double)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v28;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphView.m"), 1328, CFSTR("HKGraphView snapScreenCoordinateToXAxisResolution must be called on the main thread"));

  }
  if (-[HKGraphView xAxisDateZoom](self, "xAxisDateZoom") != 8)
  {
    -[HKGraphView xAxis](self, "xAxis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKGraphView actualVisibleRange](self, "actualVisibleRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "coordinateForValue:", v9);
    v11 = v10;
    -[HKGraphView xAxis](self, "xAxis");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pointTransform");
    v15 = HKLinearTransformValue(v13, v14, v11);

    +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", -[HKGraphView xAxisDateZoom](self, "xAxisDateZoom"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKGraphView resolutionFromTraitCollectionAttributes](self, "resolutionFromTraitCollectionAttributes");
    -[HKGraphView primarySeries](self, "primarySeries");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "resolutionForTimeScope:traitResolution:", -[HKGraphView xAxisDateZoom](self, "xAxisDateZoom"), v17);

    objc_msgSend(v16, "approximateSeriesPointIntervalAtResolution:", v19);
    objc_msgSend(v9, "dateByAddingTimeInterval:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coordinateForValue:", v20);
    v22 = v21;
    -[HKGraphView xAxis](self, "xAxis");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pointTransform");
    v26 = HKLinearTransformValue(v24, v25, v22);

    a3 = (v26 - v15) * 0.5 + floor(a3 / (v26 - v15)) * (v26 - v15);
  }
  return a3;
}

- (BOOL)rangeIsVisible:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphView.m"), 1357, CFSTR("HKGraphView rangeIsVisible must be called from the main thread"));

  }
  -[HKGraphView actualVisibleRange](self, "actualVisibleRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[HKGraphView visibleIntersectionForRange:visibleRange:](HKGraphView, "visibleIntersectionForRange:visibleRange:", v6, v7);

  return v8;
}

- (UIEdgeInsets)_virtualMarginInsets
{
  double virtualLeftMarginWidth;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  -[HKGraphView _inactiveRightAreaForRect:](self, "_inactiveRightAreaForRect:");
  virtualLeftMarginWidth = self->_virtualLeftMarginWidth;
  v5 = v4 + self->_virtualRightMarginWidth;
  v6 = 0.0;
  v7 = 0.0;
  result.right = v5;
  result.bottom = v7;
  result.left = virtualLeftMarginWidth;
  result.top = v6;
  return result;
}

- (BOOL)_drawingDuringScrolling
{
  if (-[UIScrollView isDragging](self->_scrollView, "isDragging")
    || -[UIScrollView isDecelerating](self->_scrollView, "isDecelerating"))
  {
    return 1;
  }
  else
  {
    return -[UIScrollView isScrollAnimating](self->_scrollView, "isScrollAnimating");
  }
}

+ (BOOL)visibleIntersectionForRange:(id)a3 visibleRange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compare:", v7);

  if (v9 == 1)
  {
    objc_msgSend(v6, "minValue");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  objc_msgSend(v5, "maxValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "compare:", v11);

  if (v13 == -1)
  {
    objc_msgSend(v6, "maxValue");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  v15 = objc_msgSend(v7, "compare:", v11) == -1;

  return v15;
}

- (id)_defaultXAxisValueRange
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[HKGraphZoomLevelConfiguration defaultCalendar](HKGraphZoomLevelConfiguration, "defaultCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKGraphZoomLevelConfiguration defaultCalendar](HKGraphZoomLevelConfiguration, "defaultCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_autoScaleXAxis
{
  double v3;
  double v4;
  HKAxis *xAxis;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (self->_actualAxisRange)
  {
    -[HKGraphView _contentWidth](self, "_contentWidth");
    v4 = v3;
    xAxis = self->_xAxis;
    v11[0] = self->_actualAxisRange;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxis _pointTransformFromSeriesRanges:linearTransform:chartRange:](xAxis, "_pointTransformFromSeriesRanges:linearTransform:chartRange:", v6, 0.0, 1.0, 0.0, v4);
    v8 = v7;
    v10 = v9;

    -[HKAxis setPointTransform:](self->_xAxis, "setPointTransform:", v8, v10);
  }
}

- (void)autoscaleYAxesAnimated:(BOOL)a3 specificRange:(id)a4 onlyIfNeeded:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(void);
  uint64_t v37;
  int v38;
  HKGraphView *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[6];
  id v46;
  void (**v47)(void);
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v7 = a5;
  v8 = a3;
  v54 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v36 = (void (**)(void))a6;
  v11 = -[HKGraphView _initializationPeriodIsActive](self, "_initializationPeriodIsActive");
  -[HKGraphView _autoscaleSeriesOnlyIfNeeded:](self, "_autoscaleSeriesOnlyIfNeeded:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v10;
  -[HKGraphView _autoscaleTransformsFromAutoscaleSeriesList:specificRange:](self, "_autoscaleTransformsFromAutoscaleSeriesList:specificRange:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    -[HKGraphView _cancelAutoscaleAnimations](self, "_cancelAutoscaleAnimations");
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (!v15)
  {

LABEL_26:
    if (objc_msgSend(v14, "count"))
      -[HKGraphView _markTilesDirtyWithCompletion:](self, "_markTilesDirtyWithCompletion:", 0);
    if (v36)
      v36[2]();
    goto LABEL_30;
  }
  v16 = v15;
  v34 = v12;
  v17 = 0;
  v18 = v8 & ~v11;
  v19 = *(_QWORD *)v49;
  v39 = self;
  v38 = v18;
  v37 = *(_QWORD *)v49;
  do
  {
    v20 = 0;
    v40 = v16;
    do
    {
      if (*(_QWORD *)v49 != v19)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v20);
      if (v18
        && -[HKGraphView _autoscaleTransformIsSignificant:](self, "_autoscaleTransformIsSignificant:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v20)))
      {
        -[HKGraphView _propertyAnimationForTransform:](self, "_propertyAnimationForTransform:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKGraphView _insertAutoscaleAnimation:](self, "_insertAutoscaleAnimation:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setProperty:", v23);
        -[HKGraphView _actionsBeforeAnimationTransform:](self, "_actionsBeforeAnimationTransform:", v21);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __76__HKGraphView_autoscaleYAxesAnimated_specificRange_onlyIfNeeded_completion___block_invoke;
        v45[3] = &unk_1E9C406A0;
        v45[4] = self;
        v45[5] = v21;
        v46 = v23;
        v47 = v36;
        v24 = v23;
        objc_msgSend(v22, "setCompletion:", v45);
        if (!v17)
          -[HKGraphView _autoscaleAnimationStart](self, "_autoscaleAnimationStart");
        -[HKPropertyAnimationApplier applyAnimation:](self->_animationApplier, "applyAnimation:", v22);
        ++v17;

      }
      else
      {
        objc_msgSend(v21, "yAxisForTransform");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "endingTransform");
        objc_msgSend(v25, "setPointTransform:");

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v21, "seriesForTransform");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
        if (v26)
        {
          v27 = v26;
          v28 = v17;
          v29 = v14;
          v30 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v42 != v30)
                objc_enumerationMutation(v22);
              v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(v21, "endingRange");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "updateForAutoscale:", v33);

            }
            v27 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
          }
          while (v27);
          v14 = v29;
          v17 = v28;
          self = v39;
          v16 = v40;
          v18 = v38;
          v19 = v37;
        }
      }

      ++v20;
    }
    while (v20 != v16);
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  }
  while (v16);

  v12 = v34;
  if (!v17)
    goto LABEL_26;
LABEL_30:

}

uint64_t __76__HKGraphView_autoscaleYAxesAnimated_specificRange_onlyIfNeeded_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v5, "endingRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_actionsAfterAnimationTransform:finalVisibleRange:", v5, v6);

  return objc_msgSend(*(id *)(a1 + 32), "_removeAutoscaleAnimationWithName:cancelled:completion:", *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56));
}

- (BOOL)_initializationPeriodIsActive
{
  double v3;
  double v4;
  double v6;

  v3 = CACurrentMediaTime();
  -[HKGraphView startTime](self, "startTime");
  if (v4 == 0.0)
    return 1;
  -[HKGraphView startTime](self, "startTime");
  return v3 - v6 < 1.5;
}

- (id)_autoscaleSeriesOnlyIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _HKGraphViewAutoscaleSeries *v15;
  _HKGraphViewAutoscaleSeries *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    v6 = 0;
    do
    {
      v20 = v6;
      -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v19 = v7;
      objc_msgSend(v7, "currentSeries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (!v3
              || -[HKGraphView _seriesRequiresYAutoscale:](self, "_seriesRequiresYAutoscale:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)))
            {
              objc_msgSend(v13, "yAxis");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKGraphView _findAutoscaleSeriesForYAxis:allAutoscaleSeries:](self, "_findAutoscaleSeriesForYAxis:allAutoscaleSeries:", v14, v5);
              v15 = (_HKGraphViewAutoscaleSeries *)objc_claimAutoreleasedReturnValue();

              if (!v15)
              {
                v16 = [_HKGraphViewAutoscaleSeries alloc];
                objc_msgSend(v13, "yAxis");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = -[_HKGraphViewAutoscaleSeries initWithAutoscaleGroupRow:autoscaleYAxis:](v16, "initWithAutoscaleGroupRow:autoscaleYAxis:", v20, v17);

                objc_msgSend(v5, "addObject:", v15);
              }
              -[_HKGraphViewAutoscaleSeries addAutoscaleSeries:](v15, "addAutoscaleSeries:", v13);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v10);
      }

      v6 = v20 + 1;
    }
    while (v20 + 1 < (unint64_t)-[NSMutableArray count](self->_seriesGroupRows, "count"));
  }
  return v5;
}

- (id)_findAutoscaleSeriesForYAxis:(id)a3 allAutoscaleSeries:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "autoscaleYAxis", (_QWORD)v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v5)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_autoscaleTransformIsSignificant:(id)a3
{
  id v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = a3;
  objc_msgSend(v3, "startingTransform");
  v6 = HKLinearTransformEqualToTransform(v4, v5, 0.0, 1.0);
  objc_msgSend(v3, "startingTransform");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v3, "endingTransform");
  v12 = v11;
  v14 = v13;

  return (v6 | HKLinearTransformEqualToTransform(v8, v10, v12, v14)) ^ 1;
}

- (BOOL)_seriesRequiresYAutoscale:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "yAxis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiresScaling");

  return v4;
}

- (id)_autoscaleTransformsFromAutoscaleSeriesList:(id)a3 specificRange:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
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
  id v26;
  void *v27;
  double MinY;
  double MaxY;
  double v30;
  void *v31;
  _BOOL4 v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _HKGraphViewYAxisTransform *v45;
  void *v46;
  void *v47;
  _HKGraphViewYAxisTransform *v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
        -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", objc_msgSend(v13, "autoscaleGroupRow"), v14, v15, v16, v17);
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v26 = v7;
        if (!v7)
        {
          -[HKGraphView _combinedYAxisRangeForAutoscaleSeries:yAxisRect:](self, "_combinedYAxisRangeForAutoscaleSeries:yAxisRect:", v13, v19, v21, v23, v25);
          v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        v27 = v26;
        if (v26 && v25 >= 0.0 && v23 >= 0.0)
        {
          v58.origin.x = v19;
          v58.origin.y = v21;
          v58.size.width = v23;
          v58.size.height = v25;
          MinY = CGRectGetMinY(v58);
          v59.origin.x = v19;
          v59.origin.y = v21;
          v59.size.width = v23;
          v59.size.height = v25;
          MaxY = CGRectGetMaxY(v59);
          v30 = MaxY - MinY;
          objc_msgSend(v13, "autoscaleSeries");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[HKGraphView _allSeriesAreInverted:](self, "_allSeriesAreInverted:", v31);

          if (v32)
          {
            MaxY = -MinY;
            v33 = 1.0;
          }
          else
          {
            v33 = -1.0;
          }
          objc_msgSend(v13, "autoscaleYAxis");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "pointTransform");
          v36 = v35;
          v38 = v37;

          objc_msgSend(v13, "autoscaleYAxis");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "_pointTransformFromSeriesRanges:linearTransform:chartRange:", v40, MaxY, v33, MinY, v30);
          v42 = v41;
          v44 = v43;

          v45 = [_HKGraphViewYAxisTransform alloc];
          objc_msgSend(v13, "autoscaleYAxis");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "autoscaleSeries");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[_HKGraphViewYAxisTransform initWithYAxis:seriesForTransform:startingTransform:endingTransform:endingRange:](v45, "initWithYAxis:seriesForTransform:startingTransform:endingTransform:endingRange:", v46, v47, v27, v36, v38, v42, v44);

          objc_msgSend(v50, "addObject:", v48);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v10);
  }

  return v50;
}

- (BOOL)_allSeriesAreInverted:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "shouldInvertAxis", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (id)_propertyAnimationForTransform:(id)a3
{
  id v3;
  HKPropertyAnimation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  v4 = objc_alloc_init(HKPropertyAnimation);
  v5 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v3, "startingTransform");
  objc_msgSend(v5, "valueWithHKLinearTransform:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPropertyAnimation setFromValue:](v4, "setFromValue:", v6);

  v7 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v3, "endingTransform");
  objc_msgSend(v7, "valueWithHKLinearTransform:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPropertyAnimation setToValue:](v4, "setToValue:", v8);

  -[HKPropertyAnimation setDuration:](v4, "setDuration:", 0.3);
  LODWORD(v9) = 1051361018;
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPropertyAnimation setTimingFunction:](v4, "setTimingFunction:", v13);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__HKGraphView__propertyAnimationForTransform___block_invoke;
  v16[3] = &unk_1E9C406C8;
  v17 = v3;
  v14 = v3;
  -[HKPropertyAnimation setPropertyApplicationFunction:](v4, "setPropertyApplicationFunction:", v16);

  return v4;
}

void __46__HKGraphView__propertyAnimationForTransform___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "HKLinearTransformValue");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "yAxisForTransform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPointTransform:", v4, v6);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "seriesForTransform", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(*(id *)(a1 + 32), "endingRange");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateForAutoscale:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)_actionsBeforeAnimationTransform:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "seriesForTransform", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
  {

LABEL_11:
    objc_msgSend(v3, "yAxisForTransform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAxisLabelEndings:", 3);

    goto LABEL_12;
  }
  v6 = v5;
  v7 = *(_QWORD *)v12;
  v8 = 1;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v8 &= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "adjustYAxisForLabels");
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v6);

  if ((v8 & 1) != 0)
    goto LABEL_11;
LABEL_12:

}

- (void)_actionsAfterAnimationTransform:(id)a3 finalVisibleRange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "seriesForTransform", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v8)
  {

LABEL_11:
    objc_msgSend(v5, "yAxisForTransform");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAxisLabelEndings:", 0);

    goto LABEL_12;
  }
  v9 = v8;
  v10 = *(_QWORD *)v16;
  v11 = 1;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      v11 &= objc_msgSend(v13, "adjustYAxisForLabels");
      objc_msgSend(v13, "updateForAutoscale:", v6);
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v9);

  if ((v11 & 1) != 0)
    goto LABEL_11;
LABEL_12:

}

- (void)_autoscaleAnimationStart
{
  -[HKGraphView setAnimationAutoscaleInProgress:](self, "setAnimationAutoscaleInProgress:", 1);
  -[HKGraphView setTilesTransientDisabled:](self, "setTilesTransientDisabled:", 1);
}

- (void)_autoscaleAnimationEnd
{
  _QWORD v3[5];

  -[HKGraphView setAnimationAutoscaleInProgress:](self, "setAnimationAutoscaleInProgress:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__HKGraphView__autoscaleAnimationEnd__block_invoke;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = self;
  -[HKGraphView _markTilesDirtyWithCompletion:](self, "_markTilesDirtyWithCompletion:", v3);
}

uint64_t __37__HKGraphView__autoscaleAnimationEnd__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTilesTransientDisabled:", 0);
}

- (void)_autoscaleAnimationCancelled
{
  -[HKGraphView setAnimationAutoscaleInProgress:](self, "setAnimationAutoscaleInProgress:", 0);
  -[HKGraphView setTilesTransientDisabled:](self, "setTilesTransientDisabled:", 0);
}

- (id)_insertAutoscaleAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[HKGraphView currentAnimationProperties](self, "currentAnimationProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("y_axis_point_transform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 1;
    v8 = CFSTR("y_axis_point_transform");
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%ld"), CFSTR("y_axis_point_transform"), v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v7;
      -[HKGraphView currentAnimationProperties](self, "currentAnimationProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v9;
    }
    while (v11);
  }
  else
  {
    v9 = CFSTR("y_axis_point_transform");
  }
  -[HKGraphView currentAnimationProperties](self, "currentAnimationProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v4, v9);

  return v9;
}

- (void)_removeAutoscaleAnimationWithName:(id)a3 cancelled:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a4;
  v13 = a5;
  v8 = a3;
  -[HKGraphView currentAnimationProperties](self, "currentAnimationProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v8);

  -[HKGraphView currentAnimationProperties](self, "currentAnimationProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = v13;
  if (!v11)
  {
    if (v5)
      -[HKGraphView _autoscaleAnimationCancelled](self, "_autoscaleAnimationCancelled");
    else
      -[HKGraphView _autoscaleAnimationEnd](self, "_autoscaleAnimationEnd");
    v12 = v13;
    if (v13)
    {
      (*((void (**)(id))v13 + 2))(v13);
      v12 = v13;
    }
  }

}

- (void)_cancelAutoscaleAnimations
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
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
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HKGraphView currentAnimationProperties](self, "currentAnimationProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[HKGraphView animationApplier](self, "animationApplier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cancelAnimationsForProperty:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[HKGraphView currentAnimationProperties](self, "currentAnimationProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

- (int64_t)resolutionFromTraitCollectionAttributes
{
  void *v2;
  uint64_t v3;

  -[HKGraphView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  return v3 == 2;
}

- (int64_t)_resolutionFromSeries:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "resolutionForTimeScope:traitResolution:", self->_xAxisDateZoom, -[HKGraphView resolutionFromTraitCollectionAttributes](self, "resolutionFromTraitCollectionAttributes"));

  return v5;
}

- (id)_combinedYAxisRangeForAutoscaleSeries:(id)a3 yAxisRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v24 = a3;
  objc_msgSend(v24, "autoscaleSeries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        v15 = -[HKGraphView _resolutionFromSeries:](self, "_resolutionFromSeries:", v14);
        -[HKGraphView effectiveVisibleRangeCadence](self, "effectiveVisibleRangeCadence");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "valueRangeForYAxisWithXAxisRange:dateZoom:resolution:chartRect:", v16, self->_xAxisDateZoom, v15, x, y, width, height);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "isCriticalForAutoscale"))
          v18 = v17 == 0;
        else
          v18 = 0;
        if (v18)
        {
          -[HKGraphView effectiveVisibleRangeCadence](self, "effectiveVisibleRangeCadence");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v14, "hasAnyDataLoadedInXAxisRange:dateZoom:resolution:", v19, self->_xAxisDateZoom, v15);

          if ((v20 & 1) == 0)
          {

            v22 = 0;
            goto LABEL_22;
          }
        }
        else if (v17)
        {
          if (v11)
            objc_msgSend(v11, "unionRange:", v17);
          else
            v11 = v17;
        }

        ++v13;
      }
      while (v10 != v13);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v10 = v21;
    }
    while (v21);
  }
  else
  {
    v11 = 0;
  }

  v11 = v11;
  v22 = v11;
LABEL_22:

  return v22;
}

- (double)_inactiveRightAreaForRect:(CGRect)a3
{
  double width;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;

  width = a3.size.width;
  v5 = 0.0;
  if (!-[HKValueRange isEqual:](self->_effectiveVisibleRangeCadence, "isEqual:", self->_effectiveVisibleRangeActive, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    -[HKAxis transform](self->_xAxis, "transform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKValueRange minValue](self->_actualVisibleRange, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinateForValue:", v7);
    v9 = v8;

    -[HKAxis transform](self->_xAxis, "transform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKValueRange maxValue](self->_actualVisibleRange, "maxValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinateForValue:", v11);
    v13 = v12;

    if (vabdd_f64(v13, v9) > 2.22044605e-16)
    {
      v14 = width / (v13 - v9);
      -[HKAxis transform](self->_xAxis, "transform");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKValueRange maxValue](self->_effectiveVisibleRangeCadence, "maxValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "coordinateForValue:", v16);
      v18 = v17;

      -[HKAxis transform](self->_xAxis, "transform");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKValueRange maxValue](self->_effectiveVisibleRangeActive, "maxValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "coordinateForValue:", v20);
      v22 = v21;

      return v14 * (v18 - v22);
    }
  }
  return v5;
}

- (double)_bottomBaselineYValueForChartRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  unint64_t v10;
  char v11;
  double v12;
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  double v34;
  double v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HKGraphView zoomScale](self, "zoomScale");
  v9 = v8;
  if (!-[NSMutableArray count](self->_seriesGroupRows, "count"))
    return -1.0;
  v10 = 0;
  v11 = 1;
  v12 = 2.22507386e-308;
  v34 = height;
  v35 = y;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v10, *(_QWORD *)&v34, *(_QWORD *)&v35);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", v10, x, y, width, height);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = v9;
    v21 = x;
    v22 = width;
    v24 = v23;
    -[HKGraphView _visibleSeriesForSeriesGroup:](self, "_visibleSeriesForSeriesGroup:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "yAxis");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "visibleValueRange");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v24;
    width = v22;
    x = v21;
    v9 = v20;
    objc_msgSend(v26, "bottomBaselineYCoordinateForModelRange:axisRect:zoomScale:", v27, v15, v17, v19, v28, v20);
    v30 = v29;

    if (v12 >= v30)
      v31 = v12;
    else
      v31 = v30;
    if (v26)
      v32 = v30 < -0.00000011920929;
    else
      v32 = 1;
    height = v34;
    y = v35;
    if (!v32)
    {
      v11 = 0;
      v12 = v31;
    }

    ++v10;
  }
  while (v10 < -[NSMutableArray count](self->_seriesGroupRows, "count"));
  if ((v11 & 1) != 0)
    return -1.0;
  return v12;
}

- (double)_topBaselineYValueForChartRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  unint64_t v10;
  char v11;
  double v12;
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  double v34;
  double v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HKGraphView zoomScale](self, "zoomScale");
  v9 = v8;
  if (!-[NSMutableArray count](self->_seriesGroupRows, "count"))
    return -1.0;
  v10 = 0;
  v11 = 1;
  v12 = 1.79769313e308;
  v34 = height;
  v35 = y;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v10, *(_QWORD *)&v34, *(_QWORD *)&v35);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", v10, x, y, width, height);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = v9;
    v21 = x;
    v22 = width;
    v24 = v23;
    -[HKGraphView _visibleSeriesForSeriesGroup:](self, "_visibleSeriesForSeriesGroup:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "yAxis");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "visibleValueRange");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v24;
    width = v22;
    x = v21;
    v9 = v20;
    objc_msgSend(v26, "topBaselineYCoordinateForModelRange:axisRect:zoomScale:", v27, v15, v17, v19, v28, v20);
    v30 = v29;

    if (v12 >= v30)
      v31 = v30;
    else
      v31 = v12;
    if (v26)
      v32 = v30 < -0.00000011920929;
    else
      v32 = 1;
    height = v34;
    y = v35;
    if (!v32)
    {
      v11 = 0;
      v12 = v31;
    }

    ++v10;
  }
  while (v10 < -[NSMutableArray count](self->_seriesGroupRows, "count"));
  if ((v11 & 1) != 0)
    return -1.0;
  return v12;
}

- (id)_gridlineRangesForChartRect:(CGRect)a3
{
  double x;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  double y;
  double width;
  double height;

  width = a3.size.width;
  height = a3.size.height;
  y = a3.origin.y;
  if (self->_drawsGridlinesPerSeriesGroup)
  {
    x = a3.origin.x;
    -[HKGraphView zoomScale](self, "zoomScale");
    v6 = v5;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[NSMutableArray count](self->_seriesGroupRows, "count"))
    {
      v8 = 0;
      while (1)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", v8, x, y, width, height);
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        -[HKGraphView _visibleSeriesForSeriesGroup:](self, "_visibleSeriesForSeriesGroup:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "yAxis");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
          break;
        objc_msgSend(v18, "visibleValueRange");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bottomBaselineYCoordinateForModelRange:axisRect:zoomScale:", v20, v11, v13, v15, v17, v6);
        v22 = v21;

        if (v22 < 0.00000011920929)
          v22 = v13 + v17;
        objc_msgSend(v18, "visibleValueRange");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "topBaselineYCoordinateForModelRange:axisRect:zoomScale:", v23, v11, v13, v15, v17, v6);
        v25 = v24;

        if (v22 < 0.00000011920929 || v25 < 0.00000011920929)
          break;
        *(float *)&v26 = v22;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v29 = v25;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v30, v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v31);

        if (++v8 >= (unint64_t)-[NSMutableArray count](self->_seriesGroupRows, "count"))
          goto LABEL_12;
      }

      v32 = 0;
    }
    else
    {
LABEL_12:
      v32 = v7;
    }

  }
  else
  {
    v32 = 0;
  }
  return v32;
}

- (void)_updateAllLegendsWithSelectedValues:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_seriesGroupRows;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "legendView", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if (v4
            && objc_msgSend(v4, "count")
            && (objc_msgSend(v10, "legendView"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v12, "opaqueBackground"),
                v12,
                v13))
          {
            objc_msgSend(v10, "legendView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "showLollipopsWithSelectedValues:", v4);
          }
          else
          {
            objc_msgSend(v10, "legendView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "hideLollipops");
          }

        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)_visibleSeriesForSeriesGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "selectionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closestSeriesToSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v3, "currentSeries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_renderYAxisLabelsInContext:(CGContext *)a3 chartRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  void *v16;
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
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD v35[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[HKGraphView zoomScale](self, "zoomScale", a3);
  v10 = v9;
  -[HKGraphView contentOffset](self, "contentOffset");
  v12 = v11;
  v14 = v13;
  if (-[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    v15 = 0;
    v32 = v10;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKGraphRenderer bounds](self->_yAxisLabelContent, "bounds");
      v33 = v17;
      v34 = v18;
      -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", v15, x, y, width, height);
      v19 = v12;
      v20 = y;
      v21 = height;
      v23 = v22;
      v24 = width;
      v26 = v25;
      v35[0] = 0;
      v35[1] = 0x4030000000000000;
      -[HKGraphView _visibleSeriesForSeriesGroup:](self, "_visibleSeriesForSeriesGroup:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "visibleValueRange");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "yAxis");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v23;
      height = v21;
      y = v20;
      v12 = v19;
      v31 = v26;
      width = v24;
      objc_msgSend(v29, "drawLabelsWithModelRange:chartRect:zoomScale:contentOffset:renderView:maximumLabelSize:omitOffscreenLabels:", v28, self->_yAxisLabelContent, v35, 0, v33, v30, v34, v31, v32, v19, v14);

      ++v15;
    }
    while (v15 < -[NSMutableArray count](self->_seriesGroupRows, "count"));
  }
}

- (_HKLocationSpan)_locationSpanForSeriesGroupRow:(int64_t)a3 chartRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  id WeakRetained;
  char v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  _HKLocationSpan result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v39 = *MEMORY[0x1E0C80C00];
  v10 = -[NSMutableArray count](self->_seriesGroupRows, "count");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "stackedSeriesGroupHeightsForGraphView:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && objc_msgSend(v14, "count") > (unint64_t)a3)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v35;
        v20 = height;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v35 != v19)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v22, "kind", (_QWORD)v34) == 1)
            {
              objc_msgSend(v22, "heightValue");
              v20 = v20 - v23;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v18);
      }
      else
      {
        v20 = height;
      }

    }
    else
    {
      v15 = 0;
      v20 = height;
    }

  }
  else
  {
    v15 = 0;
    v20 = height;
  }
  if (a3 < 1)
  {
    v26 = y;
  }
  else
  {
    -[HKGraphView _locationSpanForSeriesGroupRow:chartRect:](self, "_locationSpanForSeriesGroupRow:chartRect:", a3 - 1, x, y, width, height);
    v26 = v24 + v25;
  }
  v27 = floor(height * (1.0 / (double)v10));
  if (v15)
  {
    v28 = objc_msgSend(v15, "kind");
    if (v28 == 1)
    {
      objc_msgSend(v15, "heightValue");
    }
    else
    {
      if (v28)
        goto LABEL_28;
      objc_msgSend(v15, "heightValue");
      v30 = v20 * v29;
    }
    v27 = floor(v30);
  }
LABEL_28:
  if (v10 - 1 == a3)
    v31 = y + height - v26;
  else
    v31 = v27;

  v32 = v26;
  v33 = v31;
  result.var1 = v33;
  result.var0 = v32;
  return result;
}

- (CGRect)_yAxisRectForSeriesGroupRow:(int64_t)a3 insetForLegends:(BOOL)a4 chartRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v9;
  void *v12;
  double v13;
  double v14;
  unint64_t outlineOptions;
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
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastLegendSize");
  v14 = v13;
  outlineOptions = self->_outlineOptions;
  v16 = 0.0;
  v17 = 0.0;
  if ((outlineOptions & 1) != 0)
  {
    v17 = HKUIOnePixel();
    outlineOptions = self->_outlineOptions;
  }
  if ((outlineOptions & 4) != 0)
    v16 = HKUIOnePixel();
  v18 = -0.0;
  if (v9)
    v18 = v14;
  v19 = v18 + v17;
  -[HKGraphView _locationSpanForSeriesGroupRow:chartRect:](self, "_locationSpanForSeriesGroupRow:chartRect:", a3, x, y, width, height);
  v21 = v19 + v20;
  v23 = v22 - (v19 + v16);

  v24 = x + 0.0;
  v25 = v21;
  v26 = width;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_yAxisRectForSeriesGroupRow:(int64_t)a3 chartRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[HKGraphView _yAxisRectForSeriesGroupRow:insetForLegends:chartRect:](self, "_yAxisRectForSeriesGroupRow:insetForLegends:chartRect:", a3, -[HKGraphView _anySeriesWantsInternalLegends:](self, "_anySeriesWantsInternalLegends:") ^ 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)_anySeriesWantsInternalLegends:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "currentSeries", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "drawLegendInsideSeries") & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)_skipRenderingToView:(id)a3 yAxisView:(id)a4 context:(CGContext *)a5 chartRect:(CGRect)a6
{
  id v8;
  id v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  id v14;
  CGRect v15;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "bounds");
  if (!CGRectIsEmpty(v15) && -[HKGraphView contentOffsetIsSet](self, "contentOffsetIsSet"))
  {
    if (!-[HKGraphView _needsYAxisUpdateDuringRender](self, "_needsYAxisUpdateDuringRender")
      || !-[HKGraphView _configureYAxisViewIfNeeded](self, "_configureYAxisViewIfNeeded"))
    {
      v10 = 0;
      goto LABEL_7;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__HKGraphView__skipRenderingToView_yAxisView_context_chartRect___block_invoke;
    v12[3] = &unk_1E9C3FC50;
    v13 = v8;
    v14 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
  v10 = 1;
LABEL_7:

  return v10;
}

uint64_t __64__HKGraphView__skipRenderingToView_yAxisView_context_chartRect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsRender");
  return objc_msgSend(*(id *)(a1 + 40), "setNeedsRender");
}

- (id)_createRendererSeriesRowFromIndex:(int64_t)a3 insetDataArea:(CGRect)a4 drawingToTile:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  HKGraphViewRendererSeriesRow *v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView _visibleSeriesForSeriesGroup:](self, "_visibleSeriesForSeriesGroup:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "selectionContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "closestSeriesToSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  v16 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(v11, "selectionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selectedRangeBoundariesXValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithArray:", v18);

  v20 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(v11, "currentSeries");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithArray:", v21);

  objc_msgSend(v11, "selectionContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "touchPoints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a3, x, y, width, height);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  if (a5)
  {
    v34 = 0;
  }
  else
  {
    objc_msgSend(v11, "axisAnnotationHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = -[HKGraphViewRendererSeriesRow initWithRowSeries:mainSeriesForRow:selectedSeriesForRow:selectedRangeBoundariesXValue:selectedTouchPointCount:yAxisRect:axisAnnotationHandler:]([HKGraphViewRendererSeriesRow alloc], "initWithRowSeries:mainSeriesForRow:selectedSeriesForRow:selectedRangeBoundariesXValue:selectedTouchPointCount:yAxisRect:axisAnnotationHandler:", v22, v12, v15, v19, v25, v34, v27, v29, v31, v33);

  return v35;
}

- (id)_createRendererSeriesConfigurationWithInsetDataArea:(CGRect)a3 drawingToTile:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  id v10;
  unint64_t v11;
  void *v12;
  HKGraphViewRendererSeriesConfiguration *v13;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    v11 = 0;
    do
    {
      -[HKGraphView _createRendererSeriesRowFromIndex:insetDataArea:drawingToTile:](self, "_createRendererSeriesRowFromIndex:insetDataArea:drawingToTile:", v11, v4, x, y, width, height);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

      ++v11;
    }
    while (v11 < -[NSMutableArray count](self->_seriesGroupRows, "count"));
  }
  v13 = -[HKGraphViewRendererSeriesConfiguration initWithRendererSeriesRows:]([HKGraphViewRendererSeriesConfiguration alloc], "initWithRendererSeriesRows:", v10);

  return v13;
}

- (id)_createRendererWithCurrentStateWithChartRect:(CGRect)a3 contentOffset:(CGPoint)a4 drawingToTile:(BOOL)a5 tileColumn:(int64_t)a6 effectiveVisibleRangeCadence:(id)a7 effectiveVisibleRangeActive:(id)a8 actualVisibleRange:(id)a9
{
  _BOOL8 v11;
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
  HKGraphViewRendererVirtualMarginConfiguration *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  HKAxis *xAxis;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  HKGraphViewRenderer *v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  HKGraphViewRenderer *v59;
  BOOL v60;
  int64_t xAxisDateZoom;
  HKGraphRenderer *renderView;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  HKGraphViewRendererVirtualMarginConfiguration *v71;
  CGFloat v72;
  double v73;
  double y;
  double x;
  void *v76;
  id v77;
  id v78;
  id v79;
  _BOOL4 v80;
  double v82;
  void *v83;
  _OWORD v85[3];
  __int128 v86;
  __int128 v87;
  __int128 v88;

  v11 = a5;
  y = a4.y;
  x = a4.x;
  v79 = a9;
  v78 = a8;
  v77 = a7;
  -[HKGraphView _dataAreaInsets](self, "_dataAreaInsets");
  v14 = v13;
  v16 = v15;
  v82 = v17;
  v73 = v18;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[HKGraphView _createRendererSeriesConfigurationWithInsetDataArea:drawingToTile:](self, "_createRendererSeriesConfigurationWithInsetDataArea:drawingToTile:", v11);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = [HKGraphViewRendererVirtualMarginConfiguration alloc];
  -[HKGraphView virtualLeftMarginWidth](self, "virtualLeftMarginWidth");
  v29 = v28;
  -[HKGraphView virtualRightMarginWidth](self, "virtualRightMarginWidth");
  v31 = v30;
  v80 = v11;
  if (v11)
  {
    v32 = 0;
    v33 = 0;
  }
  else
  {
    v32 = -[HKGraphView virtualLeftMarginStyle](self, "virtualLeftMarginStyle");
    v33 = -[HKGraphView virtualRightMarginStyle](self, "virtualRightMarginStyle");
  }
  v72 = a3.size.height - (v14 + v82);
  v71 = -[HKGraphViewRendererVirtualMarginConfiguration initWithVirtualLeftMarginWidth:virtualRightMarginWidth:virtualLeftMarginStyle:virtualRightMarginStyle:](v27, "initWithVirtualLeftMarginWidth:virtualRightMarginWidth:virtualLeftMarginStyle:virtualRightMarginStyle:", v32, v33, v29, v31);
  -[HKGraphView _topBaselineYValueForChartRect:](self, "_topBaselineYValueForChartRect:", v20, v22, v24, v26);
  v70 = v34;
  -[HKGraphView _bottomBaselineYValueForChartRect:](self, "_bottomBaselineYValueForChartRect:", v20, v22, v24, v26);
  v69 = v35;
  -[HKGraphView delegate](self, "delegate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "seriesSelectionLineColorForGraphView:", self);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphView _gridlineRangesForChartRect:](self, "_gridlineRangesForChartRect:", v20, v22, v24, v26);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView _scrollingAreaRect](self, "_scrollingAreaRect");
  v66 = v39;
  v67 = v38;
  v64 = v41;
  v65 = v40;
  -[HKGraphView _inactiveRightAreaForRect:](self, "_inactiveRightAreaForRect:", v20, v22, v24, v26);
  v68 = v42;
  -[HKGraphView zoomScale](self, "zoomScale");
  v44 = v43;
  v87 = 0u;
  v88 = 0u;
  v86 = 0u;
  -[HKGraphView _xAxisCoordinateTransformWithContentOffset:zoomScale:chartRect:](self, "_xAxisCoordinateTransformWithContentOffset:zoomScale:chartRect:", x, y, v43, v20, v22, v24, v26);
  v60 = -[HKGraphView _drawingDuringScrolling](self, "_drawingDuringScrolling");
  v63 = -[HKGraphView resolutionFromTraitCollectionAttributes](self, "resolutionFromTraitCollectionAttributes");
  v59 = [HKGraphViewRenderer alloc];
  xAxisDateZoom = self->_xAxisDateZoom;
  renderView = self->_renderView;
  v58 = -[HKGraphView animationAutoscaleInProgress](self, "animationAutoscaleInProgress");
  xAxis = self->_xAxis;
  -[HKGraphView outlineColor](self, "outlineColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView capturedTileBackgroundColor](self, "capturedTileBackgroundColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView selectionStyle](self, "selectionStyle");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[HKGraphView disableXAxis](self, "disableXAxis");
  -[HKGraphView xAxisSpace](self, "xAxisSpace");
  v51 = v50;
  v52 = -[HKGraphView measuringStartupTime](self, "measuringStartupTime");
  v85[0] = v86;
  v85[1] = v87;
  v85[2] = v88;
  LOBYTE(v57) = v52;
  LOBYTE(v56) = v49;
  BYTE1(v55) = v58;
  LOBYTE(v55) = v60;
  v53 = -[HKGraphViewRenderer initWithRendererSeries:renderingView:fullChartRect:insetChartRect:insetDataArea:rightHandInactiveArea:zoomScale:traitResolution:contentOffset:xAxisDateZoom:drawingToTile:tileColumn:drawingDuringScrolling:drawingDuringAutoscale:xAxis:xAxisCoordinateTransform:virtualMargins:outlineColor:tileBackgroundColor:topBaselineY:bottomBaselineY:selectionLineColor:selectionLineStyle:disableXAxis:currentXAxisHeight:gridlineRanges:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:scrollingAreaRect:chartMeasuringStartupTime:](v59, "initWithRendererSeries:renderingView:fullChartRect:insetChartRect:insetDataArea:rightHandInactiveArea:zoomScale:traitResolution:contentOffset:xAxisDateZoom:drawingToTile:tileColumn:drawingDuringScrolling:drawingDuringAutoscale:xAxis:xAxisCoordinateTransform:virtualMargins:outlineColor:tileBackgroundColor:topBaselineY:bottomBaselineY:selectionLineColor:selectionLineStyle:disableXAxis:currentXAxisHeight:gridlineRanges:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:scrollingAreaRect:chartMeasuringStartupTime:", v76, renderView, v63, xAxisDateZoom, v80, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x + v16, a3.origin.y + v14, a3.size.width - (v16 + v73),
          v72,
          *(_QWORD *)&v20,
          *(_QWORD *)&v22,
          *(_QWORD *)&v24,
          *(_QWORD *)&v26,
          v68,
          *(_QWORD *)&v44,
          *(_QWORD *)&x,
          *(_QWORD *)&y,
          v55,
          xAxis,
          v85,
          v71,
          v46,
          v47,
          v70,
          v69,
          v83,
          v48,
          v56,
          v51,
          v37,
          v77,
          v78,
          v79,
          v67,
          v66,
          v65,
          v64,
          v57);

  return v53;
}

- (void)_performPostAxisUpdates:(int64_t)a3 newXAxisHeight:(double)a4
{
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if ((a3 & 4) != 0)
  {
    -[HKGraphView _configureYAxisViewIfNeeded](self, "_configureYAxisViewIfNeeded");
    -[HKGraphRenderer setNeedsRender](self->_yAxisLabelContent, "setNeedsRender");
    self->_xAxisSpace = a4;
    -[HKGraphView _verticalAxisRect](self, "_verticalAxisRect");
    -[HKGraphRenderer setFrame:](self->_yAxisLabelContent, "setFrame:");
    v6 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__HKGraphView__performPostAxisUpdates_newXAxisHeight___block_invoke;
    v8[3] = &unk_1E9C3F0D0;
    v8[4] = self;
    -[HKGraphView _updateScrollViewPropertiesIgnoringScrollViewCallbacks:](self, "_updateScrollViewPropertiesIgnoringScrollViewCallbacks:", v8);
    -[HKGraphView autoscaleYAxesAnimated:specificRange:onlyIfNeeded:completion:](self, "autoscaleYAxesAnimated:specificRange:onlyIfNeeded:completion:", 0, 0, 0, 0);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __54__HKGraphView__performPostAxisUpdates_newXAxisHeight___block_invoke_2;
    v7[3] = &unk_1E9C3F0D0;
    v7[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  }
  else if ((a3 & 1) != 0)
  {
    if (-[HKGraphView _needsYAxisUpdateDuringRender](self, "_needsYAxisUpdateDuringRender", a4))
    {
      -[HKGraphView _configureYAxisViewIfNeeded](self, "_configureYAxisViewIfNeeded");
      -[HKGraphRenderer setNeedsRender](self->_yAxisLabelContent, "setNeedsRender");
    }
  }
}

uint64_t __54__HKGraphView__performPostAxisUpdates_newXAxisHeight___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateZoomForParameters");
  return objc_msgSend(*(id *)(a1 + 32), "_reconfigureScrollingTiles");
}

uint64_t __54__HKGraphView__performPostAxisUpdates_newXAxisHeight___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setNeedsRender");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setNeedsRender");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_dataAreaRect");
  return objc_msgSend(v2, "_layoutLegendsForChartRect:");
}

- (void)_performPostLeftMarginUpdates
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HKGraphView leftMarginViewRect](self, "leftMarginViewRect");
  -[HKBorderLineView setFrame:](self->_leftMarginView, "setFrame:");
  -[HKGraphView _gridlineRangesForChartRect:](self, "_gridlineRangesForChartRect:", v4, v6, v8, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView setVerticalDrawRanges:](self->_leftMarginView, "setVerticalDrawRanges:", v11);

}

- (void)graphRenderer:(id)a3 shouldRenderSceneWithContext:(CGContext *)a4 chartRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  HKGraphRenderer *v11;
  HKGraphRenderer *yAxisLabelContent;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  HKGraphRenderer *v28;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (HKGraphRenderer *)a3;
  yAxisLabelContent = self->_yAxisLabelContent;
  v28 = v11;
  if (self->_renderView == v11)
  {
    if (-[HKGraphView _skipRenderingToView:yAxisView:context:chartRect:](self, "_skipRenderingToView:yAxisView:context:chartRect:", v11, yAxisLabelContent, a4, x, y, width, height))
    {
      goto LABEL_10;
    }
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    v18 = v17;
    v20 = v19;
    -[HKGraphView effectiveVisibleRangeCadence](self, "effectiveVisibleRangeCadence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView effectiveVisibleRangeActive](self, "effectiveVisibleRangeActive");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView actualVisibleRange](self, "actualVisibleRange");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView _createRendererWithCurrentStateWithChartRect:contentOffset:drawingToTile:tileColumn:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:](self, "_createRendererWithCurrentStateWithChartRect:contentOffset:drawingToTile:tileColumn:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:", 0, -1, v21, v22, v23, x, y, width, height, v18, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "renderContentToContext:", a4);
    v25 = objc_msgSend(v24, "postUpdates");
    objc_msgSend(v24, "postXAxisHeight");
    -[HKGraphView _performPostAxisUpdates:newXAxisHeight:](self, "_performPostAxisUpdates:newXAxisHeight:", v25);
    -[HKGraphView _performPostLegendUpdates](self, "_performPostLegendUpdates");
    objc_msgSend(v24, "postOverlayData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView _drawOverlaysIfNeeded:](self, "_drawOverlaysIfNeeded:", v26);

    -[HKGraphView _performPostLeftMarginUpdates](self, "_performPostLeftMarginUpdates");
    objc_msgSend(v24, "postSelectionPoints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView _updateAllLegendsWithSelectedValues:](self, "_updateAllLegendsWithSelectedValues:", v27);

  }
  else if (yAxisLabelContent == v11)
  {
    -[HKGraphView _dataAreaInsets](self, "_dataAreaInsets");
    -[HKGraphView _renderYAxisLabelsInContext:chartRect:](self, "_renderYAxisLabelsInContext:chartRect:", a4, x + v16, y + v13, width - (v16 + v14), height - (v13 + v15));
  }
  -[HKGraphView _handleTilesInitialRender](self, "_handleTilesInitialRender");
  -[HKGraphView _scheduleExternalSelectionIfNeeded](self, "_scheduleExternalSelectionIfNeeded");
  if (-[HKGraphView measuringStartupTime](self, "measuringStartupTime") && self->_renderView == v28)
    -[HKGraphView _recordLastRenderTime](self, "_recordLastRenderTime");
  -[HKGraphView _notifyGraphViewRendered](self, "_notifyGraphViewRendered");
LABEL_10:

}

- (BOOL)allSeriesHaveDataAvailable
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  int64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  NSMutableArray *v19;
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
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = self->_seriesGroupRows;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v4 = *(_QWORD *)v25;
    v19 = v3;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v4)
          objc_enumerationMutation(v3);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v6, "currentSeries");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              v13 = -[HKGraphView _resolutionFromSeries:](self, "_resolutionFromSeries:", v12);
              -[HKGraphView actualVisibleRange](self, "actualVisibleRange");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v12) = objc_msgSend(v12, "hasAnyDataLoadedInXAxisRange:dateZoom:resolution:", v14, self->_xAxisDateZoom, v13);

              if (!(_DWORD)v12)
              {

                v15 = 0;
                v3 = v19;
                goto LABEL_19;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v9)
              continue;
            break;
          }
        }

        v3 = v19;
        v4 = v17;
      }
      v15 = 1;
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }
  else
  {
    v15 = 1;
  }
LABEL_19:

  return v15;
}

- (double)zoomScale
{
  double result;

  -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
  return result;
}

- (void)setZoomScale:(double)a3 animated:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;

  -[UIScrollView zoomScale](self->_scrollView, "zoomScale", a4);
  if (!HKUIEqualCGFloats(v6, a3))
  {
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    v8 = v7;
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v10 = v9;
    -[UIScrollView bounds](self->_scrollView, "bounds");
    v11 = v10 - CGRectGetWidth(v15) + -2.0;
    -[UIScrollView setZoomScale:](self->_scrollView, "setZoomScale:", a3);
    if (v8 >= v11)
    {
      -[UIScrollView contentSize](self->_scrollView, "contentSize");
      v13 = v12;
      -[UIScrollView bounds](self->_scrollView, "bounds");
      v14 = v13 - CGRectGetWidth(v16);
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      -[HKGraphView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v14);
    }
  }
}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  _QWORD v11[7];
  BOOL v12;

  y = a3.y;
  x = a3.x;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v9 = v8;
  if (!HKUIEqualCGFloats(v10, x) || !HKUIEqualCGFloats(v9, y))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__HKGraphView_setContentOffset_animated___block_invoke;
    v11[3] = &unk_1E9C406F0;
    v11[4] = self;
    *(double *)&v11[5] = x;
    *(double *)&v11[6] = y;
    v12 = a4;
    -[HKGraphView _updateScrollViewPropertiesIgnoringScrollViewCallbacks:](self, "_updateScrollViewPropertiesIgnoringScrollViewCallbacks:", v11);
  }
  self->_contentOffsetIsSet = 1;
}

uint64_t __41__HKGraphView_setContentOffset_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setContentOffset:animated:", *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)stillAnimating:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  -[HKGraphRenderer layer](self->_renderView, "layer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count")
    || -[UIScrollView isDecelerating](self->_scrollView, "isDecelerating")
    || -[UIScrollView isTracking](self->_scrollView, "isTracking")
    || -[UIScrollView isZooming](self->_scrollView, "isZooming")
    || -[UIScrollView isZoomBouncing](self->_scrollView, "isZoomBouncing");

  return v6;
}

- (void)setDisableScrolling:(BOOL)a3
{
  self->_disableScrolling = a3;
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", !a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
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
  HKValueRange *v19;
  HKValueRange *actualVisibleRange;
  HKValueRange *v21;
  HKValueRange *effectiveVisibleRangeCadence;
  HKValueRange *v23;
  HKValueRange *effectiveVisibleRangeActive;
  id v25;

  v4 = a3;
  if (self->_shouldListenToScrollViewDelegate)
  {
    v25 = v4;
    -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[HKGraphView zoomScale](self, "zoomScale");
    v14 = v13;
    -[HKGraphView contentOffset](self, "contentOffset");
    v16 = v15;
    v18 = v17;
    -[HKAxis rangeForChartRect:zoomScale:contentOffset:](self->_xAxis, "rangeForChartRect:zoomScale:contentOffset:", v6, v8, v10, v12, v14, v15, v17);
    v19 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
    actualVisibleRange = self->_actualVisibleRange;
    self->_actualVisibleRange = v19;

    -[HKGraphView _effectiveVisibleRangeFromActualVisibleRange:](self, "_effectiveVisibleRangeFromActualVisibleRange:", self->_actualVisibleRange);
    v21 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
    effectiveVisibleRangeCadence = self->_effectiveVisibleRangeCadence;
    self->_effectiveVisibleRangeCadence = v21;

    -[HKGraphView _updateDateZoomIfNecessary](self, "_updateDateZoomIfNecessary");
    if (-[HKGraphView _tilesAreEnabled](self, "_tilesAreEnabled")
      && ((objc_msgSend(v25, "isDragging") & 1) != 0
       || (objc_msgSend(v25, "isDecelerating") & 1) != 0
       || objc_msgSend(v25, "isScrollAnimating")))
    {
      objc_storeStrong((id *)&self->_effectiveVisibleRangeActive, self->_effectiveVisibleRangeCadence);
      -[HKGraphView _showTiles](self, "_showTiles");
      -[HKGraphView _touchTilesForContentOffset:applyHysteresis:](self, "_touchTilesForContentOffset:applyHysteresis:", 1, v16, v18);
      -[HKGraphView _updateLegendsForAllSeriesGroups](self, "_updateLegendsForAllSeriesGroups");
    }
    else
    {
      -[HKGraphView _rangeFromRange:withStartOfRange:](self, "_rangeFromRange:withStartOfRange:", self->_effectiveVisibleRangeActive, self->_effectiveVisibleRangeCadence);
      v23 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
      effectiveVisibleRangeActive = self->_effectiveVisibleRangeActive;
      self->_effectiveVisibleRangeActive = v23;

      -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
    }
    -[HKGraphView _notifyDelegateOfVisibleValueRange:changeContext:](self, "_notifyDelegateOfVisibleValueRange:changeContext:", self->_effectiveVisibleRangeActive, objc_msgSend(v25, "isDragging"));
    v4 = v25;
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    -[HKGraphView _hideTiles](self, "_hideTiles", a3);
    -[HKGraphView _notifyDelegateOfFinishUserScrolling](self, "_notifyDelegateOfFinishUserScrolling");
  }
}

- (void)_snapXAxisRangeToPreservedRange
{
  if (self->_destinationEffectiveVisibleRangeActive)
    -[HKGraphView _restoreDestinationActiveRange](self, "_restoreDestinationActiveRange");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[HKGraphView _snapXAxisRangeToPreservedRange](self, "_snapXAxisRangeToPreservedRange", a3);
  -[HKGraphView _hideTiles](self, "_hideTiles");
  -[HKGraphView _notifyDelegateOfVisibleValueRange:changeContext:](self, "_notifyDelegateOfVisibleValueRange:changeContext:", self->_effectiveVisibleRangeActive, 0);
  -[HKGraphView _notifyDelegateOfFinishUserScrolling](self, "_notifyDelegateOfFinishUserScrolling");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[HKGraphView _snapXAxisRangeToPreservedRange](self, "_snapXAxisRangeToPreservedRange", a3);
  -[HKGraphView _hideTiles](self, "_hideTiles");
  -[HKGraphView _notifyDelegateOfVisibleValueRange:changeContext:](self, "_notifyDelegateOfVisibleValueRange:changeContext:", self->_effectiveVisibleRangeActive, 0);
  -[HKGraphView _notifyDelegateOfFinishUserScrolling](self, "_notifyDelegateOfFinishUserScrolling");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  HKAxis *v9;
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
  HKAxis *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  HKValueRange *effectiveAxisRange;
  void *v31;
  void *v32;
  void *v33;
  HKValueRange *v34;
  void *v35;
  void *v36;
  CGPoint v37;

  y = a4.y;
  x = a4.x;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = self->_xAxis;
    -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[HKGraphView zoomScale](self, "zoomScale");
    v19 = v18;
    -[HKGraphView zoomScale](self, "zoomScale");
    v20 = v9;
    v21 = -[HKAxis dateZoomForZoomScale:](v9, "dateZoomForZoomScale:");
    v37 = (CGPoint)*MEMORY[0x1E0C9D538];
    -[HKAxis rangeForChartRect:zoomScale:contentOffset:](self->_xAxis, "rangeForChartRect:zoomScale:contentOffset:", v11, v13, v15, v17, v19, a5->x, a5->y);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView _effectiveVisibleRangeFromActualVisibleRange:](self, "_effectiveVisibleRangeFromActualVisibleRange:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKGraphView delegate](self, "delegate");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24
      && (v25 = (void *)v24,
          -[HKGraphView delegate](self, "delegate"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_opt_respondsToSelector(),
          v26,
          v25,
          (v27 & 1) != 0))
    {
      -[HKGraphView delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "defaultAlignmentForTimeScope:", v21);

    }
    else
    {
      v29 = 3;
    }
    effectiveAxisRange = self->_effectiveAxisRange;
    -[HKGraphView currentCalendar](self, "currentCalendar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKGraphZoomLevelConfiguration snappingRangeForRange:axisRange:timeScope:velocity:calendar:options:alignment:](HKGraphZoomLevelConfiguration, "snappingRangeForRange:axisRange:timeScope:velocity:calendar:options:alignment:", v23, effectiveAxisRange, v21, v31, self->_scrollingOptions, v29, x, y);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
    -[HKGraphView _actualVisibleRangeFromEffectiveVisibleRange:dataAreaRect:](self, "_actualVisibleRangeFromEffectiveVisibleRange:dataAreaRect:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxis offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:](v20, "offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:", v33, 0, &v37, v11, v13, v15, v17);
    *a5 = v37;
    v34 = self->_effectiveAxisRange;
    -[HKGraphView currentCalendar](self, "currentCalendar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKGraphZoomLevelConfiguration activeRangeFromCadenceRange:timeScope:axisRange:calendar:](HKGraphZoomLevelConfiguration, "activeRangeFromCadenceRange:timeScope:axisRange:calendar:", v32, v21, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKGraphView _preserveDestinationActiveRange:](self, "_preserveDestinationActiveRange:", v36);
  }
}

- (void)_reloadViewScope
{
  -[HKGraphView _updateDateZoomIfNecessary](self, "_updateDateZoomIfNecessary");
  -[HKGraphView _loadSeriesForZoom:](self, "_loadSeriesForZoom:", self->_xAxisDateZoom);
  -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
  -[HKGraphRenderer setNeedsRender](self->_yAxisLabelContent, "setNeedsRender");
  -[HKGraphView _createLegendsIfNecessary](self, "_createLegendsIfNecessary");
}

- (void)_updateDateZoomIfNecessary
{
  int64_t xAxisDateZoom;
  HKAxis *xAxis;
  int64_t v5;

  xAxisDateZoom = self->_xAxisDateZoom;
  xAxis = self->_xAxis;
  -[HKGraphView zoomScale](self, "zoomScale");
  v5 = -[HKAxis dateZoomForZoomScale:](xAxis, "dateZoomForZoomScale:");
  if (v5 != xAxisDateZoom)
  {
    self->_xAxisDateZoom = v5;
    -[HKGraphView _notifyDateZoomDidChangeFromValue:toValue:](self, "_notifyDateZoomDidChangeFromValue:toValue:", xAxisDateZoom, v5);
  }
}

- (double)_maxTimeThreshold
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[HKAxis transform](self->_xAxis, "transform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange maxValue](self->_effectiveVisibleRangeCadence, "maxValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateForValue:", v4);
  v6 = v5;
  -[HKAxis transform](self->_xAxis, "transform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange minValue](self->_effectiveVisibleRangeCadence, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinateForValue:", v8);
  v10 = v6 - v9;

  return v10;
}

- (void)_updateAxisZoomScaleValueRange
{
  double v3;
  double v4;
  id v5;

  if (-[HKGraphView _axisRangeIsDateRange](self, "_axisRangeIsDateRange"))
  {
    -[HKGraphView _maxTimeThreshold](self, "_maxTimeThreshold");
    v4 = v3;
    -[HKAxis zoomScaleEngine](self->_xAxis, "zoomScaleEngine");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUnitZoomScaleValueRangeForTimeInterval:", v4);

  }
}

- (double)_maximumZoomScale
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double result;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  BOOL v19;

  if (-[HKGraphView _axisRangeIsDateRange](self, "_axisRangeIsDateRange") && self->_contentWidthFromTimeScope)
  {
    if (self->_enableZoomInGesture)
    {
      -[HKGraphView _maxTimeThreshold](self, "_maxTimeThreshold");
      v4 = v3;
      +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", self->_minimumDateZoom);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "zoomLevelThreshold");
      v7 = v6;

      return v4 / v7;
    }
    else
    {
      return 1.0;
    }
  }
  else
  {
    result = 1.0;
    if (self->_actualVisibleRange && self->_actualAxisRange)
    {
      v9 = (void *)objc_opt_class();
      -[HKGraphView actualAxisRange](self, "actualAxisRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKGraphView xAxis](self, "xAxis");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_modelCoordinateSpanForRange:axis:", v10, v11);
      v13 = v12;

      v14 = (void *)objc_opt_class();
      -[HKGraphView actualVisibleRange](self, "actualVisibleRange");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKGraphView xAxis](self, "xAxis");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_modelCoordinateSpanForRange:axis:", v15, v16);
      v18 = v17;

      v19 = v18 >= v13 || v18 <= 0.0;
      result = v13 / v18;
      if (v19)
        return 1.0;
    }
  }
  return result;
}

- (double)_contentWidth
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v16;

  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v4 = v3;
  v5 = (void *)objc_opt_class();
  -[HKGraphView effectiveAxisRange](self, "effectiveAxisRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView xAxis](self, "xAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_modelCoordinateSpanForRange:axis:", v6, v7);
  v9 = v8;

  v10 = (void *)objc_opt_class();
  -[HKGraphView effectiveVisibleRangeCadence](self, "effectiveVisibleRangeCadence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView xAxis](self, "xAxis");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_modelCoordinateSpanForRange:axis:", v11, v12);
  v14 = v13;

  if (fabs(v14) < 2.22044605e-16)
    return v4;
  v16 = self->_virtualLeftMarginWidth + self->_virtualRightMarginWidth;
  return v16 + (v4 - v16) * (v9 / v14);
}

- (void)_updateZoomForParameters
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double Height;
  CGRect v17;

  -[HKGraphView _maximumZoomScale](self, "_maximumZoomScale");
  v4 = v3;
  -[HKGraphView _contentWidth](self, "_contentWidth");
  v6 = v5;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = HKUICeilToScreenScale(v6);
  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  Height = CGRectGetHeight(v17);
  -[UIScrollView setZoomScale:](self->_scrollView, "setZoomScale:", 1.0);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v15, Height);
  -[UIScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", 1.0);
  -[UIScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", v4);
}

- (void)_restoreDestinationActiveRange
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[HKGraphView destinationEffectiveVisibleRangeActive](self, "destinationEffectiveVisibleRangeActive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKGraphView destinationEffectiveVisibleRangeActive](self, "destinationEffectiveVisibleRangeActive");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HKGraphView _setRangesForActiveVisibleRange:](self, "_setRangesForActiveVisibleRange:", v4);

    if (v5)
      -[HKGraphView _finishSelection](self, "_finishSelection");
    -[HKGraphView setDestinationEffectiveVisibleRangeActive:](self, "setDestinationEffectiveVisibleRangeActive:", 0);
    -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
  }
}

- (void)_scrollToCurrentVisibleRangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;

  v3 = a3;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  if (self->_effectiveVisibleRangeCadence)
  {
    if (self->_xAxis)
    {
      v9 = v5;
      v10 = v6;
      v11 = v7;
      v12 = v8;
      if (!CGRectIsEmpty(*(CGRect *)&v5))
      {
        v13 = *MEMORY[0x1E0C9D538];
        -[HKAxis offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:](self->_xAxis, "offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:", self->_actualVisibleRange, 0, &v13, v9, v10, v11, v12);
        if (v3)
          -[HKGraphView _preserveDestinationActiveRange:](self, "_preserveDestinationActiveRange:", self->_effectiveVisibleRangeActive);
        -[HKGraphView setContentOffset:animated:](self, "setContentOffset:animated:", v3, v13);
      }
    }
  }
}

- (void)_setNeedsUpdateGraphViewConfiguration
{
  _QWORD block[5];

  self->_needsUpdateGraphViewConfiguration = 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HKGraphView__setNeedsUpdateGraphViewConfiguration__block_invoke;
  block[3] = &unk_1E9C3F0D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __52__HKGraphView__setNeedsUpdateGraphViewConfiguration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateGraphViewConfigurationIfNecessary");
}

- (void)_updateGraphViewConfigurationIfNecessary
{
  if (self->_needsUpdateGraphViewConfiguration)
  {
    self->_needsUpdateGraphViewConfiguration = 0;
    -[HKGraphView _updateGraphViewConfiguration](self, "_updateGraphViewConfiguration");
  }
}

- (void)_updateScrollViewPropertiesIgnoringScrollViewCallbacks:(id)a3
{
  self->_shouldListenToScrollViewDelegate = 0;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_shouldListenToScrollViewDelegate = 1;
}

- (void)_addTapGestureRecognizerForTapOnView:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0DC3D80];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithTarget:action:", self, sel__tapOnViewAction_);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v5, "addGestureRecognizer:", v6);

}

- (void)_tapOnViewAction:(id)a3
{
  -[HKGraphView _finishSelection](self, "_finishSelection", a3);
  -[HKGraphView _notifyDelegateOfTapOnYAxis](self, "_notifyDelegateOfTapOnYAxis");
}

- (void)setDetailView:(id)a3
{
  UIView *v5;
  UIView *detailView;
  _BOOL4 v7;
  _BOOL4 v8;
  UIView *v9;

  v5 = (UIView *)a3;
  detailView = self->_detailView;
  if (detailView)
    v7 = 0;
  else
    v7 = v5 != 0;
  if (detailView)
    v8 = v5 == 0;
  else
    v8 = 0;
  if (detailView != v5)
  {
    v9 = v5;
    if (detailView)
      -[UIView removeFromSuperview](detailView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_detailView, a3);
    if (self->_detailView)
    {
      -[HKGraphView addSubview:](self, "addSubview:");
      -[HKGraphView _layoutDetailView](self, "_layoutDetailView");
    }
    v5 = v9;
    if (v7 || v8)
    {
      -[HKGraphView _setNeedsUpdateGraphViewConfiguration](self, "_setNeedsUpdateGraphViewConfiguration");
      v5 = v9;
    }
  }

}

- (void)_addTapGestureRecognizerForTogglingStickyToView:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0DC3D80];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithTarget:action:", self, sel__toggleStickySelectionAction_);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v5, "addGestureRecognizer:", v6);

}

- (void)_toggleStickySelectionAction:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[HKGraphView _invalidateExternalSelectionCancelTimer](self, "_invalidateExternalSelectionCancelTimer");
  -[HKGraphView _cancelExternalSelection](self, "_cancelExternalSelection");
  objc_msgSend(v4, "locationInView:", self->_renderView);
  v6 = v5;
  v8 = v7;

  -[HKGraphView _touchAtPoint:](self, "_touchAtPoint:", v6, v8);
}

- (void)_touchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_enableStickySelection && !self->_disableSelection)
  {
    y = a3.y;
    x = a3.x;
    -[HKGraphView _selectionRecognizerDidBeginWithTouchPoint:](self, "_selectionRecognizerDidBeginWithTouchPoint:");
    -[HKGraphView _activateStickySelection](self, "_activateStickySelection");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView _selectionRecognizerDidMoveWithTouchPoints:](self, "_selectionRecognizerDidMoveWithTouchPoints:", v7);

  }
}

- (void)setDisableSelection:(BOOL)a3
{
  _BOOL4 v3;
  UIScrollView *scrollView;

  v3 = a3;
  self->_disableSelection = a3;
  scrollView = self->_scrollView;
  if (v3)
    -[HKGraphView _removeSelectionRecognizerFromView:](self, "_removeSelectionRecognizerFromView:", scrollView);
  else
    -[HKGraphView _addSelectionRecognizerToView:](self, "_addSelectionRecognizerToView:", scrollView);
}

- (int64_t)_currentSelectionStateForSeriesGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  objc_msgSend(v3, "selectionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "selectionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "selectionState");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_enumerateSeriesSelectionRegionsForSeriesGroup:(id)a3 withBlock:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _BYTE *, double, double, double, double);
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MinX;
  double Width;
  double MinY;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  char v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v5 = a3;
  v6 = (void (**)(id, uint64_t, _BYTE *, double, double, double, double))a4;
  objc_msgSend(v5, "selectionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "seriesSelectionRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  Width = CGRectGetWidth(v26);
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.width = v13;
  v27.size.height = v15;
  MinY = CGRectGetMinY(v27);
  objc_msgSend(v5, "selectionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "selectionAreaMapping");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 >= 1)
  {
    v22 = 0;
    do
    {
      v24 = 0;
      v6[2](v6, v22, &v24, MinX, MinY + (double)v22 * 15.0, Width, 15.0);
      if (v24)
        v23 = 1;
      else
        v23 = v21 - 1 == v22;
      ++v22;
    }
    while (!v23);
  }

}

- (id)_closestGraphSeriesForTouchPoint:(CGPoint)a3 seriesGroup:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[HKGraphView _currentSelectionStateForSeriesGroup:](self, "_currentSelectionStateForSeriesGroup:", v7) == 2)
    goto LABEL_4;
  objc_msgSend(v7, "selectionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "seriesSelectionRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v34.origin.x = v10;
  v34.origin.y = v12;
  v34.size.width = v14;
  v34.size.height = v16;
  if (x < CGRectGetMinX(v34)
    || (v35.origin.x = v10, v35.origin.y = v12, v35.size.width = v14, v35.size.height = v16, x > CGRectGetMaxX(v35)))
  {
LABEL_4:
    v17 = 0;
  }
  else
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__2;
    v32 = __Block_byref_object_dispose__2;
    v33 = 0;
    v36.origin.x = v10;
    v36.origin.y = v12;
    v36.size.width = v14;
    v36.size.height = v16;
    if (y >= CGRectGetMinY(v36))
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __60__HKGraphView__closestGraphSeriesForTouchPoint_seriesGroup___block_invoke;
      v23[3] = &unk_1E9C40718;
      v25 = &v28;
      v24 = v7;
      v26 = x;
      v27 = y;
      -[HKGraphView _enumerateSeriesSelectionRegionsForSeriesGroup:withBlock:](self, "_enumerateSeriesSelectionRegionsForSeriesGroup:withBlock:", v24, v23);
      v19 = v24;
    }
    else
    {
      objc_msgSend(v7, "selectionContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectionAreaMapping");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v29[5];
      v29[5] = v21;

    }
    v17 = (id)v29[5];
    _Block_object_dispose(&v28, 8);

  }
  return v17;
}

BOOL __60__HKGraphView__closestGraphSeriesForTouchPoint_seriesGroup___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BOOL8 result;
  CGRect v20;

  objc_msgSend(*(id *)(a1 + 32), "selectionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectionAreaMapping");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", a2);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  v20.origin.x = a4;
  v20.origin.y = a5;
  v20.size.width = a6;
  v20.size.height = a7;
  result = CGRectContainsPoint(v20, *(CGPoint *)(a1 + 48));
  if (result)
    *a3 = 1;
  return result;
}

- (void)_addSelectionRecognizerToView:(id)a3
{
  HKMultiTouchPressGestureRecognizer *v4;
  HKMultiTouchPressGestureRecognizer *multiTouchGestureRecognizer;
  id v6;

  if (!self->_multiTouchGestureRecognizer)
  {
    v6 = a3;
    v4 = -[HKMultiTouchPressGestureRecognizer initWithTarget:action:]([HKMultiTouchPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__selectionRecognizerDidUpdate_);
    multiTouchGestureRecognizer = self->_multiTouchGestureRecognizer;
    self->_multiTouchGestureRecognizer = v4;

    -[HKMultiTouchPressGestureRecognizer setDelegate:](self->_multiTouchGestureRecognizer, "setDelegate:", self);
    -[HKMultiTouchPressGestureRecognizer setMaximumNumberOfTouches:](self->_multiTouchGestureRecognizer, "setMaximumNumberOfTouches:", 2);
    -[HKMultiTouchPressGestureRecognizer setRequiredPressDelay:](self->_multiTouchGestureRecognizer, "setRequiredPressDelay:", 0.2);
    objc_msgSend(v6, "addGestureRecognizer:", self->_multiTouchGestureRecognizer);

  }
}

- (void)_removeSelectionRecognizerFromView:(id)a3
{
  HKMultiTouchPressGestureRecognizer *multiTouchGestureRecognizer;
  HKMultiTouchPressGestureRecognizer *v5;

  multiTouchGestureRecognizer = self->_multiTouchGestureRecognizer;
  if (multiTouchGestureRecognizer)
  {
    objc_msgSend(a3, "removeGestureRecognizer:", multiTouchGestureRecognizer);
    v5 = self->_multiTouchGestureRecognizer;
    self->_multiTouchGestureRecognizer = 0;

  }
  -[HKGraphView _finishSelection](self, "_finishSelection", a3);
}

- (void)_selectionRecognizerDidUpdate:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "state");
  if ((unint64_t)(v4 - 3) < 3)
  {
    -[HKGraphView _selectionRecognizerDidFinish:](self, "_selectionRecognizerDidFinish:", v9);
LABEL_9:
    v6 = v9;
    goto LABEL_10;
  }
  if (v4 != 2)
  {
    v5 = v4 == 1;
    v6 = v9;
    if (!v5)
      goto LABEL_10;
    -[HKGraphView _selectionRecognizerDidBegin:](self, "_selectionRecognizerDidBegin:", v9);
    goto LABEL_9;
  }
  objc_msgSend(v9, "touches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKGraphView _touchesActuallyMoved:](self, "_touchesActuallyMoved:", v7);

  v6 = v9;
  if (v8)
  {
    -[HKGraphView _selectionRecognizerDidMove:](self, "_selectionRecognizerDidMove:", v9);
    goto LABEL_9;
  }
LABEL_10:

}

- (BOOL)_touchesActuallyMoved:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "previousLocationInView:", self, (_QWORD)v18);
        v11 = v10;
        v13 = v12;
        objc_msgSend(v9, "locationInView:", self);
        if (hypot(v11 - v14, v13 - v15) > 2.22044605e-16)
        {
          v16 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)_closestSeriesToPoint:(CGPoint)a3 allSeries:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t i;
  void *v26;
  int64_t v27;
  HKAxis *xAxis;
  double v29;
  double v30;
  id v31;
  double v33;
  _OWORD v35[3];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v33 = v6;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[HKGraphView zoomScale](self, "zoomScale");
  v14 = v13;
  -[HKGraphView contentOffset](self, "contentOffset");
  v16 = v15;
  v18 = v17;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  -[HKGraphView _xAxisCoordinateTransform](self, "_xAxisCoordinateTransform");
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = v5;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v37;
    v24 = 1.79769313e308;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v19);
        v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v27 = -[HKGraphView _resolutionFromSeries:](self, "_resolutionFromSeries:", v26);
        xAxis = self->_xAxis;
        v35[0] = v40;
        v35[1] = v41;
        v35[2] = v42;
        objc_msgSend(v26, "distanceFromTouchPoint:inChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:", xAxis, v27, v35, a3.x, a3.y, v33, v8, v10, v12, v14, v16, v18);
        if (v29 < v24)
        {
          v30 = v29;
          v31 = v26;

          v22 = v31;
          v24 = v30;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)gestureWillBeginWithRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__HKGraphView_gestureWillBeginWithRecognizer___block_invoke;
  v6[3] = &unk_1E9C40740;
  v6[4] = &v7;
  -[HKGraphView _walkAllSeries:](self, "_walkAllSeries:", v6);
  if (*((_BYTE *)v8 + 24))
    v5 = 2;
  else
    v5 = 1;
  -[HKMultiTouchPressGestureRecognizer setMaximumNumberOfTouches:](self->_multiTouchGestureRecognizer, "setMaximumNumberOfTouches:", v5);
  _Block_object_dispose(&v7, 8);

}

uint64_t __46__HKGraphView_gestureWillBeginWithRecognizer___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "supportsMultiTouchSelection");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (CGPoint)_touchPointForSeriesGroupIndex:(int64_t)a3 originalTouchPoint:(CGPoint)a4
{
  double y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v9 = (y / v8 + (double)a3) * (v8 / (double)(unint64_t)-[NSMutableArray count](self->_seriesGroupRows, "count"));
  v10 = x;
  result.y = v9;
  result.x = v10;
  return result;
}

- (void)_selectionRecognizerDidBegin:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "touchAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", self->_renderView);
  v6 = v5;
  v8 = v7;

  -[HKGraphView _selectionRecognizerDidBeginWithTouchPoint:](self, "_selectionRecognizerDidBeginWithTouchPoint:", v6, v8);
  -[HKGraphView _invalidateExternalSelectionCancelTimer](self, "_invalidateExternalSelectionCancelTimer");
  -[HKGraphView _selectionRecognizerDidMove:](self, "_selectionRecognizerDidMove:", v9);

}

- (void)_selectionRecognizerDidBeginWithTouchPoint:(CGPoint)a3
{
  double y;
  double x;
  unint64_t v6;

  y = a3.y;
  x = a3.x;
  if (-[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    v6 = 0;
    do
    {
      -[HKGraphView _touchPointForSeriesGroupIndex:originalTouchPoint:](self, "_touchPointForSeriesGroupIndex:originalTouchPoint:", v6, x, y);
      -[HKGraphView _handleStartTouchPoint:seriesGroupRow:](self, "_handleStartTouchPoint:seriesGroupRow:", v6++);
    }
    while (v6 < -[NSMutableArray count](self->_seriesGroupRows, "count"));
  }
  -[HKGraphView _notifyDidBeginSelection](self, "_notifyDidBeginSelection");
}

- (void)_handleStartTouchPoint:(CGPoint)a3 seriesGroupRow:(int64_t)a4
{
  double v6;
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
  double v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  int64_t v26;
  HKAxis *xAxis;
  double MinY;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  _HKGraphViewSelectionContext *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double MaxY;
  void *v44;
  _QWORD v45[15];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CGPoint v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  _QWORD v54[4];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;
  CGRect v68;

  v66 = *MEMORY[0x1E0C80C00];
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", a4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView zoomScale](self, "zoomScale");
  v15 = v14;
  -[HKGraphView contentOffset](self, "contentOffset");
  v17 = v16;
  v19 = v18;
  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  -[HKGraphView _xAxisCoordinateTransform](self, "_xAxisCoordinateTransform");
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v41, "currentSeries");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v59 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v26 = -[HKGraphView _resolutionFromSeries:](self, "_resolutionFromSeries:", v25);
        if (objc_msgSend(v25, "allowsSelection"))
        {
          xAxis = self->_xAxis;
          v55 = v62;
          v56 = v63;
          v57 = v64;
          if (objc_msgSend(v25, "containsCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:", xAxis, v26, &v55, v7, v9, v11, v13, v15, v17, v19))objc_msgSend(v20, "addObject:", v25);
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v22);
  }

  -[HKGraphView _closestSeriesToPoint:allSeries:](self, "_closestSeriesToPoint:allSeries:", v20, a3.x, a3.y);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObject:", v40);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v40, 0);
  v67.origin.x = v7;
  v67.origin.y = v9;
  v67.size.width = v11;
  v67.size.height = v13;
  MinY = CGRectGetMinY(v67);
  v68.origin.x = v7;
  v68.origin.y = v9;
  v68.size.width = v11;
  v68.size.height = v13;
  MaxY = CGRectGetMaxY(v68);
  if (objc_msgSend(v20, "count"))
  {
    v29 = (uint64_t)((MaxY - a3.y) / 15.0) - 1;
    v30 = (uint64_t)((a3.y - MinY) / 15.0) - 1;
    do
    {
      *(_QWORD *)&v55 = 0;
      *((_QWORD *)&v55 + 1) = &v55;
      v56 = 0x2020000000uLL;
      v54[0] = 0;
      v54[1] = v54;
      v54[2] = 0x2020000000;
      v54[3] = 0x7FEFFFFFFFFFFFFFLL;
      v50 = 0;
      v51 = &v50;
      v52 = 0x2020000000;
      v53 = 0;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __53__HKGraphView__handleStartTouchPoint_seriesGroupRow___block_invoke;
      v45[3] = &unk_1E9C40790;
      *(double *)&v45[8] = v7;
      *(double *)&v45[9] = v9;
      *(double *)&v45[10] = v11;
      *(double *)&v45[11] = v13;
      *(double *)&v45[12] = v15;
      *(double *)&v45[13] = v17;
      v47 = v63;
      v48 = v64;
      v46 = v62;
      *(double *)&v45[14] = v19;
      v49 = a3;
      v45[4] = self;
      v45[5] = v54;
      v45[6] = &v55;
      v45[7] = &v50;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v45);
      objc_msgSend(v20, "objectAtIndexedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 24));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectAtIndex:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 24));
      if (*((_BYTE *)v51 + 24))
      {
        v32 = v30 <= 0;
        v30 -= v30 > 0;
        if (v32)
          goto LABEL_17;
      }
      else if (v29 > 0)
      {
LABEL_17:
        v33 = objc_msgSend(v44, "count");
        --v29;
        goto LABEL_18;
      }
      v33 = 0;
LABEL_18:
      objc_msgSend(v44, "insertObject:atIndex:", v31, v33);

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(v54, 8);
      _Block_object_dispose(&v55, 8);
    }
    while (objc_msgSend(v20, "count"));
  }
  v34 = objc_msgSend(v44, "indexOfObject:", v40);
  v35 = objc_msgSend(v44, "count");
  v36 = objc_alloc_init(_HKGraphViewSelectionContext);
  objc_msgSend(v41, "setSelectionContext:", v36);

  objc_msgSend(v41, "selectionContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setSelectionState:", 1);

  objc_msgSend(v41, "selectionContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSeriesSelectionRect:", a3.x + -20.0, a3.y + (double)v34 * -15.0 + -7.5, 40.0, (double)v35 * 15.0);

  objc_msgSend(v41, "selectionContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setSelectionAreaMapping:", v44);

}

void __53__HKGraphView__handleStartTouchPoint_seriesGroupRow___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  double v17;
  _OWORD v18[3];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a2;
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x2020000000;
  v33 = 0x7FEFFFFFFFFFFFFFLL;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v6 = objc_msgSend(*(id *)(a1 + 32), "_resolutionFromSeries:", v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544);
  v8 = *(double *)(a1 + 96);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__HKGraphView__handleStartTouchPoint_seriesGroupRow___block_invoke_2;
  v19[3] = &unk_1E9C40768;
  v9 = v5;
  v23 = *(_OWORD *)(a1 + 168);
  v24 = *(_OWORD *)(a1 + 64);
  v25 = *(_OWORD *)(a1 + 80);
  v20 = v9;
  v21 = &v30;
  v22 = &v26;
  v10 = *(double *)(a1 + 64);
  v11 = *(double *)(a1 + 72);
  v12 = *(double *)(a1 + 80);
  v13 = *(double *)(a1 + 88);
  v14 = *(double *)(a1 + 104);
  v15 = *(double *)(a1 + 112);
  v16 = *(_OWORD *)(a1 + 136);
  v18[0] = *(_OWORD *)(a1 + 120);
  v18[1] = v16;
  v18[2] = *(_OWORD *)(a1 + 152);
  objc_msgSend(v9, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", v7, v6, v18, 1, 0, v19, v10, v11, v12, v13, v8, v14, v15);
  v17 = v31[3];
  if (v17 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v17;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *((_BYTE *)v27 + 24);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

}

void __53__HKGraphView__handleStartTouchPoint_seriesGroupRow___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  uint64_t v5;
  double v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "distanceFromPoint:blockCoordinate:chartRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v4 < *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_msgSend(*(id *)(a1 + 32), "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v7, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6 < 0.0;
  }

}

- (CGAffineTransform)_xAxisCoordinateTransformWithContentOffset:(SEL)a3 zoomScale:(CGPoint)a4 chartRect:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MinX;
  double v14;
  double v15;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGRect v21;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeTranslation(&v20, -a4.x, 0.0);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MinX = CGRectGetMinX(v21);
  t1 = v20;
  CGAffineTransformTranslate(&v19, &t1, MinX, 0.0);
  v20 = v19;
  t1 = v19;
  CGAffineTransformScale(&v19, &t1, a5, 1.0);
  v20 = v19;
  memset(&v19, 0, sizeof(v19));
  -[HKAxis pointTransform](self->_xAxis, "pointTransform");
  HKAffineTransformFromLinearTransforms((uint64_t)&v19, v14, v15, 0.0, 1.0);
  t1 = v19;
  v17 = v20;
  return CGAffineTransformConcat(retstr, &t1, &v17);
}

- (CGAffineTransform)_xAxisCoordinateTransform
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[HKGraphView contentOffset](self, "contentOffset");
  v5 = v4;
  v7 = v6;
  -[HKGraphView zoomScale](self, "zoomScale");
  v9 = v8;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  return -[HKGraphView _xAxisCoordinateTransformWithContentOffset:zoomScale:chartRect:](self, "_xAxisCoordinateTransformWithContentOffset:zoomScale:chartRect:", v5, v7, v9, v10, v11, v12, v13);
}

- (id)_valueForXAxisLocation:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  CGAffineTransform v9;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  -[HKGraphView _xAxisCoordinateTransform](self, "_xAxisCoordinateTransform");
  CGAffineTransformInvert(&v10, &v9);
  v5 = round((v10.tx + v10.c * 0.0 + v10.a * a3) * 864000.0) / 864000.0;
  -[HKAxis transform](self->_xAxis, "transform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForCoordinate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateSelectionContextStateWithTouchPoint:(CGPoint)a3 seriesGroup:(id)a4
{
  double y;
  double x;
  int64_t v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  y = a3.y;
  x = a3.x;
  v13 = a4;
  v7 = -[HKGraphView _currentSelectionStateForSeriesGroup:](self, "_currentSelectionStateForSeriesGroup:", v13);
  v8 = v13;
  if (v7 != 2)
  {
    v9 = v7;
    -[HKGraphView _closestGraphSeriesForTouchPoint:seriesGroup:](self, "_closestGraphSeriesForTouchPoint:seriesGroup:", v13, x, y);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v13, "selectionContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setClosestSeriesToSelection:", v11);

LABEL_6:
      v8 = v13;
      goto LABEL_7;
    }
    v8 = v13;
    if (v9 == 1)
    {
      objc_msgSend(v13, "selectionContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSelectionState:", 2);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- ($352843287EF74459AF23949619AEBC4C)_closestDataPointPathToPoint:(SEL)a3 seriesGroupRow:(CGPoint)a4 seriesInGroup:(int64_t)a5 minimumXDistance:(id)a6 xDistanceOut:(double)a7
{
  id v12;
  int64_t v13;
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
  HKAxis *xAxis;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  __int128 v33;
  $352843287EF74459AF23949619AEBC4C *result;
  double v35;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t *v43;
  CGPoint v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _BYTE v50[48];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[3];
  char v58;
  _QWORD v59[4];
  uint64_t v60;
  double *v61;
  uint64_t v62;
  uint64_t v63;

  v12 = a6;
  v13 = -[HKGraphView _resolutionFromSeries:](self, "_resolutionFromSeries:", v12);
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a5);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[HKGraphView _virtualMarginInsets](self, "_virtualMarginInsets");
  v21 = v20;
  -[HKGraphView _virtualMarginInsets](self, "_virtualMarginInsets");
  v23 = v22;
  -[HKGraphView _virtualMarginInsets](self, "_virtualMarginInsets");
  v25 = v24;
  v60 = 0;
  v61 = (double *)&v60;
  v62 = 0x2020000000;
  v63 = 0x7FEFFFFFFFFFFFFFLL;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0x7FEFFFFFFFFFFFFFLL;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x4010000000;
  v54 = &unk_1D7BC951A;
  v55 = HKGraphSeriesDataPointPathNone;
  v56 = unk_1D7B81CF8;
  xAxis = self->_xAxis;
  -[HKGraphView zoomScale](self, "zoomScale");
  v35 = v27;
  -[HKGraphView contentOffset](self, "contentOffset");
  v29 = v28;
  v31 = v30;
  -[HKGraphView _xAxisCoordinateTransform](self, "_xAxisCoordinateTransform");
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __103__HKGraphView__closestDataPointPathToPoint_seriesGroupRow_seriesInGroup_minimumXDistance_xDistanceOut___block_invoke;
  v38[3] = &unk_1E9C407B8;
  v32 = v12;
  v44 = a4;
  v45 = v21;
  v46 = v15;
  v47 = v17 - (v23 + v25);
  v48 = v19;
  v49 = a7;
  v39 = v32;
  v40 = &v60;
  v41 = v57;
  v42 = v59;
  v43 = &v51;
  objc_msgSend(v32, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", xAxis, v13, v50, 0, 2, v38, v21, v15, v47, v19, v35, v29, v31);
  if (a8)
    *a8 = v61[3];
  v33 = *((_OWORD *)v52 + 3);
  *(_OWORD *)&retstr->var0.index = *((_OWORD *)v52 + 2);
  *(_OWORD *)&retstr->var0.resolution = v33;

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(&v60, 8);

  return result;
}

void __103__HKGraphView__closestDataPointPathToPoint_seriesGroupRow_seriesInGroup_minimumXDistance_xDistanceOut___block_invoke(uint64_t a1, uint64_t a2, void *a3, _OWORD *a4)
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  __int128 v21;

  v6 = *(void **)(a1 + 32);
  v7 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 80);
  v9 = *(double *)(a1 + 88);
  v10 = *(double *)(a1 + 96);
  v11 = *(double *)(a1 + 104);
  v12 = *(double *)(a1 + 112);
  v13 = a3;
  objc_msgSend(v6, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v13, v7, v8, v9, v10, v11, v12);
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v13, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v17 = v16;

  if (v15 <= *(double *)(a1 + 120))
  {
    v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v15 <= v18)
    {
      v19 = fabs(v17);
      if (v15 < v18 || HKUIEqualDoubles(v15, v18) && v19 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v19;
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v21 = a4[1];
        *(_OWORD *)(v20 + 32) = *a4;
        *(_OWORD *)(v20 + 48) = v21;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      }
    }
  }
}

- ($352843287EF74459AF23949619AEBC4C)_closestDataPointPathToPoint:(SEL)a3 seriesGroupRow:(CGPoint)a4 minimumXDistance:(int64_t)a5 xDistanceOut:(double)a6
{
  CGFloat y;
  void *v13;
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
  void *v26;
  void *v27;
  int64_t v28;
  HKAxis *xAxis;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  $352843287EF74459AF23949619AEBC4C *result;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat x;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t *v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  char v54[48];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[3];
  char v62;
  _QWORD v63[4];
  uint64_t v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;

  y = a4.y;
  x = a4.x;
  -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a5);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[HKGraphView _virtualMarginInsets](self, "_virtualMarginInsets");
  v21 = v20;
  -[HKGraphView _virtualMarginInsets](self, "_virtualMarginInsets");
  v23 = v22;
  -[HKGraphView _virtualMarginInsets](self, "_virtualMarginInsets");
  v25 = v24;
  objc_msgSend(v13, "selectionContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "closestSeriesToSelection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v38 = y;
    v39 = a6;
    v28 = -[HKGraphView _resolutionFromSeries:](self, "_resolutionFromSeries:", v27);
    v64 = 0;
    v65 = (double *)&v64;
    v66 = 0x2020000000;
    v67 = 0x7FEFFFFFFFFFFFFFLL;
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    v63[3] = 0x7FEFFFFFFFFFFFFFLL;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v62 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x4010000000;
    v58 = &unk_1D7BC951A;
    v59 = HKGraphSeriesDataPointPathNone;
    v60 = unk_1D7B81CF8;
    xAxis = self->_xAxis;
    -[HKGraphView zoomScale](self, "zoomScale");
    v37 = v30;
    -[HKGraphView contentOffset](self, "contentOffset");
    v32 = v31;
    v34 = v33;
    -[HKGraphView _xAxisCoordinateTransform](self, "_xAxisCoordinateTransform");
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __89__HKGraphView__closestDataPointPathToPoint_seriesGroupRow_minimumXDistance_xDistanceOut___block_invoke;
    v41[3] = &unk_1E9C407B8;
    v47 = x;
    v48 = v38;
    v49 = v21;
    v50 = v15;
    v51 = v17 - (v23 + v25);
    v52 = v19;
    v53 = v39;
    v42 = v27;
    v43 = &v64;
    v44 = v61;
    v45 = v63;
    v46 = &v55;
    objc_msgSend(v42, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", xAxis, v28, v54, 0, 2, v41, v21, v15, v51, v19, v37, v32, v34);
    if (a7)
      *a7 = v65[3];
    v35 = *((_OWORD *)v56 + 3);
    *(_OWORD *)&retstr->var0.index = *((_OWORD *)v56 + 2);
    *(_OWORD *)&retstr->var0.resolution = v35;

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(v61, 8);
    _Block_object_dispose(v63, 8);
    _Block_object_dispose(&v64, 8);
  }
  else
  {
    if (a7)
      *a7 = 1.79769313e308;
    *(_OWORD *)&retstr->var0.index = HKGraphSeriesDataPointPathNone;
    *(_OWORD *)&retstr->var0.resolution = unk_1D7B81CF8;
  }

  return result;
}

void __89__HKGraphView__closestDataPointPathToPoint_seriesGroupRow_minimumXDistance_xDistanceOut___block_invoke(uint64_t a1, uint64_t a2, void *a3, _OWORD *a4)
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  __int128 v21;

  v6 = *(void **)(a1 + 32);
  v7 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 80);
  v9 = *(double *)(a1 + 88);
  v10 = *(double *)(a1 + 96);
  v11 = *(double *)(a1 + 104);
  v12 = *(double *)(a1 + 112);
  v13 = a3;
  objc_msgSend(v6, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v13, v7, v8, v9, v10, v11, v12);
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v13, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v17 = v16;

  if (v15 <= *(double *)(a1 + 120))
  {
    v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v15 <= v18)
    {
      v19 = fabs(v17);
      if (v15 < v18 || HKUIEqualDoubles(v15, v18) && v19 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v19;
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v21 = a4[1];
        *(_OWORD *)(v20 + 32) = *a4;
        *(_OWORD *)(v20 + 48) = v21;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      }
    }
  }
}

- (void)_selectionRecognizerDidMove:(id)a3
{
  void *v4;
  void *v5;
  id v6;
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
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "orderedTouches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
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
        v11 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "locationInView:", self->_renderView, (_QWORD)v13);
        objc_msgSend(v11, "valueWithCGPoint:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[HKGraphView _cancelExternalSelection](self, "_cancelExternalSelection");
  -[HKGraphView _selectionRecognizerDidMoveWithTouchPoints:](self, "_selectionRecognizerDidMoveWithTouchPoints:", v5);

}

- (void)_resetSingleSelectionXValue
{
  -[HKGraphView setLastSingleSelectionXValue:](self, "setLastSingleSelectionXValue:", 2.22507386e-308);
}

- (BOOL)_selectionContextsNotPreviouslySelected:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "selectedRangeXValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[HKGraphView _stickySelectionActive](self, "_stickySelectionActive");
      objc_msgSend(v5, "selectedRangeXValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      if (v7)
      {
        -[HKGraphView lastSingleSelectionXValue](self, "lastSingleSelectionXValue");
        if (vabdd_f64(v11, v12) <= 0.00000011920929)
        {
          -[HKGraphView _resetSingleSelectionXValue](self, "_resetSingleSelectionXValue");
          v13 = 0;
          goto LABEL_7;
        }
      }
      -[HKGraphView setLastSingleSelectionXValue:](self, "setLastSingleSelectionXValue:", v11);
    }
  }
  v13 = 1;
LABEL_7:

  return v13;
}

- (void)_selectionRecognizerDidMoveWithTouchPoints:(id)a3
{
  id v4;

  v4 = -[HKGraphView _newPointSelectionContextsWithTouchPoints:updateViewStates:](self, "_newPointSelectionContextsWithTouchPoints:updateViewStates:", a3, 1);
  if (objc_msgSend(v4, "count")
    && -[HKGraphView _selectionContextsNotPreviouslySelected:](self, "_selectionContextsNotPreviouslySelected:", v4))
  {
    -[HKGraphView _notifyDidUpdateSelectionWithPointContext:](self, "_notifyDidUpdateSelectionWithPointContext:", v4);
  }
  else
  {
    -[HKGraphView _finishSelection](self, "_finishSelection");
  }
  -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");

}

- (id)_multiSeriesSelectionContextsWithTouchPoints:(id)a3 updateViewStates:(BOOL)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;
  uint64_t v33;
  HKGraphView *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL4 v66;
  id v67;
  unint64_t v68;
  HKGraphView *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  double v87;
  double v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[2];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v66 = a4;
  v96 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  v8 = v7;
  v10 = v9;

  v68 = objc_msgSend(v5, "count");
  v69 = self;
  if (v68 <= 1)
  {
    v13 = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    objc_msgSend(v5, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CGPointValue");
    v13 = v12;
    v15 = v14;

    self = v69;
  }
  v70 = v5;
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    v16 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
        -[HKGraphView _updateSelectionContextStateWithTouchPoint:seriesGroup:](self, "_updateSelectionContextStateWithTouchPoint:seriesGroup:", v17, v8, v10);
      objc_msgSend(v17, "selectionContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSelectedRangeBoundariesXValue:", 0);

      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      objc_msgSend(v17, "currentSeries");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v90 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
            if (objc_msgSend(v24, "allowsSelection"))
            {
              v87 = 1.79769313e308;
              v88 = 1.79769313e308;
              v85 = 0u;
              v86 = 0u;
              objc_msgSend(v17, "selectionContext");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "minimumSelectionDistance");
              -[HKGraphView _closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:](self, "_closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:", v16, v24, &v88, v8, v10, v26);

              v83 = v85;
              v84 = v86;
              if (v68 >= 2)
              {
                objc_msgSend(v17, "selectionContext");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "closestSeriesToSelection");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "selectionContext");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "minimumSelectionDistance");
                -[HKGraphView _closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:](v69, "_closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:", v16, v28, &v87, v13, v15, v30);

                self = v69;
              }
              v79 = v85;
              v80 = v86;
              v75 = HKGraphSeriesDataPointPathNone;
              v76 = unk_1D7B81CF8;
              if (!HKGraphSeriesDataPointPathEqualToPath(&v79, &v75))
              {
                v79 = v85;
                v80 = v86;
                v81 = v83;
                v82 = v84;
                v75 = v85;
                v76 = v86;
                v77 = v83;
                v78 = v84;
                -[HKGraphView _pointSelectionContextWithPathRange:touchPoints:seriesGroupRow:seriesInGroup:](self, "_pointSelectionContextWithPathRange:touchPoints:seriesGroupRow:seriesInGroup:", &v75, v70, v16, v24);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setXDistanceFromFirstTouchPoint:", v88);
                objc_msgSend(v31, "setXDistanceFromSecondTouchPoint:", v87);
                objc_msgSend(v67, "addObject:", v31);

              }
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
        }
        while (v21);
      }

      ++v16;
    }
    while (v16 < -[NSMutableArray count](self->_seriesGroupRows, "count"));
  }
  v32 = v67;
  v33 = -[NSMutableArray count](self->_seriesGroupRows, "count");
  v34 = self;
  v35 = v32;
  if (v33)
  {
    v36 = 0;
    v35 = v32;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](v34->_seriesGroupRows, "objectAtIndexedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      objc_msgSend(v37, "currentSeries");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
      if (!v39)
        goto LABEL_35;
      v40 = v39;
      v41 = 0;
      v42 = *(_QWORD *)v72;
      do
      {
        v43 = 0;
        v44 = v35;
        do
        {
          if (*(_QWORD *)v72 != v42)
            objc_enumerationMutation(v38);
          v45 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v43);
          LOBYTE(v79) = 0;
          objc_msgSend(v45, "filteredPointSelectionContexts:forTouchPoints:resultsDidChange:", v44, v70, &v79);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v41 |= (_BYTE)v79 != 0;
          ++v43;
          v44 = v35;
        }
        while (v40 != v43);
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
      }
      while (v40);

      if ((v41 & 1) == 0)
        goto LABEL_36;
      objc_msgSend(v37, "selectionContext");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "closestSeriesToSelection");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_35;
      v47 = (void *)v46;
      v48 = objc_msgSend(v35, "count");

      if (v48 == 1)
        break;
LABEL_36:

      ++v36;
      v34 = v69;
      if (v36 >= -[NSMutableArray count](v69->_seriesGroupRows, "count"))
        goto LABEL_37;
    }
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "selectedSeries");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "selectionContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setClosestSeriesToSelection:", v50);

    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "selectedRangeXValues");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "minValue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "doubleValue");
    v56 = v55 - v69->_hardLeftMarginWidth;

    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "selectedRangeXValues");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "maxValue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "doubleValue");
    v61 = v60 - v69->_hardLeftMarginWidth;

    objc_msgSend(v37, "selectionContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v62;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSelectedRangeBoundariesXValue:", v64);

LABEL_35:
    goto LABEL_36;
  }
LABEL_37:

  return v35;
}

- (id)_oneSeriesSelectionContextsWithTouchPoints:(id)a3 updateViewStates:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableArray *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  id v62;
  void *v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  double v87;
  double v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint64_t v94;
  CGPoint v95;

  v4 = a4;
  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGPointValue");
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(v6, "count");
  if (v12 <= 1)
  {
    v64 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v65 = *MEMORY[0x1E0C9D538];
  }
  else
  {
    objc_msgSend(v6, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGPointValue");
    v64 = v15;
    v65 = v14;

  }
  v63 = v6;
  v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v91 = HKGraphSeriesDataPointPathNone;
  v92 = unk_1D7B81CF8;
  v89 = HKGraphSeriesDataPointPathNone;
  v90 = unk_1D7B81CF8;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v73 = v17;
  v74 = v16;
  v71 = v19;
  v72 = v18;
  if (-[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    v68 = 0;
    v20 = 0;
    v66 = -1;
    v69 = 1.79769313e308;
    v70 = v11;
    v67 = 1.79769313e308;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 1.79769313e308;
      v88 = 1.79769313e308;
      if (v4)
        -[HKGraphView _updateSelectionContextStateWithTouchPoint:seriesGroup:](self, "_updateSelectionContextStateWithTouchPoint:seriesGroup:", v21, v9, v11);
      objc_msgSend(v21, "selectionContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setSelectedRangeBoundariesXValue:", 0);

      -[HKGraphView _yAxisRectForSeriesGroupRow:insetForLegends:chartRect:](self, "_yAxisRectForSeriesGroupRow:insetForLegends:chartRect:", v20, 0, v74, v73, v72, v71);
      v23 = v9;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      -[HKGraphView _virtualMarginInsets](self, "_virtualMarginInsets");
      v31 = v30;
      -[HKGraphView _virtualMarginInsets](self, "_virtualMarginInsets");
      v33 = v32;
      -[HKGraphView _virtualMarginInsets](self, "_virtualMarginInsets");
      v35 = v27 - (v33 + v34);
      -[HKGraphView delegate](self, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "graphViewPointSelectionDifferentiatesSeriesGroups:", self);

      if (v37)
        v38 = v25;
      else
        v38 = v73;
      v9 = v23;
      v11 = v70;
      if (v37)
        v39 = v29;
      else
        v39 = v71;
      v40 = v31;
      v41 = v35;
      v95.x = v9;
      v95.y = v70;
      if (CGRectContainsPoint(*(CGRect *)(&v38 - 1), v95))
      {
        v83 = 0u;
        v84 = 0u;
        objc_msgSend(v21, "selectionContext");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "closestSeriesToSelection");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "selectionContext");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "minimumSelectionDistance");
        -[HKGraphView _closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:](self, "_closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:", v20, v43, &v88, v9, v70, v45);

        v79 = 0u;
        v80 = 0u;
        v46 = v88;
        if (v88 >= v69)
        {
          v46 = v69;
        }
        else
        {
          v91 = v83;
          v92 = v84;
          v89 = v83;
          v90 = v84;
          objc_msgSend(v21, "selectionContext");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "closestSeriesToSelection");
          v48 = objc_claimAutoreleasedReturnValue();

          v66 = v20;
          v68 = (void *)v48;
        }
        if (v12 >= 2)
        {
          objc_msgSend(v21, "selectionContext");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "closestSeriesToSelection");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "selectionContext");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "minimumSelectionDistance");
          -[HKGraphView _closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:](self, "_closestDataPointPathToPoint:seriesGroupRow:seriesInGroup:minimumXDistance:xDistanceOut:", v20, v50, &v87, v65, v64, v52);

          if (v87 < v67)
          {
            v89 = v79;
            v90 = v80;
            v67 = v87;
          }
        }
        v69 = v46;
      }

      ++v20;
    }
    while (v20 < -[NSMutableArray count](self->_seriesGroupRows, "count"));
  }
  else
  {
    v68 = 0;
    v66 = -1;
  }
  v83 = v91;
  v84 = v92;
  v79 = HKGraphSeriesDataPointPathNone;
  v80 = unk_1D7B81CF8;
  v53 = v68;
  if (!HKGraphSeriesDataPointPathEqualToPath(&v83, &v79) && v68)
  {
    v83 = v91;
    v84 = v92;
    v85 = v89;
    v86 = v90;
    v79 = v91;
    v80 = v92;
    v81 = v89;
    v82 = v90;
    -[HKGraphView _pointSelectionContextWithPathRange:touchPoints:seriesGroupRow:seriesInGroup:](self, "_pointSelectionContextWithPathRange:touchPoints:seriesGroupRow:seriesInGroup:", &v79, v63, v66, v68);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addObject:", v54);
    if (v4)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v66);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKGraphViewSelectionStyle unselectedSeriesAlpha](self->_selectionStyle, "unselectedSeriesAlpha");
      -[HKGraphView _deselectAllSeriesWithAlpha:offScreenIndicatorAlpha:seriesGroup:](self, "_deselectAllSeriesWithAlpha:offScreenIndicatorAlpha:seriesGroup:", v55);
      objc_msgSend(v68, "setAlpha:", 1.0);
      objc_msgSend(v68, "setOffscreenIndicatorAlpha:", 1.0);
      if (-[HKGraphView moveSelectedSeriesToFront](self, "moveSelectedSeriesToFront"))
        -[HKGraphView _moveSeriesToFront:](self, "_moveSeriesToFront:", v68);
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v56 = self->_seriesGroupRows;
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
      if (v57)
      {
        v58 = v57;
        v59 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v58; ++i)
          {
            if (*(_QWORD *)v76 != v59)
              objc_enumerationMutation(v56);
            if (v55 != *(void **)(*((_QWORD *)&v75 + 1) + 8 * i))
              -[HKGraphView _finishSelectionForSeriesGroup:](self, "_finishSelectionForSeriesGroup:");
          }
          v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
        }
        while (v58);
      }

      v53 = v68;
    }

  }
  return v62;
}

- (id)_newPointSelectionContextsWithTouchPoints:(id)a3 updateViewStates:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (-[HKGraphView multiSeriesSelection](self, "multiSeriesSelection"))
      -[HKGraphView _multiSeriesSelectionContextsWithTouchPoints:updateViewStates:](self, "_multiSeriesSelectionContextsWithTouchPoints:updateViewStates:", v6, v4);
    else
      -[HKGraphView _oneSeriesSelectionContextsWithTouchPoints:updateViewStates:](self, "_oneSeriesSelectionContextsWithTouchPoints:updateViewStates:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)_pointSelectionContextWithPathRange:(id *)a3 touchPoints:(id)a4 seriesGroupRow:(int64_t)a5 seriesInGroup:(id)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  HKAxis *xAxis;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  double v30;
  double v31;
  unint64_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  void *v62;
  HKGraphViewPointSelectionContext *v63;
  void *v64;
  double v65;
  double v66;
  double hardLeftMarginWidth;
  void *v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v78;
  int64_t v79;
  void *v80;
  _OWORD v81[4];
  _QWORD v82[7];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[48];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  _QWORD v106[5];

  v106[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  -[HKGraphView _yAxisRectForSeriesGroupRow:chartRect:](self, "_yAxisRectForSeriesGroupRow:chartRect:", a5);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", a5);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = -[HKGraphView _resolutionFromSeries:](self, "_resolutionFromSeries:", v11);
  v100 = 0;
  v101 = &v100;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__2;
  v104 = __Block_byref_object_dispose__2;
  v105 = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__2;
  v98 = __Block_byref_object_dispose__2;
  v99 = 0;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__2;
  v92 = __Block_byref_object_dispose__2;
  v93 = (id)objc_opt_new();
  xAxis = self->_xAxis;
  -[HKGraphView zoomScale](self, "zoomScale");
  v22 = v21;
  -[HKGraphView contentOffset](self, "contentOffset");
  v24 = v23;
  v26 = v25;
  -[HKGraphView _xAxisCoordinateTransform](self, "_xAxisCoordinateTransform");
  v82[1] = 3221225472;
  v27 = *(_OWORD *)&a3->var0.var0.resolution;
  v83 = *(_OWORD *)&a3->var0.var0.index;
  v84 = v27;
  v28 = *(_OWORD *)&a3->var1.var0.resolution;
  v85 = *(_OWORD *)&a3->var1.var0.index;
  v82[0] = MEMORY[0x1E0C809B0];
  v82[2] = __92__HKGraphView__pointSelectionContextWithPathRange_touchPoints_seriesGroupRow_seriesInGroup___block_invoke;
  v82[3] = &unk_1E9C407E0;
  v86 = v28;
  v82[4] = &v100;
  v82[5] = &v94;
  v82[6] = &v88;
  objc_msgSend(v11, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", xAxis, v79, v87, 0, 2, v82, v13, v15, v17, v19, v22, v24, v26);
  objc_msgSend(v10, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "CGPointValue");
  v31 = v30;

  v32 = objc_msgSend(v10, "count");
  if (v32 < 2)
  {
    v35 = *MEMORY[0x1E0C9D538];
  }
  else
  {
    objc_msgSend(v10, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "CGPointValue");
    v35 = v34;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var0.var1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var1.var1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v36, v37);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v101[5])
  {
    objc_msgSend(v11, "xAxisSelectedCoordinate:blockCoordinate:chartRect:", v31, v13, v15, v17, v19);
    v39 = v38;
    objc_msgSend(v11, "xAxisSelectedCoordinate:blockCoordinate:chartRect:", v95[5], v31, v13, v15, v17, v19);
    v41 = v40;
    if (v32 >= 2)
    {
      objc_msgSend(v11, "xAxisSelectedCoordinate:blockCoordinate:chartRect:", v95[5], v35, v13, v15, v17, v19);
      v41 = v42;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v101[5], "startXValue");
    v47 = v46;
    objc_msgSend((id)v95[5], "endXValue");
    v49 = v48;
    if (HKUIEqualCGFloats(v47, v48))
    {
      -[HKGraphView _valueForXAxisLocation:](self, "_valueForXAxisLocation:", v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v50, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HKGraphView _valueForXAxisLocation:](self, "_valueForXAxisLocation:", v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKGraphView _valueForXAxisLocation:](self, "_valueForXAxisLocation:", v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v50, v52);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v51 = 0;
    v45 = 0;
  }
  objc_msgSend(v45, "minValue");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53
    || (objc_msgSend(v45, "maxValue"),
        v54 = (void *)objc_claimAutoreleasedReturnValue(),
        v55 = v54 == 0,
        v54,
        v53,
        v55))
  {
    objc_msgSend(v80, "selectionContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setSelectedRangeBoundariesXValue:", 0);
  }
  else
  {
    objc_msgSend(v80, "selectionContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "minValue");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v57;
    objc_msgSend(v45, "maxValue");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setSelectedRangeBoundariesXValue:", v59);

  }
  v60 = *(_OWORD *)&a3->var0.var0.resolution;
  v81[0] = *(_OWORD *)&a3->var0.var0.index;
  v81[1] = v60;
  v61 = *(_OWORD *)&a3->var1.var0.resolution;
  v81[2] = *(_OWORD *)&a3->var1.var0.index;
  v81[3] = v61;
  objc_msgSend(v11, "selectPathsinPathRange:coordinateRange:", v81, v45);
  objc_msgSend(v80, "selectionContext");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setTouchPoints:", v10);

  v63 = objc_alloc_init(HKGraphViewPointSelectionContext);
  -[HKGraphViewPointSelectionContext setSelectedSeries:](v63, "setSelectedSeries:", v11);
  objc_msgSend(v45, "minValue");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "doubleValue");
  v66 = v65;
  hardLeftMarginWidth = self->_hardLeftMarginWidth;

  objc_msgSend(v45, "maxValue");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "doubleValue");
  v70 = v69;
  v71 = self->_hardLeftMarginWidth;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v66 + hardLeftMarginWidth);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v70 + v71);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphViewPointSelectionContext setSelectedRangeXValues:](v63, "setSelectedRangeXValues:", v74);
  -[HKGraphViewPointSelectionContext setSelectedPathIndexRange:](v63, "setSelectedPathIndexRange:", v78);
  -[HKGraphViewPointSelectionContext setUserInfo:](v63, "setUserInfo:", v89[5]);
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", self->_xAxisDateZoom);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "seriesPointIntervalComponentsAtResolution:", v79);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewPointSelectionContext setPointIntervalComponents:](v63, "setPointIntervalComponents:", v76);

  -[HKGraphViewPointSelectionContext setSelectedPointValueRange:](v63, "setSelectedPointValueRange:", v51);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v100, 8);

  return v63;
}

void __92__HKGraphView__pointSelectionContextWithPathRange_touchPoints_seriesGroupRow_seriesInGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3, __int128 *a4)
{
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v7 = a3;
  v8 = *(_OWORD *)(a1 + 72);
  v18 = *(_OWORD *)(a1 + 56);
  v19 = v8;
  v9 = a4[1];
  v22 = *a4;
  v23 = v9;
  if (HKGraphSeriesDataPointPathEqualToPath(&v18, &v22))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v10 = *(_OWORD *)(a1 + 104);
  v18 = *(_OWORD *)(a1 + 88);
  v19 = v10;
  v11 = a4[1];
  v22 = *a4;
  v23 = v11;
  if (HKGraphSeriesDataPointPathEqualToPath(&v18, &v22))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v12 = a4[1];
  v22 = *a4;
  v23 = v12;
  v13 = *(_OWORD *)(a1 + 72);
  v18 = *(_OWORD *)(a1 + 56);
  v19 = v13;
  v14 = *(_OWORD *)(a1 + 104);
  v20 = *(_OWORD *)(a1 + 88);
  v21 = v14;
  if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)&v22, (uint64_t *)&v18))
  {
    objc_msgSend(v7, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(v7, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
  }

}

- (void)_deselectAllSeriesWithAlpha:(double)a3 offScreenIndicatorAlpha:(double)a4 seriesGroup:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a5, "currentSeries", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v12, "setAlpha:", a3);
        objc_msgSend(v12, "setOffscreenIndicatorAlpha:", a4);
        objc_msgSend(v12, "deselectPath");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_finishSelectionForSeriesGroup:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "currentSeries", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "finishSelection");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_finishSelection
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HKGraphView _updateAllLegendsWithSelectedValues:](self, "_updateAllLegendsWithSelectedValues:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_seriesGroupRows;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "selectionContext", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "setSelectionContext:", 0);
          -[HKGraphView _finishSelectionForSeriesGroup:](self, "_finishSelectionForSeriesGroup:", v9);
          -[HKGraphView _deselectAllSeriesWithAlpha:offScreenIndicatorAlpha:seriesGroup:](self, "_deselectAllSeriesWithAlpha:offScreenIndicatorAlpha:seriesGroup:", v9, 1.0, 1.0);
          v6 = 1;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
    {
      -[HKGraphView _notifyDidEndSelection](self, "_notifyDidEndSelection");
      -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
      -[HKGraphRenderer setNeedsRender](self->_yAxisLabelContent, "setNeedsRender");
    }
  }
  else
  {

  }
  if (self->_enableStickySelection)
    -[HKGraphView _deactivateStickySelection](self, "_deactivateStickySelection");
  -[HKGraphView _resetSingleSelectionXValue](self, "_resetSingleSelectionXValue", (_QWORD)v11);
  -[HKGraphView _scheduleExternalSelectionIfNeededClearingLastLocation](self, "_scheduleExternalSelectionIfNeededClearingLastLocation");
}

- (void)_cancelAndFinishSelection
{
  -[HKGraphView _cancelExternalSelection](self, "_cancelExternalSelection");
  -[HKGraphView _finishSelection](self, "_finishSelection");
}

- (void)_selectionRecognizerDidFinish:(id)a3
{
  if (self->_enableStickySelection)
    -[HKGraphView _activateStickySelection](self, "_activateStickySelection", a3);
  else
    -[HKGraphView _finishSelection](self, "_finishSelection", a3);
}

- (void)_moveSeriesToFront:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = self->_seriesGroupRows;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v9, "currentSeries");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "indexOfObjectIdenticalTo:", v4);

          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v9, "currentSeries");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "count") - 1;

            objc_msgSend(v9, "currentSeries");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "currentSeries");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:atIndexedSubscript:", v15, v11);

            objc_msgSend(v9, "currentSeries");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:atIndexedSubscript:", v4, v13);

          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

  }
}

- (void)touchSelectionAtModelX:(id)a3
{
  -[HKGraphView setExternalSelectionModelCoordinate:](self, "setExternalSelectionModelCoordinate:", a3);
  -[HKGraphView _installExternalSelectionEndTimer](self, "_installExternalSelectionEndTimer");
  -[HKGraphView _installExternalSelectionCancelTimer](self, "_installExternalSelectionCancelTimer");
  -[HKGraphView _scheduleRequiredExternalSelection](self, "_scheduleRequiredExternalSelection");
}

- (void)_installExternalSelectionEndTimer
{
  id v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__HKGraphView__installExternalSelectionEndTimer__block_invoke;
  v3[3] = &unk_1E9C40808;
  v3[4] = self;
  v2 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v3, 1.0);
}

uint64_t __48__HKGraphView__installExternalSelectionEndTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endExternalSelectionViaTimer");
}

- (void)_installExternalSelectionCancelTimer
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  -[HKGraphView _invalidateExternalSelectionCancelTimer](self, "_invalidateExternalSelectionCancelTimer");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleInternalInstall");

  v6 = 4.0;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v8 = (void *)objc_msgSend(v7, "initWithSuiteName:", *MEMORY[0x1E0CB7608]);
    if (objc_msgSend(v8, "hk_keyExists:", CFSTR("HKLollipopDeselectDelayInSec")))
    {
      objc_msgSend(v8, "doubleForKey:", CFSTR("HKLollipopDeselectDelayInSec"));
      v6 = v9;
    }

  }
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __51__HKGraphView__installExternalSelectionCancelTimer__block_invoke;
  v14 = &unk_1E9C40170;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v11, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView setExternalSelectionCancelTimer:](self, "setExternalSelectionCancelTimer:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __51__HKGraphView__installExternalSelectionCancelTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancelAndFinishSelection");

}

- (void)_invalidateExternalSelectionCancelTimer
{
  NSTimer *externalSelectionCancelTimer;

  -[NSTimer invalidate](self->_externalSelectionCancelTimer, "invalidate");
  externalSelectionCancelTimer = self->_externalSelectionCancelTimer;
  self->_externalSelectionCancelTimer = 0;

}

- (void)_cancelExternalSelection
{
  void *v3;

  -[HKGraphView externalSelectionModelCoordinate](self, "externalSelectionModelCoordinate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKGraphView setExternalSelectionModelCoordinate:](self, "setExternalSelectionModelCoordinate:", 0);
    -[HKGraphView _notifyDidEndExternalSelection](self, "_notifyDidEndExternalSelection");
  }
}

- (void)_scheduleExternalSelectionIfNeeded
{
  void *v3;
  _QWORD block[5];

  -[HKGraphView externalSelectionModelCoordinate](self, "externalSelectionModelCoordinate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!-[HKGraphView externalSelectionScheduled](self, "externalSelectionScheduled"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__HKGraphView__scheduleExternalSelectionIfNeeded__block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      -[HKGraphView setExternalSelectionScheduled:](self, "setExternalSelectionScheduled:", 1);
    }
  }
}

uint64_t __49__HKGraphView__scheduleExternalSelectionIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processExternalSelection");
}

- (void)_scheduleRequiredExternalSelection
{
  -[HKGraphView setExternalSelectionLastLocation:](self, "setExternalSelectionLastLocation:", -1.79769313e308);
  -[HKGraphView setExternalSelectionScheduled:](self, "setExternalSelectionScheduled:", 0);
  -[HKGraphView _scheduleExternalSelectionIfNeeded](self, "_scheduleExternalSelectionIfNeeded");
}

- (void)_scheduleExternalSelectionIfNeededClearingLastLocation
{
  -[HKGraphView setExternalSelectionLastLocation:](self, "setExternalSelectionLastLocation:", -1.79769313e308);
  -[HKGraphView _scheduleExternalSelectionIfNeeded](self, "_scheduleExternalSelectionIfNeeded");
}

- (void)_processExternalSelection
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double MinX;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[11];
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGRect v43;
  CGRect v44;

  -[HKGraphView externalSelectionModelCoordinate](self, "externalSelectionModelCoordinate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKGraphView setExternalSelectionScheduled:](self, "setExternalSelectionScheduled:", 0);
    -[HKAxis transform](self->_xAxis, "transform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView externalSelectionModelCoordinate](self, "externalSelectionModelCoordinate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateForValue:", v5);
    v7 = v6;

    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
    -[HKGraphView _xAxisCoordinateTransform](self, "_xAxisCoordinateTransform");
    v8 = *(double *)&v42 + *(double *)&v41 * 0.0 + *(double *)&v40 * v7;
    v9 = -[HKGraphView xAxisDateZoom](self, "xAxisDateZoom");
    -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v36 = 0;
    v37 = (double *)&v36;
    v38 = 0x2020000000;
    v39 = 0x7FEFFFFFFFFFFFFFLL;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0x7FEFFFFFFFFFFFFFLL;
    v31 = 0;
    v32 = (double *)&v31;
    v33 = 0x2020000000;
    v34 = 0x7FEFFFFFFFFFFFFFLL;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __40__HKGraphView__processExternalSelection__block_invoke;
    v30[3] = &unk_1E9C40858;
    v30[7] = &v31;
    v30[8] = v9;
    *(double *)&v30[9] = v14;
    *(double *)&v30[10] = v8;
    v30[4] = self;
    v30[5] = v35;
    v30[6] = &v36;
    -[HKGraphView _walkAllSeries:](self, "_walkAllSeries:", v30);
    v18 = v37[3];
    if (v18 < 1.79769313e308)
    {
      -[HKGraphView externalSelectionLastLocation](self, "externalSelectionLastLocation");
      if (!HKUIEqualCGFloats(v18, v19))
      {
        v20 = v37[3];
        v43.origin.x = v11;
        v43.origin.y = v13;
        v43.size.width = v15;
        v43.size.height = v17;
        MinX = CGRectGetMinX(v43);
        v44.origin.x = v11;
        v44.origin.y = v13;
        v44.size.width = v15;
        v44.size.height = v17;
        v22 = CGRectGetMaxX(v44) + -0.00000011920929;
        v23 = v37[3];
        if (v23 < MinX + 0.00000011920929 || v23 > v22)
        {
          v24 = v32[3];
          v25 = v24 * 0.5;
          v26 = v24 < 1.79769313e308;
          v27 = 0.0;
          if (v26)
            v27 = v25;
          v28 = v22 - v27;
          if (MinX + 0.00000011920929 + v27 >= v23)
            v23 = MinX + 0.00000011920929 + v27;
          if (v28 >= v23)
            v20 = v23;
          else
            v20 = v28;
        }
        -[HKGraphView bounds](self, "bounds");
        -[HKGraphView _touchAtPoint:](self, "_touchAtPoint:", v20, v29 * 0.5);
        -[HKGraphView setExternalSelectionLastLocation:](self, "setExternalSelectionLastLocation:", v37[3]);
      }
    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(&v36, 8);
  }
}

void __40__HKGraphView__processExternalSelection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;

  v3 = a2;
  if (objc_msgSend(v3, "allowsSelection"))
  {
    if (*(_QWORD *)(a1 + 64) == 8)
    {
      v4 = 44.0;
      v5 = 1.79769313e308;
    }
    else
    {
      v5 = *(double *)(a1 + 72)
         / (double)+[HKGraphZoomLevelConfiguration visibleSeriesPointCountForTimeScope:resolution:](HKGraphZoomLevelConfiguration, "visibleSeriesPointCountForTimeScope:resolution:", *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "_resolutionFromSeries:", v3));
      v4 = HKUICeilToScreenScale(fmax(v5, 44.0));
    }
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__HKGraphView__processExternalSelection__block_invoke_2;
    v7[3] = &unk_1E9C40830;
    v10 = *(_QWORD *)(a1 + 80);
    v11 = v4;
    v8 = *(_OWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 56);
    v12 = v5;
    objc_msgSend(v6, "enumerateVisibleCoordinatesForSeries:block:", v3, v7);
  }

}

void __40__HKGraphView__processExternalSelection__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  double v5;
  double v6;
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
  double v19;
  double v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "startXValue");
  v5 = v4;
  objc_msgSend(v21, "endXValue");
  v7 = (v5 + v6) * 0.5;
  v8 = vabdd_f64(v7, *(double *)(a1 + 56));
  objc_msgSend(v21, "startXValue");
  v10 = v9;
  objc_msgSend(v21, "endXValue");
  v12 = v8;
  if (vabdd_f64(v10, v11) > 0.00000011920929)
  {
    v13 = *(double *)(a1 + 56);
    objc_msgSend(v21, "startXValue");
    if (v13 < v14 || (v15 = *(double *)(a1 + 56), objc_msgSend(v21, "endXValue"), v12 = 0.0, v15 > v16))
    {
      objc_msgSend(v21, "startXValue");
      v18 = vabdd_f64(v17, *(double *)(a1 + 56));
      objc_msgSend(v21, "endXValue");
      v20 = vabdd_f64(v19, *(double *)(a1 + 56));
      if (v18 >= v20)
        v12 = v20;
      else
        v12 = v18;
    }
  }
  if (v12 <= *(double *)(a1 + 64) && v8 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a1 + 72);
  }

}

- (BOOL)_stickySelectionActive
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_seriesGroupRows, "count"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_seriesGroupRows;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (-[HKGraphView _currentSelectionStateForSeriesGroup:](self, "_currentSelectionStateForSeriesGroup:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) != 3)
        {
          v8 = 0;
          goto LABEL_12;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_12:

  return v8;
}

- (void)_deactivateStickySelection
{
  NSMutableArray *v3;
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
  if (-[HKGraphView _stickySelectionActive](self, "_stickySelectionActive"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_seriesGroupRows;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "selectionContext", (_QWORD)v9);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setSelectionState:", 0);

          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)_activateStickySelection
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_seriesGroupRows;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "selectionContext", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8 && objc_msgSend(v8, "selectionState") != 3)
          objc_msgSend(v9, "setSelectionState:", 3);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[HKGraphView _reloadViewScope](self, "_reloadViewScope");
}

- (void)didMoveToWindow
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[HKGraphView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __30__HKGraphView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E9C40880;
    objc_copyWeak(&v5, &location);
    +[HKOutsideViewTapDetector addOutsideTouchCallbackForView:outsideTapBlock:](HKOutsideViewTapDetector, "addOutsideTouchCallbackForView:outsideTapBlock:", self, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    +[HKOutsideViewTapDetector removeOutsideTouchCallbackForView:](HKOutsideViewTapDetector, "removeOutsideTouchCallbackForView:", self);
  }
}

void __30__HKGraphView_didMoveToWindow__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancelAndFinishSelection");

}

- (void)_notifyDidBeginSelection
{
  id WeakRetained;

  if (self->_shouldInformDelegateOfUpdates)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "graphViewDidBeginSelection:", self);

  }
}

- (void)_notifyDidUpdateSelectionWithPointContext:(id)a3
{
  HKGraphViewDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if (self->_shouldInformDelegateOfUpdates)
  {
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "graphView:didUpdateSelectedPoint:", self, v5);

  }
}

- (void)_notifyDidEndSelection
{
  id WeakRetained;

  if (self->_shouldInformDelegateOfUpdates)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "graphViewDidEndSelection:", self);

  }
}

- (void)_notifyDateZoomDidChangeFromValue:(int64_t)a3 toValue:(int64_t)a4
{
  id WeakRetained;

  if (self->_shouldInformDelegateOfUpdates)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "graphView:didUpdateFromDateZoom:toDateZoom:newVisibleRange:", self, a3, a4, self->_effectiveVisibleRangeActive);

  }
}

- (void)_notifyDelegateOfVisibleValueRange:(id)a3 changeContext:(int64_t)a4
{
  id WeakRetained;
  id v7;

  v7 = a3;
  if (-[HKGraphView _graphViewIsConfigured](self, "_graphViewIsConfigured"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "graphView:didUpdateVisibleValueRange:changeContext:", self, v7, a4);

  }
}

- (void)_notifyDelegateOfFinishUserScrolling
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "graphView:didFinishUserScrollingToValueRange:", self, self->_effectiveVisibleRangeActive);

}

- (void)_notifyDelegateOfSizeChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "graphViewSizeChanged:", self);

}

- (void)_notifyDelegateOfYAxisWidth:(double)a3 toWidth:(double)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "graphView:didUpdateYAxisWidth:toWidth:", self, a3, a4);

}

- (void)_notifyDelegateSeriesUpdate:(id)a3 newDataArrived:(BOOL)a4
{
  _BOOL8 v4;
  UIScrollView *scrollView;
  id v7;
  uint64_t v8;
  id WeakRetained;

  v4 = a4;
  scrollView = self->_scrollView;
  v7 = a3;
  v8 = -[UIScrollView isDragging](scrollView, "isDragging");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "graphView:didUpdateSeries:newDataArrived:changeContext:", self, v7, v4, v8);

}

- (void)_notifyDelegateOfTapOnYAxis
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "graphViewDidTapYAxis:", self);

}

- (void)_notifyDidEndExternalSelection
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "graphViewExternalSelectionEnd:", self);

}

- (void)_notifyGraphViewRendered
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "graphViewRenderedView:", self);

}

- (void)testScrollPerformanceWithTestName:(id)a3 iterations:(int)a4 delta:(int)a5 options:(id)a6
{
  -[UIScrollView _performScrollTest:iterations:delta:length:scrollAxis:](self->_scrollView, "_performScrollTest:iterations:delta:length:scrollAxis:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 5000, 1);
}

- (void)testScrollPerformanceWithTestName:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6
{
  -[UIScrollView _performScrollTest:iterations:delta:length:scrollAxis:](self->_scrollView, "_performScrollTest:iterations:delta:length:scrollAxis:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 1);
}

- (id)findVisibleBlockCoordinatesForPrimarySeries
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int64_t v12;
  HKAxis *xAxis;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v22;

  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HKGraphView primarySeries](self, "primarySeries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[HKGraphView _resolutionFromSeries:](self, "_resolutionFromSeries:", v11);
    xAxis = self->_xAxis;
    -[HKGraphView zoomScale](self, "zoomScale");
    v15 = v14;
    -[HKGraphView contentOffset](self, "contentOffset");
    v17 = v16;
    v19 = v18;
    -[HKGraphView _xAxisCoordinateTransform](self, "_xAxisCoordinateTransform");
    objc_msgSend(v11, "findVisibleBlockCoordinatesForChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:", xAxis, v12, &v22, v4, v6, v8, v10, v15, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)primarySeries
{
  HKGraphViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_msgSend(v6, "primarySeriesGroupIndexForGraphView:", self);

  }
  else
  {
    v7 = 0;
  }
  if (v7 >= -[NSMutableArray count](self->_seriesGroupRows, "count"))
  {
    v10 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_seriesGroupRows, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentSeries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)setPreviousDateZoom:(int64_t)a3
{
  self->_xAxisDateZoom = a3;
}

- (void)setIndependentAxes:(id)a3 stackOffset:(int64_t)a4
{
  NSMutableArray *seriesGroupRows;
  id v7;
  id v8;

  seriesGroupRows = self->_seriesGroupRows;
  v7 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](seriesGroupRows, "objectAtIndexedSubscript:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIndependentAxes:", v7);

  -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
  -[HKGraphRenderer setNeedsRender](self->_yAxisLabelContent, "setNeedsRender");

}

- (BOOL)_tilesAreEnabled
{
  return !self->_tilingDisabled && !self->_tilesTransientDisabled && !self->_tilesWaitingForInitialRender;
}

- (BOOL)_tilesConfigurableAfterInitialRender
{
  return !self->_tilingDisabled && !self->_tilesTransientDisabled;
}

- (BOOL)_tilesReconfigurableAfterInitialRender
{
  return !self->_tilingDisabled && !self->_tilesWaitingForInitialRender;
}

- (void)_handleTilesInitialRender
{
  void *v3;
  void *v4;

  if (-[HKGraphView tilesWaitingForInitialRender](self, "tilesWaitingForInitialRender"))
  {
    -[HKGraphView setTileInitialRedrawCount:](self, "setTileInitialRedrawCount:", -[HKGraphView tileInitialRedrawCount](self, "tileInitialRedrawCount") + 1);
    if (-[HKGraphView tileInitialRedrawCount](self, "tileInitialRedrawCount") >= 6)
    {
      if (-[HKGraphView _tilesConfigurableAfterInitialRender](self, "_tilesConfigurableAfterInitialRender"))
      {
        -[HKGraphView setTilesWaitingForInitialRender:](self, "setTilesWaitingForInitialRender:", 0);
        -[HKGraphView backgroundColor](self, "backgroundColor");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKGraphView _captureColor:](self, "_captureColor:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKGraphView setCapturedTileBackgroundColor:](self, "setCapturedTileBackgroundColor:", v4);

        -[HKGraphView _reconfigureScrollingTiles](self, "_reconfigureScrollingTiles");
      }
    }
  }
}

- (CGPoint)_contentOffsetForActualViewRange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  __int128 v16;
  CGPoint result;

  v16 = *MEMORY[0x1E0C9D538];
  -[HKGraphView xAxis](self, "xAxis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[HKGraphView xAxis](self, "xAxis");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView actualVisibleRange](self, "actualVisibleRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:", v13, 0, &v16, v5, v7, v9, v11);

  }
  v15 = *((double *)&v16 + 1);
  v14 = *(double *)&v16;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)_reconfigureScrollingTiles
{
  double v3;
  double v4;
  double Width;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[HKGraphView _tilesReconfigurableAfterInitialRender](self, "_tilesReconfigurableAfterInitialRender"))
  {
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v4 = v3;
    -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
    Width = CGRectGetWidth(v27);
    v6 = HKUICeilToScreenScale(Width * 0.5);
    v7 = HKUICeilToScreenScale(v4 + Width * 2.0);
    if (v6 <= 0.0)
    {
      -[HKGraphView setTileColumns:](self, "setTileColumns:", 0, v7);
      -[HKGraphView setTileWidthInPoints:](self, "setTileWidthInPoints:", v6);
      v8 = -0.5;
    }
    else
    {
      -[HKGraphView setTileColumns:](self, "setTileColumns:", vcvtpd_s64_f64(v7 / v6));
      -[HKGraphView setTileWidthInPoints:](self, "setTileWidthInPoints:", v6);
      v8 = Width * 1.5 / v6 - Width / (v6 + v6) + -0.5;
    }
    -[HKGraphView setTileColumnHysteresis:](self, "setTileColumnHysteresis:", vcvtmd_s64_f64(v8));
    -[HKGraphView setTileFirstColumn:](self, "setTileFirstColumn:", 0);
    -[HKGraphView setTileLastColumn:](self, "setTileLastColumn:", -1);
    -[HKGraphView tileQueue](self, "tileQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[HKGraphView setTileQueue:](self, "setTileQueue:", v10);

    }
    -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v18, "prepareTileForReuse");
            -[HKGraphView tileQueue](self, "tileQueue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v15);
      }

      -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeAllObjects");
    }
    else
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[HKGraphView setTilesByColumnNumber:](self, "setTilesByColumnNumber:", v20);
    }

    -[HKGraphView _contentOffsetForActualViewRange](self, "_contentOffsetForActualViewRange");
    -[HKGraphView _touchTilesForContentOffset:applyHysteresis:](self, "_touchTilesForContentOffset:applyHysteresis:", 0);
  }
}

- (id)_captureColor:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = 0.0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v7, &v6, &v5, &v4);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v7, v6, v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_touchTilesForContentOffset:(CGPoint)a3 applyHysteresis:(BOOL)a4
{
  _BOOL4 v4;
  double x;
  double Width;
  double v9;
  double v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  int64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HKGraphTile *v41;
  void *v42;
  HKGraphTile *v43;
  UIScrollView *scrollView;
  void *v45;
  void *v46;
  SEL v47;
  CGRect v48;

  v4 = a4;
  x = a3.x;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect", a3.x, a3.y);
  Width = CGRectGetWidth(v48);
  -[HKGraphView tileWidthInPoints](self, "tileWidthInPoints");
  if (v9 <= 0.0)
  {
    v11 = 0;
    v12 = -1;
  }
  else
  {
    v10 = Width + x + Width * 0.5;
    v11 = vcvtmd_s64_f64((v10 - Width * 1.5) / v9);
    v12 = vcvtmd_s64_f64((Width * 1.5 + v10) / v9);
  }
  v13 = v11 & ~(v11 >> 63);
  v14 = -[HKGraphView tileColumns](self, "tileColumns");
  if (v12 >= v14 - 1)
    v15 = v14 - 1;
  else
    v15 = v12;
  if (!v4
    || ((v16 = -[HKGraphView tileFirstColumn](self, "tileFirstColumn"), v13 - v16 >= 0)
      ? (v17 = v13 - v16)
      : (v17 = v16 - v13),
        v17 > -[HKGraphView tileColumnHysteresis](self, "tileColumnHysteresis")))
  {
    v47 = a2;
    v18 = -[HKGraphView tileFirstColumn](self, "tileFirstColumn");
    if (v18 <= -[HKGraphView tileLastColumn](self, "tileLastColumn"))
    {
      do
      {
        if (v18 < v13 || v18 > v15)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphView.m"), 3799, CFSTR("Failed to find tile to remove from graph view"));

          }
          -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObjectForKey:", v19);

          objc_msgSend(v21, "prepareTileForReuse");
          -[HKGraphView tileQueue](self, "tileQueue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v21);

        }
      }
      while (v18++ < -[HKGraphView tileLastColumn](self, "tileLastColumn"));
    }
    if (v13 <= v15)
    {
      v26 = v13;
      do
      {
        if (v26 < -[HKGraphView tileFirstColumn](self, "tileFirstColumn")
          || v26 > -[HKGraphView tileLastColumn](self, "tileLastColumn"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKey:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v47, self, CFSTR("HKGraphView.m"), 3810, CFSTR("Unexpected tile found in table while adding new tiles"));

          }
          -[HKGraphView _tileScreenRectForColumn:](self, "_tileScreenRectForColumn:", v26);
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v37 = v36;
          -[HKGraphView tileQueue](self, "tileQueue");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");

          if (v39)
          {
            -[HKGraphView tileQueue](self, "tileQueue");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "lastObject");
            v41 = (HKGraphTile *)objc_claimAutoreleasedReturnValue();

            -[HKGraphView tileQueue](self, "tileQueue");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "removeLastObject");
          }
          else
          {
            v43 = [HKGraphTile alloc];
            scrollView = self->_scrollView;
            -[HKGraphView graphViewTileThread](self, "graphViewTileThread");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = -[HKGraphTile initWithParentView:graphViewTileThread:](v43, "initWithParentView:graphViewTileThread:", scrollView, v42);
          }

          -[HKGraphTile setHidden:](v41, "setHidden:", -[HKGraphView tilesHidden](self, "tilesHidden"));
          -[HKGraphTile setDrawingDelegate:](v41, "setDrawingDelegate:", self);
          -[HKGraphTile configureTileWithScreenRect:column:](v41, "configureTileWithScreenRect:column:", v26, v31, v33, v35, v37);
          -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setObject:forKey:", v41, v27);

        }
        ++v26;
      }
      while (v15 + 1 != v26);
    }
    -[HKGraphView setTileFirstColumn:](self, "setTileFirstColumn:", v13);
    -[HKGraphView setTileLastColumn:](self, "setTileLastColumn:", v15);
  }
}

- (CGRect)_tileScreenRectForColumn:(int64_t)a3
{
  double Width;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  Width = CGRectGetWidth(v14);
  -[HKGraphView tileWidthInPoints](self, "tileWidthInPoints");
  v7 = -(Width - (double)a3 * v6);
  -[HKGraphView tileWidthInPoints](self, "tileWidthInPoints");
  v9 = v8;
  -[HKGraphView _scrollingAreaRect](self, "_scrollingAreaRect");
  Height = CGRectGetHeight(v15);
  v11 = 0.0;
  v12 = v7;
  v13 = v9;
  result.size.height = Height;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (void)_tileHiddenFlag:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
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
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setHidden:", v3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_markTilesDirtyWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HKGraphView setTileMarkDirtyCompletion:](self, "setTileMarkDirtyCompletion:", a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "refreshTileContent");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
    -[HKGraphView _handleMarkDirtyCompletion](self, "_handleMarkDirtyCompletion");
}

- (void)_handleMarkDirtyCompletion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v9) = objc_msgSend(v10, "tileDisplayedSinceSetNeedsDisplay");
        if (!(_DWORD)v9)
        {

          return;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__HKGraphView__handleMarkDirtyCompletion__block_invoke;
  v12[3] = &unk_1E9C40808;
  v12[4] = self;
  v11 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, 0.0);
}

void __41__HKGraphView__handleMarkDirtyCompletion__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "tileMarkDirtyCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "tileMarkDirtyCompletion");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setTileMarkDirtyCompletion:", 0);
  }
}

- (void)_hideTilesWithForce
{
  -[HKGraphRenderer setNeedsDisplay](self->_renderView, "setNeedsDisplay");
  -[HKGraphView _tileHiddenFlag:](self, "_tileHiddenFlag:", 1);
  -[HKGraphView setTilesHidden:](self, "setTilesHidden:", 1);
}

- (void)_hideTiles
{
  if (!-[HKGraphView tilesHidden](self, "tilesHidden"))
    -[HKGraphView _hideTilesWithForce](self, "_hideTilesWithForce");
}

- (void)_showTiles
{
  if (-[HKGraphView tilesHidden](self, "tilesHidden"))
  {
    -[HKGraphView _tileHiddenFlag:](self, "_tileHiddenFlag:", 0);
    -[HKGraphView setTilesHidden:](self, "setTilesHidden:", 0);
  }
}

- (void)_shutdownTilingThread
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "prepareTileForReuse");
        -[HKGraphView tileQueue](self, "tileQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[HKGraphView tilesByColumnNumber](self, "tilesByColumnNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[HKGraphViewTileThread cancel](self->_graphViewTileThread, "cancel");
}

- (id)createTileRendererWithTileRect:(CGRect)a3 column:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  HKAxis *xAxis;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  xAxis = self->_xAxis;
  -[HKGraphView zoomScale](self, "zoomScale");
  -[HKAxis rangeForChartRect:zoomScale:contentOffset:](xAxis, "rangeForChartRect:zoomScale:contentOffset:", 0.0, 0.0, width, height, v11, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView _effectiveVisibleRangeFromActualVisibleRange:](self, "_effectiveVisibleRangeFromActualVisibleRange:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView _createRendererWithCurrentStateWithChartRect:contentOffset:drawingToTile:tileColumn:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:](self, "_createRendererWithCurrentStateWithChartRect:contentOffset:drawingToTile:tileColumn:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:actualVisibleRange:", 1, a4, v13, v13, v12, 0.0, 0.0, width, height, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)tileRenderDidFinish
{
  void *v3;

  -[HKGraphView tileMarkDirtyCompletion](self, "tileMarkDirtyCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HKGraphView _handleMarkDirtyCompletion](self, "_handleMarkDirtyCompletion");
}

- (void)enumerateVisibleCoordinatesForSeries:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  int64_t v17;
  double virtualRightMarginWidth;
  double virtualLeftMarginWidth;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _BYTE v27[48];
  __int128 v28;

  v6 = a3;
  v7 = a4;
  -[HKGraphView _dataAreaRect](self, "_dataAreaRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[HKGraphView _resolutionFromSeries:](self, "_resolutionFromSeries:", v6);
  if (v13 > 0.0 && v15 > 0.0)
  {
    v17 = v16;
    virtualRightMarginWidth = self->_virtualRightMarginWidth;
    -[HKGraphView _inactiveRightAreaForRect:](self, "_inactiveRightAreaForRect:", v9, v11, v13, v15);
    virtualLeftMarginWidth = self->_virtualLeftMarginWidth;
    v21 = v9 + virtualLeftMarginWidth;
    v22 = v11 + 0.0;
    v23 = v13 - (virtualRightMarginWidth + v20 + virtualLeftMarginWidth);
    -[HKGraphView xAxis](self, "xAxis");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0C9D538];
    objc_msgSend(v24, "offsetForValueRange:chartRect:zoomScaleOut:contentOffsetOut:", self->_effectiveVisibleRangeActive, 0, &v28, v21, v22, v23, v15);
    -[HKGraphView _xAxisCoordinateTransform](self, "_xAxisCoordinateTransform");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__HKGraphView_enumerateVisibleCoordinatesForSeries_block___block_invoke;
    v25[3] = &unk_1E9C408A8;
    v26 = v7;
    objc_msgSend(v6, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", v24, v17, v27, 1, 2, v25, v21, v22, v23, v15, 1.0, v28);

  }
}

uint64_t __58__HKGraphView_enumerateVisibleCoordinatesForSeries_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_layoutOverlayView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[HKGraphView _overlayAreaRect](self, "_overlayAreaRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HKGraphView overlayView](self, "overlayView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)overlayNeedsRedisplay
{
  -[HKGraphRenderer setNeedsRender](self->_renderView, "setNeedsRender");
}

- (id)_nonOverlappingOverlaySeriesData:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "graphSeries", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "overlayType"))
        {
          objc_msgSend(v11, "overlayIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
            objc_msgSend(v4, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_overlappingOverlaySeriesData:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "graphSeries", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "overlayType"))
        {
          objc_msgSend(v11, "overlayIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v12);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v12);
            }
            objc_msgSend(v13, "addObject:", v10);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (int64_t)_ordinalForOverlayType:(int64_t)a3
{
  int64_t v3;

  v3 = 10;
  if (a3 != 1)
    v3 = 0;
  if (a3 == 2)
    return 20;
  else
    return v3;
}

- (int64_t)_overlayTypeForOverlaySeriesData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && (v17 = 0u,
        v18 = 0u,
        v15 = 0u,
        v16 = 0u,
        (v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16)) != 0))
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "graphSeries");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "overlayType");
        v13 = -[HKGraphView _ordinalForOverlayType:](self, "_ordinalForOverlayType:", v12);
        if (v13 > -[HKGraphView _ordinalForOverlayType:](self, "_ordinalForOverlayType:", v8))
          v8 = v12;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)_overlayEnvironmentType
{
  if (-[HKGraphView _drawingDuringAutoscale](self, "_drawingDuringAutoscale")
    || -[HKGraphView _drawingDuringScrolling](self, "_drawingDuringScrolling"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (void)_drawOverlaysIfNeeded:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  HKGraphView *v20;
  id v21;

  v4 = a3;
  v5 = -[HKGraphView _overlayTypeForOverlaySeriesData:](self, "_overlayTypeForOverlaySeriesData:", v4);
  if (!-[HKGraphView previousOverlayType](self, "previousOverlayType") && v5)
  {
    -[HKGraphView overlayView](self, "overlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
LABEL_7:
    objc_msgSend(v6, "setHidden:", v8);

    goto LABEL_8;
  }
  if (-[HKGraphView previousOverlayType](self, "previousOverlayType") && !v5)
  {
    -[HKGraphView overlayView](self, "overlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
    goto LABEL_7;
  }
LABEL_8:
  -[HKGraphView setPreviousOverlayType:](self, "setPreviousOverlayType:", v5);
  v9 = -[HKGraphView _overlayEnvironmentType](self, "_overlayEnvironmentType");
  if (!-[HKGraphView _drawingDuringScrolling](self, "_drawingDuringScrolling") && v5 && v9 && (v9 != 2 || v5 != 1))
  {
    -[HKGraphView overlayView](self, "overlayView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKGraphView overlayView](self, "overlayView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bringSubviewToFront:", v12);

    -[HKGraphView _nonOverlappingOverlaySeriesData:](self, "_nonOverlappingOverlaySeriesData:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView _overlappingOverlaySeriesData:](self, "_overlappingOverlaySeriesData:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphView overlayView](self, "overlayView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __37__HKGraphView__drawOverlaysIfNeeded___block_invoke;
    v18[3] = &unk_1E9C408D0;
    v19 = v13;
    v20 = self;
    v21 = v14;
    v16 = v14;
    v17 = v13;
    objc_msgSend(v15, "drawContentUsingBlock:", v18);

  }
}

void __37__HKGraphView__drawOverlaysIfNeeded___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v8 = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v10, "overlayView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_overlayViewsForOverlayData:overlayView:", v9, v11);

        objc_msgSend(v8, "graphSeries");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "drawOverlayInContext:seriesOverlayData:", a2, v9);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v5);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = *(id *)(a1 + 48);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 40);
        objc_msgSend(v19, "overlayView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_overlayViewsForOverlayData:overlayView:", v18, v20);

        objc_msgSend(v18, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "graphSeries");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "drawOverlayInContext:seriesOverlayData:", a2, v18);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v15);
  }

}

- (void)_overlayViewsForOverlayData:(id)a3 overlayView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HKGraphView overlayInteractiveViews](self, "overlayInteractiveViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "graphSeries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "graphSeries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v7, "bounds");
      objc_msgSend(v13, "layoutOverlayInteractiveViews:seriesOverlayData:overlayRect:", v11, v6);

LABEL_13:
      goto LABEL_14;
    }
    objc_msgSend(v12, "overlayInteractiveViewsWithDelegate:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HKGraphView overlayInteractiveViews](self, "overlayInteractiveViews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "graphSeries");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v14, v16);

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v14;
      v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v11);
            objc_msgSend(v7, "addSubview:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v20++), (_QWORD)v22);
          }
          while (v18 != v20);
          v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v18);
      }

      objc_msgSend(v8, "graphSeries");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      objc_msgSend(v21, "layoutOverlayInteractiveViews:seriesOverlayData:overlayRect:", v11, v6);

      goto LABEL_13;
    }
  }
LABEL_14:

}

- (HKGraphViewDelegate)delegate
{
  return (HKGraphViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKAxis)xAxis
{
  return self->_xAxis;
}

- (double)xAxisSpace
{
  return self->_xAxisSpace;
}

- (void)setXAxisSpace:(double)a3
{
  self->_xAxisSpace = a3;
}

- (BOOL)disableXAxis
{
  return self->_disableXAxis;
}

- (UIEdgeInsets)axisInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_axisInset.top;
  left = self->_axisInset.left;
  bottom = self->_axisInset.bottom;
  right = self->_axisInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (UIColor)topMarginColor
{
  return self->_topMarginColor;
}

- (void)setTopMarginColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (unint64_t)outlineOptions
{
  return self->_outlineOptions;
}

- (void)setOutlineOptions:(unint64_t)a3
{
  self->_outlineOptions = a3;
}

- (unint64_t)featheringOptions
{
  return self->_featheringOptions;
}

- (void)setFeatheringOptions:(unint64_t)a3
{
  self->_featheringOptions = a3;
}

- (BOOL)disableScrolling
{
  return self->_disableScrolling;
}

- (BOOL)disableSelection
{
  return self->_disableSelection;
}

- (BOOL)multiSeriesSelection
{
  return self->_multiSeriesSelection;
}

- (void)setMultiSeriesSelection:(BOOL)a3
{
  self->_multiSeriesSelection = a3;
}

- (BOOL)moveSelectedSeriesToFront
{
  return self->_moveSelectedSeriesToFront;
}

- (void)setMoveSelectedSeriesToFront:(BOOL)a3
{
  self->_moveSelectedSeriesToFront = a3;
}

- (HKGraphViewSelectionStyle)selectionStyle
{
  return self->_selectionStyle;
}

- (void)setSelectionStyle:(id)a3
{
  objc_storeStrong((id *)&self->_selectionStyle, a3);
}

- (int64_t)xAxisDateZoom
{
  return self->_xAxisDateZoom;
}

- (HKValueRange)effectiveAxisRange
{
  return self->_effectiveAxisRange;
}

- (HKValueRange)actualAxisRange
{
  return self->_actualAxisRange;
}

- (double)hardLeftMarginWidth
{
  return self->_hardLeftMarginWidth;
}

- (double)virtualLeftMarginWidth
{
  return self->_virtualLeftMarginWidth;
}

- (void)setVirtualLeftMarginWidth:(double)a3
{
  self->_virtualLeftMarginWidth = a3;
}

- (double)virtualRightMarginWidth
{
  return self->_virtualRightMarginWidth;
}

- (void)setVirtualRightMarginWidth:(double)a3
{
  self->_virtualRightMarginWidth = a3;
}

- (int64_t)virtualLeftMarginStyle
{
  return self->_virtualLeftMarginStyle;
}

- (int64_t)virtualRightMarginStyle
{
  return self->_virtualRightMarginStyle;
}

- (HKValueRange)actualVisibleRange
{
  return self->_actualVisibleRange;
}

- (HKValueRange)effectiveVisibleRangeCadence
{
  return self->_effectiveVisibleRangeCadence;
}

- (HKValueRange)effectiveVisibleRangeActive
{
  return self->_effectiveVisibleRangeActive;
}

- (int64_t)minimumDateZoom
{
  return self->_minimumDateZoom;
}

- (void)setMinimumDateZoom:(int64_t)a3
{
  self->_minimumDateZoom = a3;
}

- (int64_t)maximumDateZoom
{
  return self->_maximumDateZoom;
}

- (void)setMaximumDateZoom:(int64_t)a3
{
  self->_maximumDateZoom = a3;
}

- (int64_t)scrollingOptions
{
  return self->_scrollingOptions;
}

- (void)setScrollingOptions:(int64_t)a3
{
  self->_scrollingOptions = a3;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (BOOL)contentWidthFromTimeScope
{
  return self->_contentWidthFromTimeScope;
}

- (void)setContentWidthFromTimeScope:(BOOL)a3
{
  self->_contentWidthFromTimeScope = a3;
}

- (BOOL)enableStickySelection
{
  return self->_enableStickySelection;
}

- (void)setEnableStickySelection:(BOOL)a3
{
  self->_enableStickySelection = a3;
}

- (HKMultiTouchPressGestureRecognizer)multiTouchGestureRecognizer
{
  return self->_multiTouchGestureRecognizer;
}

- (BOOL)enableZoomInGesture
{
  return self->_enableZoomInGesture;
}

- (void)setEnableZoomInGesture:(BOOL)a3
{
  self->_enableZoomInGesture = a3;
}

- (BOOL)tilingDisabled
{
  return self->_tilingDisabled;
}

- (void)setTilingDisabled:(BOOL)a3
{
  self->_tilingDisabled = a3;
}

- (BOOL)prefersOpaqueLegends
{
  return self->_prefersOpaqueLegends;
}

- (void)setPrefersOpaqueLegends:(BOOL)a3
{
  self->_prefersOpaqueLegends = a3;
}

- (BOOL)drawsGridlinesPerSeriesGroup
{
  return self->_drawsGridlinesPerSeriesGroup;
}

- (void)setDrawsGridlinesPerSeriesGroup:(BOOL)a3
{
  self->_drawsGridlinesPerSeriesGroup = a3;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (BOOL)contentOffsetIsSet
{
  return self->_contentOffsetIsSet;
}

- (void)setContentOffsetIsSet:(BOOL)a3
{
  self->_contentOffsetIsSet = a3;
}

- (UIView)detailView
{
  return self->_detailView;
}

- (HKValueRange)destinationEffectiveVisibleRangeActive
{
  return self->_destinationEffectiveVisibleRangeActive;
}

- (void)setDestinationEffectiveVisibleRangeActive:(id)a3
{
  objc_storeStrong((id *)&self->_destinationEffectiveVisibleRangeActive, a3);
}

- (NSSet)yAxisAccessoryViews
{
  return self->_yAxisAccessoryViews;
}

- (void)setYAxisAccessoryViews:(id)a3
{
  objc_storeStrong((id *)&self->_yAxisAccessoryViews, a3);
}

- (int64_t)tileColumns
{
  return self->_tileColumns;
}

- (void)setTileColumns:(int64_t)a3
{
  self->_tileColumns = a3;
}

- (double)tileWidthInPoints
{
  return self->_tileWidthInPoints;
}

- (void)setTileWidthInPoints:(double)a3
{
  self->_tileWidthInPoints = a3;
}

- (int64_t)tileFirstColumn
{
  return self->_tileFirstColumn;
}

- (void)setTileFirstColumn:(int64_t)a3
{
  self->_tileFirstColumn = a3;
}

- (int64_t)tileLastColumn
{
  return self->_tileLastColumn;
}

- (void)setTileLastColumn:(int64_t)a3
{
  self->_tileLastColumn = a3;
}

- (int64_t)tileColumnHysteresis
{
  return self->_tileColumnHysteresis;
}

- (void)setTileColumnHysteresis:(int64_t)a3
{
  self->_tileColumnHysteresis = a3;
}

- (BOOL)tilesHidden
{
  return self->_tilesHidden;
}

- (void)setTilesHidden:(BOOL)a3
{
  self->_tilesHidden = a3;
}

- (NSMutableDictionary)tilesByColumnNumber
{
  return self->_tilesByColumnNumber;
}

- (void)setTilesByColumnNumber:(id)a3
{
  objc_storeStrong((id *)&self->_tilesByColumnNumber, a3);
}

- (NSMutableArray)tileQueue
{
  return self->_tileQueue;
}

- (void)setTileQueue:(id)a3
{
  objc_storeStrong((id *)&self->_tileQueue, a3);
}

- (id)tileMarkDirtyCompletion
{
  return self->_tileMarkDirtyCompletion;
}

- (void)setTileMarkDirtyCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 816);
}

- (BOOL)tilesTransientDisabled
{
  return self->_tilesTransientDisabled;
}

- (void)setTilesTransientDisabled:(BOOL)a3
{
  self->_tilesTransientDisabled = a3;
}

- (BOOL)tilesWaitingForInitialRender
{
  return self->_tilesWaitingForInitialRender;
}

- (void)setTilesWaitingForInitialRender:(BOOL)a3
{
  self->_tilesWaitingForInitialRender = a3;
}

- (int64_t)tileInitialRedrawCount
{
  return self->_tileInitialRedrawCount;
}

- (void)setTileInitialRedrawCount:(int64_t)a3
{
  self->_tileInitialRedrawCount = a3;
}

- (HKGraphViewTileThread)graphViewTileThread
{
  return self->_graphViewTileThread;
}

- (double)lastSingleSelectionXValue
{
  return self->_lastSingleSelectionXValue;
}

- (void)setLastSingleSelectionXValue:(double)a3
{
  self->_lastSingleSelectionXValue = a3;
}

- (_HKGraphViewOverlayView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (int64_t)previousOverlayType
{
  return self->_previousOverlayType;
}

- (void)setPreviousOverlayType:(int64_t)a3
{
  self->_previousOverlayType = a3;
}

- (NSMapTable)overlayInteractiveViews
{
  return self->_overlayInteractiveViews;
}

- (void)setOverlayInteractiveViews:(id)a3
{
  objc_storeStrong((id *)&self->_overlayInteractiveViews, a3);
}

- (BOOL)measuringStartupTime
{
  return self->_measuringStartupTime;
}

- (void)setMeasuringStartupTime:(BOOL)a3
{
  self->_measuringStartupTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)lastEndTime
{
  return self->_lastEndTime;
}

- (void)setLastEndTime:(double)a3
{
  self->_lastEndTime = a3;
}

- (NSTimer)startupTimer
{
  return self->_startupTimer;
}

- (void)setStartupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_startupTimer, a3);
}

- (double)firstNonemptyDrawTime
{
  return self->_firstNonemptyDrawTime;
}

- (void)setFirstNonemptyDrawTime:(double)a3
{
  self->_firstNonemptyDrawTime = a3;
}

- (BOOL)measurementStartupAutoscale
{
  return self->_measurementStartupAutoscale;
}

- (void)setMeasurementStartupAutoscale:(BOOL)a3
{
  self->_measurementStartupAutoscale = a3;
}

- (BOOL)animationAutoscaleInProgress
{
  return self->_animationAutoscaleInProgress;
}

- (void)setAnimationAutoscaleInProgress:(BOOL)a3
{
  self->_animationAutoscaleInProgress = a3;
}

- (HKPropertyAnimationApplier)animationApplier
{
  return self->_animationApplier;
}

- (void)setAnimationApplier:(id)a3
{
  objc_storeStrong((id *)&self->_animationApplier, a3);
}

- (NSMutableDictionary)currentAnimationProperties
{
  return self->_currentAnimationProperties;
}

- (void)setCurrentAnimationProperties:(id)a3
{
  objc_storeStrong((id *)&self->_currentAnimationProperties, a3);
}

- (id)externalSelectionModelCoordinate
{
  return self->_externalSelectionModelCoordinate;
}

- (void)setExternalSelectionModelCoordinate:(id)a3
{
  objc_storeStrong(&self->_externalSelectionModelCoordinate, a3);
}

- (BOOL)externalSelectionScheduled
{
  return self->_externalSelectionScheduled;
}

- (void)setExternalSelectionScheduled:(BOOL)a3
{
  self->_externalSelectionScheduled = a3;
}

- (double)externalSelectionLastLocation
{
  return self->_externalSelectionLastLocation;
}

- (void)setExternalSelectionLastLocation:(double)a3
{
  self->_externalSelectionLastLocation = a3;
}

- (NSTimer)externalSelectionCancelTimer
{
  return self->_externalSelectionCancelTimer;
}

- (void)setExternalSelectionCancelTimer:(id)a3
{
  objc_storeStrong((id *)&self->_externalSelectionCancelTimer, a3);
}

- (UIColor)capturedTileBackgroundColor
{
  return self->_capturedTileBackgroundColor;
}

- (void)setCapturedTileBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_capturedTileBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capturedTileBackgroundColor, 0);
  objc_storeStrong((id *)&self->_externalSelectionCancelTimer, 0);
  objc_storeStrong(&self->_externalSelectionModelCoordinate, 0);
  objc_storeStrong((id *)&self->_currentAnimationProperties, 0);
  objc_storeStrong((id *)&self->_animationApplier, 0);
  objc_storeStrong((id *)&self->_startupTimer, 0);
  objc_storeStrong((id *)&self->_overlayInteractiveViews, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_graphViewTileThread, 0);
  objc_storeStrong(&self->_tileMarkDirtyCompletion, 0);
  objc_storeStrong((id *)&self->_tileQueue, 0);
  objc_storeStrong((id *)&self->_tilesByColumnNumber, 0);
  objc_storeStrong((id *)&self->_yAxisAccessoryViews, 0);
  objc_storeStrong((id *)&self->_destinationEffectiveVisibleRangeActive, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_multiTouchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_effectiveVisibleRangeActive, 0);
  objc_storeStrong((id *)&self->_effectiveVisibleRangeCadence, 0);
  objc_storeStrong((id *)&self->_actualVisibleRange, 0);
  objc_storeStrong((id *)&self->_actualAxisRange, 0);
  objc_storeStrong((id *)&self->_effectiveAxisRange, 0);
  objc_storeStrong((id *)&self->_selectionStyle, 0);
  objc_storeStrong((id *)&self->_topMarginColor, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_yAxisLabelContent, 0);
  objc_storeStrong((id *)&self->_leftMarginView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_renderView, 0);
  objc_storeStrong((id *)&self->_leftFeatheringImage, 0);
  objc_storeStrong((id *)&self->_bottomFeatheringImage, 0);
  objc_storeStrong((id *)&self->_rightFeatheringImage, 0);
  objc_storeStrong((id *)&self->_topFeatheringImage, 0);
  objc_storeStrong((id *)&self->_chartableValueRange, 0);
  objc_storeStrong((id *)&self->_seriesGroupRows, 0);
}

@end
