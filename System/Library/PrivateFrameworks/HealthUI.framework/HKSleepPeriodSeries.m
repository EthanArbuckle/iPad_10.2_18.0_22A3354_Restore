@implementation HKSleepPeriodSeries

- (HKSleepPeriodSeries)init
{
  HKSleepPeriodSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  HKStrokeStyle *strokeStyleStorage;
  HKStrokeStyle *tiledStrokeStyleStorage;
  NSArray *defaultFillStylesStorage;
  NSArray *v8;
  NSArray *highlightedFillStylesStorage;
  NSArray *inactiveFillStylesStorage;
  HKStrokeStyle *goalLineStrokeStyleStorage;
  HKLineSeriesPointMarkerStyle *upperGoalLineMarkerStyleStorage;
  HKLineSeriesPointMarkerStyle *lowerGoalLineMarkerStyleStorage;
  id startOfDayTransformStorage;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HKSleepPeriodSeries;
  v2 = -[HKGraphSeries init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKSleepPeriodSeriesLock"));
    v2->_cornerRadiiStorage.width = 0.0;
    v2->_cornerRadiiStorage.height = 0.0;
    strokeStyleStorage = v2->_strokeStyleStorage;
    v2->_strokeStyleStorage = 0;

    tiledStrokeStyleStorage = v2->_tiledStrokeStyleStorage;
    v2->_tiledStrokeStyleStorage = 0;

    defaultFillStylesStorage = v2->_defaultFillStylesStorage;
    v8 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_defaultFillStylesStorage = (NSArray *)MEMORY[0x1E0C9AA60];

    highlightedFillStylesStorage = v2->_highlightedFillStylesStorage;
    v2->_highlightedFillStylesStorage = v8;

    inactiveFillStylesStorage = v2->_inactiveFillStylesStorage;
    v2->_inactiveFillStylesStorage = v8;

    goalLineStrokeStyleStorage = v2->_goalLineStrokeStyleStorage;
    v2->_goalLineStrokeStyleStorage = 0;

    upperGoalLineMarkerStyleStorage = v2->_upperGoalLineMarkerStyleStorage;
    v2->_upperGoalLineMarkerStyleStorage = 0;

    lowerGoalLineMarkerStyleStorage = v2->_lowerGoalLineMarkerStyleStorage;
    v2->_lowerGoalLineMarkerStyleStorage = 0;

    startOfDayTransformStorage = v2->_startOfDayTransformStorage;
    v2->_startOfDayTransformStorage = 0;

  }
  return v2;
}

- (HKStrokeStyle)strokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_strokeStyleStorage;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setStrokeStyle:(id)a3
{
  id v4;
  void *v5;
  HKStrokeStyle *v6;
  HKStrokeStyle *strokeStyleStorage;
  id v8;

  v4 = a3;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKStrokeStyle *)objc_msgSend(v4, "copy");
  strokeStyleStorage = self->_strokeStyleStorage;
  self->_strokeStyleStorage = v6;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKStrokeStyle)tiledStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_tiledStrokeStyleStorage;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setTiledStrokeStyle:(id)a3
{
  id v4;
  void *v5;
  HKStrokeStyle *v6;
  HKStrokeStyle *tiledStrokeStyleStorage;
  id v8;

  v4 = a3;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKStrokeStyle *)objc_msgSend(v4, "copy");
  tiledStrokeStyleStorage = self->_tiledStrokeStyleStorage;
  self->_tiledStrokeStyleStorage = v6;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (NSArray)defaultFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_defaultFillStylesStorage;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setDefaultFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *defaultFillStylesStorage;
  id v8;

  v4 = a3;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  defaultFillStylesStorage = self->_defaultFillStylesStorage;
  self->_defaultFillStylesStorage = v6;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (NSArray)highlightedFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_highlightedFillStylesStorage;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setHighlightedFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *highlightedFillStylesStorage;
  id v8;

  v4 = a3;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  highlightedFillStylesStorage = self->_highlightedFillStylesStorage;
  self->_highlightedFillStylesStorage = v6;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (NSArray)inactiveFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_inactiveFillStylesStorage;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setInactiveFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *inactiveFillStylesStorage;
  id v8;

  v4 = a3;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  inactiveFillStylesStorage = self->_inactiveFillStylesStorage;
  self->_inactiveFillStylesStorage = v6;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKStrokeStyle)goalLineStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_goalLineStrokeStyleStorage;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setGoalLineStrokeStyle:(id)a3
{
  id v4;
  void *v5;
  HKStrokeStyle *v6;
  HKStrokeStyle *goalLineStrokeStyleStorage;
  id v8;

  v4 = a3;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKStrokeStyle *)objc_msgSend(v4, "copy");
  goalLineStrokeStyleStorage = self->_goalLineStrokeStyleStorage;
  self->_goalLineStrokeStyleStorage = v6;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKLineSeriesPointMarkerStyle)upperGoalLineMarkerStyle
{
  void *v3;
  HKLineSeriesPointMarkerStyle *v4;
  void *v5;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_upperGoalLineMarkerStyleStorage;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setUpperGoalLineMarkerStyle:(id)a3
{
  HKLineSeriesPointMarkerStyle *v4;
  void *v5;
  HKLineSeriesPointMarkerStyle *upperGoalLineMarkerStyleStorage;
  id v7;

  v4 = (HKLineSeriesPointMarkerStyle *)a3;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  upperGoalLineMarkerStyleStorage = self->_upperGoalLineMarkerStyleStorage;
  self->_upperGoalLineMarkerStyleStorage = v4;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKLineSeriesPointMarkerStyle)lowerGoalLineMarkerStyle
{
  void *v3;
  HKLineSeriesPointMarkerStyle *v4;
  void *v5;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_lowerGoalLineMarkerStyleStorage;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setLowerGoalLineMarkerStyle:(id)a3
{
  HKLineSeriesPointMarkerStyle *v4;
  void *v5;
  HKLineSeriesPointMarkerStyle *lowerGoalLineMarkerStyleStorage;
  id v7;

  v4 = (HKLineSeriesPointMarkerStyle *)a3;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  lowerGoalLineMarkerStyleStorage = self->_lowerGoalLineMarkerStyleStorage;
  self->_lowerGoalLineMarkerStyleStorage = v4;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (id)startOfDayTransform
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = _Block_copy(self->_startOfDayTransformStorage);
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  v6 = _Block_copy(v4);
  return v6;
}

- (void)setStartOfDayTransform:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id startOfDayTransformStorage;
  id v8;

  v4 = a3;
  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (void *)objc_msgSend(v4, "copy");
  startOfDayTransformStorage = self->_startOfDayTransformStorage;
  self->_startOfDayTransformStorage = v6;

  -[HKSleepPeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (void)clearCaches
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
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
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HKSleepPeriodSeries defaultFillStyles](self, "defaultFillStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v7++), "clearCache");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v5);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HKSleepPeriodSeries highlightedFillStyles](self, "highlightedFillStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12++), "clearCache");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v10);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HKSleepPeriodSeries inactiveFillStyles](self, "inactiveFillStyles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "clearCache");
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v15);
  }

  v18.receiver = self;
  v18.super_class = (Class)HKSleepPeriodSeries;
  -[HKGraphSeries clearCaches](&v18, sel_clearCaches);
}

- (BOOL)shouldInvertAxis
{
  return 1;
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int64_t v23;
  __int128 v24;
  double v25;
  _OWORD v26[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a3;
  v19 = a5;
  v20 = a9;
  -[HKSleepPeriodSeries defaultFillStyles](self, "defaultFillStyles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

LABEL_4:
    v23 = -[HKSleepPeriodSeries visibleBarCountWithZoomLevelConfiguration:](self, "visibleBarCountWithZoomLevelConfiguration:", v19);
    objc_msgSend(v19, "approximateSeriesPointIntervalAtResolution:", 0);
    v24 = *(_OWORD *)&a6->c;
    v26[0] = *(_OWORD *)&a6->a;
    v26[1] = v24;
    v26[2] = *(_OWORD *)&a6->tx;
    -[HKSleepPeriodSeries _drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:axisResolution:seriesRenderingDelegate:](self, "_drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:axisResolution:seriesRenderingDelegate:", v18, v23, v26, a7, v20, x, y, width, height, v25);
    goto LABEL_5;
  }
  -[HKSleepPeriodSeries highlightedFillStyles](self, "highlightedFillStyles");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    goto LABEL_4;
LABEL_5:

}

- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  int64_t v8;

  v3 = a3;
  objc_msgSend(v3, "canonicalSize");
  v5 = v4;
  objc_msgSend(v3, "seriesPointIntervalComponentsAtResolution:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hk_approximateDuration");
  v8 = vcvtmd_s64_f64(v5 / fmax(v7, 1.0));

  return v8;
}

- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5
{
  double v5;
  double v6;
  double result;

  v5 = a4.size.width / (double)a3;
  v6 = v5 * 0.33;
  if (v5 * 0.33 <= a5)
    v6 = a5;
  result = round(v5 - v6);
  if (result > 29.0)
    return 29.0;
  return result;
}

- (void)_drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 axisResolution:(double)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat MinX;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
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
  int v60;
  id v61;
  id v62;
  CGFloat MaxX;
  id v64;
  id v65;
  id v66;
  void *v67;
  _OWORD v68[3];
  _QWORD v69[4];
  id v70;
  id v71;
  HKSleepPeriodSeries *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint64_t *v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t *v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD v98[4];
  _QWORD v99[5];
  id v100;
  _QWORD v101[5];
  id v102;
  _QWORD v103[4];
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  _QWORD v116[2];
  _QWORD v117[4];
  CGRect v118;
  CGRect v119;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v117[2] = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v66 = a9;
  v60 = objc_msgSend(v66, "seriesDrawingDuringTiling");
  if (v60
    && (-[HKSleepPeriodSeries tiledStrokeStyle](self, "tiledStrokeStyle"),
        (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[HKSleepPeriodSeries tiledStrokeStyle](self, "tiledStrokeStyle");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKSleepPeriodSeries strokeStyle](self, "strokeStyle");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v67, "lineWidth");
  v21 = v20;
  objc_msgSend(v66, "screenRectForSeries:", self);
  -[HKSleepPeriodSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4);
  v23 = v22;
  v118.origin.x = x;
  v118.origin.y = y;
  v118.size.width = width;
  v118.size.height = height;
  MaxX = CGRectGetMaxX(v118);
  v119.origin.x = x;
  v119.origin.y = y;
  v119.size.width = width;
  v119.size.height = height;
  MinX = CGRectGetMinX(v119);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v25;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v29;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0;
  v111 = &v110;
  v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__23;
  v114 = __Block_byref_object_dispose__23;
  v115 = 0;
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__23;
  v108 = __Block_byref_object_dispose__23;
  v109 = 0;
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x2020000000;
  v103[3] = 0xFFEFFFFFFFFFFFFFLL;
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x3032000000;
  v101[3] = __Block_byref_object_copy__23;
  v101[4] = __Block_byref_object_dispose__23;
  v102 = 0;
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x3032000000;
  v99[3] = __Block_byref_object_copy__23;
  v99[4] = __Block_byref_object_dispose__23;
  v100 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  v98[3] = 0xFFEFFFFFFFFFFFFFLL;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = v21 + v23 + v21 + v23;
  v38 = a8 / 86400.0 * 0.05;
  v69[1] = 3221225472;
  v39 = a8 / 86400.0 - v38;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[2] = __136__HKSleepPeriodSeries__drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_axisResolution_seriesRenderingDelegate___block_invoke;
  v69[3] = &unk_1E9C453F8;
  v40 = a8 / 86400.0 + v38;
  v84 = MinX;
  v85 = v37;
  v86 = MaxX;
  v64 = v28;
  v70 = v64;
  v62 = v32;
  v71 = v62;
  v72 = self;
  v77 = &v94;
  v78 = v103;
  v87 = v23;
  v88 = v39;
  v89 = v40;
  v79 = v101;
  v80 = v98;
  v81 = v99;
  v61 = v33;
  v73 = v61;
  v41 = v35;
  v74 = v41;
  v42 = v34;
  v75 = v42;
  v43 = v36;
  v90 = x;
  v91 = y;
  v92 = width;
  v93 = height;
  v76 = v43;
  v82 = &v110;
  v83 = &v104;
  v44 = *(_OWORD *)&a5->c;
  v68[0] = *(_OWORD *)&a5->a;
  v68[1] = v44;
  v68[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v65, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v68, 1, v69);
  if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
    -[HKSleepPeriodSeries defaultFillStyles](self, "defaultFillStyles");
  else
    -[HKSleepPeriodSeries inactiveFillStyles](self, "inactiveFillStyles");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodSeries drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "drawPaths:withFillStyles:strokeStyle:axisRect:context:", v64, v45, v67, a6, x, y, width, height);
  -[HKSleepPeriodSeries highlightedFillStyles](self, "highlightedFillStyles");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (!v46)
  {
    -[HKSleepPeriodSeries defaultFillStyles](self, "defaultFillStyles");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HKSleepPeriodSeries drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "drawPaths:withFillStyles:strokeStyle:axisRect:context:", v62, v47, v67, a6, x, y, width, height);
  if (!v46)

  -[HKSleepPeriodSeries upperGoalLineMarkerStyle](self, "upperGoalLineMarkerStyle");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    -[HKSleepPeriodSeries upperGoalLineMarkerStyle](self, "upperGoalLineMarkerStyle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKChartSeriesPointMarker chartPointWithLineSeriesPresentationStyle:](HKChartSeriesPointMarker, "chartPointWithLineSeriesPresentationStyle:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
  }

  -[HKSleepPeriodSeries lowerGoalLineMarkerStyle](self, "lowerGoalLineMarkerStyle");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    -[HKSleepPeriodSeries lowerGoalLineMarkerStyle](self, "lowerGoalLineMarkerStyle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKChartSeriesPointMarker chartPointWithLineSeriesPresentationStyle:](HKChartSeriesPointMarker, "chartPointWithLineSeriesPresentationStyle:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v53 = 0;
  }

  -[HKSleepPeriodSeries drawGoalLinePath:goalMarkerPoints:markerImage:context:](self, "drawGoalLinePath:goalMarkerPoints:markerImage:context:", v61, v41, v50, a6);
  -[HKSleepPeriodSeries drawGoalLinePath:goalMarkerPoints:markerImage:context:](self, "drawGoalLinePath:goalMarkerPoints:markerImage:context:", v42, v43, v53, a6);
  -[HKSleepPeriodSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54 == 0;

  if (!v55)
  {
    objc_msgSend(v66, "axisAnnotationDelegateForSeries:", self);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)v111[5];
    if (v57)
    {
      objc_msgSend(v57, "doubleValue");
      -[HKSleepPeriodSeries addAnnotationForValue:axisAnnotationDelegate:](self, "addAnnotationForValue:axisAnnotationDelegate:", v56);
    }
    v58 = (void *)v105[5];
    if (v58)
    {
      objc_msgSend(v58, "doubleValue");
      -[HKSleepPeriodSeries addAnnotationForValue:axisAnnotationDelegate:](self, "addAnnotationForValue:axisAnnotationDelegate:", v56);
    }

  }
  if (((v60 | objc_msgSend(v66, "measuringStartupTime") ^ 1) & 1) == 0 && v95[3] >= 1)
  {
    -[HKGraphSeries delegate](self, "delegate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "nonemptyDrawComplete");

  }
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v99, 8);

  _Block_object_dispose(v101, 8);
  _Block_object_dispose(v103, 8);
  _Block_object_dispose(&v104, 8);

  _Block_object_dispose(&v110, 8);
}

void __136__HKSleepPeriodSeries__drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_axisResolution_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double x;
  double y;
  double width;
  double height;
  double v37;
  double v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  unint64_t v73;
  double v74;
  double v75;
  BOOL v76;
  id v77;
  void *v78;
  double v79;
  char v80;
  void *v81;
  void *v82;
  double v83;
  uint64_t v84;
  void *v85;
  double v86;
  char v87;
  void *v88;
  void *v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  id v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;

  v105 = a2;
  v6 = a4;
  objc_msgSend(v105, "xValue");
  v8 = v7;
  v9 = *(double *)(a1 + 152);
  if (*(double *)(a1 + 144) - v8 <= v9 && v8 - *(double *)(a1 + 160) <= v9)
  {
    objc_msgSend(v105, "asleepYValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    v12 = v105;
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v105, "highlighted"))
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 1);
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v14;
      }
      objc_msgSend(v105, "asleepYValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v105, "asleepYValues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 < 2)
      {
        v21 = v16;
      }
      else
      {
        v19 = 1;
        do
        {
          objc_msgSend(v105, "asleepYValues");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          v24 = v23;

          objc_msgSend(v21, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v27 = v26;

          if ((v19 & 1) != 0)
          {
            if (objc_msgSend(v16, "continuation"))
              v28 = 0;
            else
              v28 = 3;
            if (!objc_msgSend(v21, "continuation"))
              v28 |= 0xCuLL;
            if (v27 - v24 >= 0.0)
              v30 = v27 - v24;
            else
              v30 = -(v27 - v24);
            v31 = v8;
            v32 = v24;
            v29 = *(_QWORD *)(a1 + 168);
            v106 = CGRectStandardize(*(CGRect *)(&v30 - 3));
            v107 = CGRectOffset(v106, *(double *)(a1 + 168) * -0.5, 0.0);
            x = v107.origin.x;
            y = v107.origin.y;
            width = v107.size.width;
            height = v107.size.height;
            objc_msgSend(*(id *)(a1 + 48), "cornerRadii");
            +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", v28, x, y, width, height, v37, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "appendPath:", v39);

            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          }

          ++v19;
          objc_msgSend(v105, "asleepYValues");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "count");

          v16 = v21;
        }
        while (v19 < v41);
      }

      v12 = v105;
    }
    objc_msgSend(v12, "inBedYValues");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");

    if (v43)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v105, "highlighted"))
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
        v45 = objc_claimAutoreleasedReturnValue();

        v44 = (void *)v45;
      }
      objc_msgSend(v105, "inBedYValues");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v105, "inBedYValues");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "count");

      if (v49 < 2)
      {
        v53 = v47;
      }
      else
      {
        v50 = 1;
        v51 = v105;
        do
        {
          objc_msgSend(v51, "inBedYValues");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectAtIndexedSubscript:", v50);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v47, "value");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "doubleValue");
          v56 = v55;

          objc_msgSend(v53, "value");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "doubleValue");
          v59 = v58;

          if ((v50 & 1) != 0)
          {
            if (objc_msgSend(v47, "continuation"))
              v60 = 0;
            else
              v60 = 3;
            if (!objc_msgSend(v53, "continuation"))
              v60 |= 0xCuLL;
            if (v59 - v56 >= 0.0)
              v62 = v59 - v56;
            else
              v62 = -(v59 - v56);
            v63 = v8;
            v64 = v56;
            v61 = *(_QWORD *)(a1 + 168);
            v108 = CGRectStandardize(*(CGRect *)(&v62 - 3));
            v109 = CGRectOffset(v108, *(double *)(a1 + 168) * -0.5, 0.0);
            v65 = v109.origin.x;
            v66 = v109.origin.y;
            v67 = v109.size.width;
            v68 = v109.size.height;
            objc_msgSend(*(id *)(a1 + 48), "cornerRadii");
            +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", v60, v65, v66, v67, v68, v69, v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "appendPath:", v71);

            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          }

          ++v50;
          objc_msgSend(v105, "inBedYValues");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v72, "count");

          v47 = v53;
          v51 = v105;
        }
        while (v50 < v73);
      }

    }
    objc_msgSend(v6, "xValue");
    v75 = vabdd_f64(v74, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
    v76 = v75 < *(double *)(a1 + 176) || v75 > *(double *)(a1 + 184);
    v77 = v105;
    v78 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
    if (v78
      && ((v79 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24), v79 >= v8) ? (v80 = 1) : (v80 = v76),
          (v80 & 1) == 0))
    {
      v82 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v78, "doubleValue");
      objc_msgSend(v82, "valueWithCGPoint:", v79, v83);
      v84 = objc_claimAutoreleasedReturnValue();
      v77 = v105;
      v81 = (void *)v84;
    }
    else
    {
      v81 = 0;
    }
    v85 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
    if (v85
      && ((v86 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24), v86 >= v8) ? (v87 = 1) : (v87 = v76),
          (v87 & 1) == 0))
    {
      v89 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v85, "doubleValue");
      objc_msgSend(v89, "valueWithCGPoint:", v86, v90);
      v91 = objc_claimAutoreleasedReturnValue();
      v77 = v105;
      v88 = (void *)v91;
    }
    else
    {
      v88 = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "addGoalLinePathsToCoordinate:upperGoalLinePath:upperGoalMarkerPoints:previousUpperGoalLinePoint:lowerGoalLinePath:lowerGoalMarkerPoints:previousLowerGoalLinePoint:axisRect:", v77, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v81, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216), v88);
    if (v8 <= *(double *)(a1 + 160))
    {
      objc_msgSend(v6, "upperGoalYValue");
      v92 = objc_claimAutoreleasedReturnValue();
      v93 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
      v94 = *(void **)(v93 + 40);
      *(_QWORD *)(v93 + 40) = v92;

      objc_msgSend(v6, "lowerGoalYValue");
      v95 = objc_claimAutoreleasedReturnValue();
      v96 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
      v97 = *(void **)(v96 + 40);
      *(_QWORD *)(v96 + 40) = v95;

    }
    objc_msgSend(v6, "xValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v98;
    objc_msgSend(v105, "upperGoalYValue");
    v99 = objc_claimAutoreleasedReturnValue();
    v100 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v101 = *(void **)(v100 + 40);
    *(_QWORD *)(v100 + 40) = v99;

    objc_msgSend(v105, "lowerGoalYValue");
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
    v104 = *(void **)(v103 + 40);
    *(_QWORD *)(v103 + 40) = v102;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v8;
  }

}

- (void)addGoalLinePathsToCoordinate:(id)a3 upperGoalLinePath:(id)a4 upperGoalMarkerPoints:(id)a5 previousUpperGoalLinePoint:(id)a6 lowerGoalLinePath:(id)a7 lowerGoalMarkerPoints:(id)a8 previousLowerGoalLinePoint:(id)a9 axisRect:(CGRect)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  id v34;

  v34 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  objc_msgSend(v34, "xValue");
  v22 = v21;
  objc_msgSend(v34, "upperGoalYValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v34;
  if (v23)
  {
    objc_msgSend(v34, "upperGoalYValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    if (v17)
    {
      objc_msgSend(v17, "CGPointValue");
      objc_msgSend(v15, "moveToPoint:");
      objc_msgSend(v15, "addLineToPoint:", v22, v27);
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v22, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v28);

    v24 = v34;
  }
  objc_msgSend(v24, "lowerGoalYValue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v34, "lowerGoalYValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v32 = v31;

    if (v20)
    {
      objc_msgSend(v20, "CGPointValue");
      objc_msgSend(v18, "moveToPoint:");
      objc_msgSend(v18, "addLineToPoint:", v22, v32);
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v22, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v33);

  }
}

- (void)drawGoalLinePath:(id)a3 goalMarkerPoints:(id)a4 markerImage:(id)a5 context:(CGContext *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGImage *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEmpty") & 1) == 0)
  {
    -[HKSleepPeriodSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      CGContextSaveGState(a6);
      -[HKSleepPeriodSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applyToContext:", a6);

      CGContextAddPath(a6, (CGPathRef)objc_msgSend(objc_retainAutorelease(v10), "CGPath"));
      CGContextStrokePath(a6);
      CGContextRestoreGState(a6);
    }
  }
  if (v12)
  {
    CGContextSaveGState(a6);
    v15 = HKChartSeriesPointMarkerBaseRect(v12);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = (CGImage *)objc_msgSend(objc_retainAutorelease(v12), "CGImage");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v11;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v27), "CGPointValue", (_QWORD)v32);
          v29 = v28;
          v31 = v30;
          v38.origin.x = v15;
          v38.origin.y = v17;
          v38.size.width = v19;
          v38.size.height = v21;
          v39 = CGRectOffset(v38, v29, v31);
          CGContextDrawImage(a6, v39, v22);
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v25);
    }

    CGContextRestoreGState(a6);
  }

}

- (void)drawPaths:(id)a3 withFillStyles:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v36 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = v15;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v18, "appendPath:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v23++), (_QWORD)v31);
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v21);
    }

    CGContextSaveGState(a7);
    objc_msgSend(v17, "applyToContext:", a7);
    v24 = objc_retainAutorelease(v18);
    CGContextAddPath(a7, (CGPathRef)objc_msgSend(v24, "CGPath"));
    CGContextStrokePath(a7);
    CGContextRestoreGState(a7);

  }
  if (objc_msgSend(v15, "count", (_QWORD)v31))
  {
    v25 = 0;
    do
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isEmpty") & 1) == 0 && v25 < objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", v25);
        v27 = objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = (void *)v27;
          v29 = objc_msgSend(objc_retainAutorelease(v26), "CGPath");
          -[HKGraphSeries alpha](self, "alpha");
          objc_msgSend(v28, "renderPath:context:axisRect:alpha:", v29, a7, x, y, width, height, v30);

        }
      }

      ++v25;
    }
    while (v25 < objc_msgSend(v15, "count"));
  }

}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v22;
  __int128 v23;
  int64_t resolution;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "chartPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepPeriodSeries.m"), 611, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __65__HKSleepPeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C453A8;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
  v23 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v17, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __65__HKSleepPeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HKSleepPeriodCoordinate *v25;
  void *v26;
  void *v27;
  void *v28;
  HKSleepPeriodCoordinate *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "yValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "xValueAsGenericType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinateForValue:", v6);
    v8 = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v3, "allYValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(a1 + 40), "coordinateForValue:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "upperGoal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = *(void **)(a1 + 40);
      objc_msgSend(v3, "upperGoal");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "coordinateForValue:", v19);
      objc_msgSend(v17, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v3, "lowerGoal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = *(void **)(a1 + 40);
      objc_msgSend(v3, "lowerGoal");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "coordinateForValue:", v23);
      objc_msgSend(v21, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v3, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [HKSleepPeriodCoordinate alloc];
    objc_msgSend(v3, "asleepOffsets");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inBedOffsets");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allYValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HKSleepPeriodCoordinate initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:](v25, "initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:", v26, v27, v28, v16, v20, objc_msgSend(v3, "highlighted"), v8, v24);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);
  }

}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HKSleepPeriodSeries _assertCoordinateCompatibility:](self, "_assertCoordinateCompatibility:", v6);
  v7 = v6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v7, "yValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = 1.79769313e308;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "xValue");
        objc_msgSend(v14, "doubleValue");
        UIDistanceBetweenPoints();
        if (v12 >= v15)
          v12 = v15;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1.79769313e308;
  }

  return v12;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  double v6;

  x = a3.x;
  objc_msgSend(a4, "startXValue", a3.x, a3.y, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return vabdd_f64(v6, x);
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[HKSleepPeriodSeries _assertCoordinateCompatibility:](self, "_assertCoordinateCompatibility:", v7);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v7, "yValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    v12 = 1.79769313e308;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "doubleValue");
        if (vabdd_f64(v14, y) < fabs(v12))
          v12 = v14 - y;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1.79769313e308;
  }

  return v12;
}

- (void)_assertCoordinateCompatibility:(id)a3
{
  id v5;
  char isKindOfClass;
  id v7;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepPeriodSeries.m"), 695, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coordinate isKindOfClass:[HKSleepPeriodCoordinate class]]"));

  }
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(v8, "startXValue");
  v10 = v9;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (v10 >= CGRectGetMinX(v15))
  {
    objc_msgSend(v8, "endXValue");
    v13 = v12;
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v11 = v13 <= CGRectGetMaxX(v16);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)_minimumYForCoordinate:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
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
  objc_msgSend(a3, "yValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "doubleValue");
        if (v7 >= v9)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1.79769313e308;
  }

  return v7;
}

- (double)_maximumYForCoordinate:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
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
  objc_msgSend(a3, "yValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = -1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "doubleValue");
        if (v7 < v9)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = -1.79769313e308;
  }

  return v7;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a4;
  v7 = a3;
  -[HKSleepPeriodSeries _assertCoordinateCompatibility:](self, "_assertCoordinateCompatibility:", v7);
  -[HKSleepPeriodSeries _minimumYForCoordinate:](self, "_minimumYForCoordinate:", v7);
  v9 = v8;

  -[HKSleepPeriodSeries _minimumYForCoordinate:](self, "_minimumYForCoordinate:", v6);
  v11 = v10;

  return v9 < v11;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a4;
  v7 = a3;
  -[HKSleepPeriodSeries _assertCoordinateCompatibility:](self, "_assertCoordinateCompatibility:", v7);
  -[HKSleepPeriodSeries _maximumYForCoordinate:](self, "_maximumYForCoordinate:", v7);
  v9 = v8;

  -[HKSleepPeriodSeries _maximumYForCoordinate:](self, "_maximumYForCoordinate:", v6);
  v11 = v10;

  return v9 > v11;
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[6];
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;

  v9 = a3;
  v10 = a4;
  -[HKSleepPeriodSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 || !-[HKGraphSeries allowsSelection](self, "allowsSelection")) && (v11, v9))
  {
    v27 = 0;
    v28 = (double *)&v27;
    v29 = 0x2020000000;
    v30 = 0;
    objc_msgSend(v9, "minValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    v30 = v14;
    v23 = 0;
    v24 = (double *)&v23;
    v25 = 0x2020000000;
    v26 = 0;
    objc_msgSend(v9, "maxValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    v26 = v17;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70__HKSleepPeriodSeries_marginsForYAxis_xAxisRange_zoomLevel_chartRect___block_invoke;
    v22[3] = &unk_1E9C45420;
    v22[4] = &v27;
    v22[5] = &v23;
    -[HKGraphSeries enumerateChartPointsInRange:zoomLevel:resolution:block:](self, "enumerateChartPointsInRange:zoomLevel:resolution:block:", v10, a5, 0, v22);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28[3]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24[3]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v18, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v20 = v9;
  }

  return v20;
}

void __70__HKSleepPeriodSeries_marginsForYAxis_xAxisRange_zoomLevel_chartRect___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v18;
    objc_msgSend(v5, "upperGoal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      objc_msgSend(v5, "upperGoal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      if (v7 >= v10)
        v11 = v10;
      else
        v11 = v7;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;
    }
    objc_msgSend(v5, "lowerGoal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      objc_msgSend(v5, "lowerGoal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      if (v13 >= v16)
        v17 = v13;
      else
        v17 = v16;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v17;
    }

    v4 = v18;
  }

}

- (void)addAnnotationForValue:(double)a3 axisAnnotationDelegate:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a4)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a4;
    objc_msgSend(v6, "numberWithDouble:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HKSleepPeriodSeries _stringFromTimeSinceNoon:](self, "_stringFromTimeSinceNoon:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepPeriodSeries _attributedAxisString:](self, "_attributedAxisString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAxisAnnotation:forSeries:modelCoordinate:", v9, self, v10);

  }
}

- (id)_stringFromTimeSinceNoon:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodSeries startOfDayTransform](self, "startOfDayTransform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HKSleepPeriodSeries startOfDayTransform](self, "startOfDayTransform");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v8)[2](v8, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startOfDayForDate:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v5, "doubleValue");
  v12 = v11;

  objc_msgSend(v10, "dateByAddingTimeInterval:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v13, 28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_attributedAxisString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0DC1138];
  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = a3;
  objc_msgSend(v3, "hk_chartAxisLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v7);
  return v8;
}

+ (id)_sleepCircleImageWithWidth:(double)a3 diameter:(double)a4 color:(id)a5
{
  id v7;
  CGContext *CurrentContext;
  id v9;
  CGColor *v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v7 = a5;
  v13.width = a3;
  v13.height = a3;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = objc_retainAutorelease(v7);
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v14.origin.x = a3 * 0.5 - a4 * 0.5;
  v14.origin.y = v14.origin.x;
  v14.size.width = a4;
  v14.size.height = a4;
  CGContextFillEllipseInRect(CurrentContext, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

+ (id)asleepImageCompatibleWithFont:(id)a3 withColor:(id)a4
{
  id v6;
  double v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "capHeight");
  objc_msgSend(a1, "_sleepCircleImageWithWidth:diameter:color:", v6, v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)inBedImageCompatibleWithFont:(id)a3 withColor:(id)a4
{
  id v6;
  double v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "capHeight");
  objc_msgSend(a1, "_sleepCircleImageWithWidth:diameter:color:", v6, v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)cornerRadii
{
  double width;
  double height;
  CGSize result;

  width = self->_cornerRadii.width;
  height = self->_cornerRadii.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCornerRadii:(CGSize)a3
{
  self->_cornerRadii = a3;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (CGSize)cornerRadiiStorage
{
  double width;
  double height;
  CGSize result;

  width = self->_cornerRadiiStorage.width;
  height = self->_cornerRadiiStorage.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCornerRadiiStorage:(CGSize)a3
{
  self->_cornerRadiiStorage = a3;
}

- (HKStrokeStyle)strokeStyleStorage
{
  return self->_strokeStyleStorage;
}

- (void)setStrokeStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (HKStrokeStyle)tiledStrokeStyleStorage
{
  return self->_tiledStrokeStyleStorage;
}

- (void)setTiledStrokeStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)defaultFillStylesStorage
{
  return self->_defaultFillStylesStorage;
}

- (void)setDefaultFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSArray)highlightedFillStylesStorage
{
  return self->_highlightedFillStylesStorage;
}

- (void)setHighlightedFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSArray)inactiveFillStylesStorage
{
  return self->_inactiveFillStylesStorage;
}

- (void)setInactiveFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (HKStrokeStyle)goalLineStrokeStyleStorage
{
  return self->_goalLineStrokeStyleStorage;
}

- (void)setGoalLineStrokeStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (HKLineSeriesPointMarkerStyle)upperGoalLineMarkerStyleStorage
{
  return self->_upperGoalLineMarkerStyleStorage;
}

- (void)setUpperGoalLineMarkerStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_upperGoalLineMarkerStyleStorage, a3);
}

- (HKLineSeriesPointMarkerStyle)lowerGoalLineMarkerStyleStorage
{
  return self->_lowerGoalLineMarkerStyleStorage;
}

- (void)setLowerGoalLineMarkerStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_lowerGoalLineMarkerStyleStorage, a3);
}

- (id)startOfDayTransformStorage
{
  return self->_startOfDayTransformStorage;
}

- (void)setStartOfDayTransformStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startOfDayTransformStorage, 0);
  objc_storeStrong((id *)&self->_lowerGoalLineMarkerStyleStorage, 0);
  objc_storeStrong((id *)&self->_upperGoalLineMarkerStyleStorage, 0);
  objc_storeStrong((id *)&self->_goalLineStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_inactiveFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_highlightedFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_defaultFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_tiledStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_strokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
