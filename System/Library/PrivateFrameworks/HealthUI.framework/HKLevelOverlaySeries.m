@implementation HKLevelOverlaySeries

- (HKLevelOverlaySeries)initWithDisplayType:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  HKLevelOverlaySeries *v10;
  HKLevelOverlaySeries *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKLevelOverlaySeries;
  v10 = -[HKLineSeries init](&v13, sel_init);
  v11 = v10;
  if (v10)
    -[HKLevelOverlaySeries _configureOverlaySeriesWithDisplayType:dataSource:options:](v10, "_configureOverlaySeriesWithDisplayType:dataSource:options:", v8, v9, a5);

  return v11;
}

- (BOOL)shouldDisplayUpperBound
{
  return self->_options & 1;
}

- (BOOL)shouldDisplayLowerBound
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (void)_configureOverlaySeriesWithDisplayType:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  id v8;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  self->_options = a5;
  v8 = a3;
  -[HKGraphSeries setDataSource:](self, "setDataSource:", a4);
  -[HKGraphSeries setAllowsSelection:](self, "setAllowsSelection:", 0);
  +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:](HKNumericAxis, "standardNumericYAxisWithConfigurationOverrides:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries setYAxis:](self, "setYAxis:", v9);
  v10 = (void *)objc_opt_class();
  objc_msgSend(v8, "displayCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationStyleWithColor:options:", v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setUnhighlightedPresentationStyles:](self, "setUnhighlightedPresentationStyles:", v14);

  v18 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setHighlightedPresentationStyles:](self, "setHighlightedPresentationStyles:", v15);

  -[HKLineSeries setInactivePresentationStyle:](self, "setInactivePresentationStyle:", v13);
  objc_msgSend(v8, "chartingRules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "axisScalingRule");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries setAxisScalingRule:](self, "setAxisScalingRule:", v17);

}

+ (id)levelOverlaySeriesWithDisplayType:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  HKLevelOverlaySeries *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[HKLevelOverlaySeries initWithDisplayType:dataSource:options:]([HKLevelOverlaySeries alloc], "initWithDisplayType:dataSource:options:", v8, v7, a5);

  return v9;
}

+ (id)presentationStyleWithColor:(id)a3 options:(unint64_t)a4
{
  id v5;
  double v6;
  id v7;
  void *v8;
  HKLineSeriesPresentationStyle *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = HKUICeilToScreenScale(1.0);
  v7 = v5;
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDashStyle:", 4);
  objc_msgSend(v8, "setLineCap:", 1);
  v9 = objc_alloc_init(HKLineSeriesPresentationStyle);
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v9, "setStrokeStyle:", v8);
  -[HKLineSeriesPresentationStyle setWaveForm:](v9, "setWaveForm:", 0);
  -[HKLineSeriesPresentationStyle setShouldNegateAnnotationValue:](v9, "setShouldNegateAnnotationValue:", (a4 >> 2) & 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E0DC1438]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKIntegerFormatter();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:", v7, v10, 0, 2, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKLineSeriesPresentationStyle setAxisAnnotationStyle:](v9, "setAxisAnnotationStyle:", v12);
  return v9;
}

- (int64_t)overlayType
{
  return 2;
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
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  void *v25;
  __int128 v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  __int128 v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a9;
  v19 = a8;
  v20 = a5;
  v21 = a3;
  objc_msgSend(v18, "axisAnnotationDelegateForSeries:", self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "seriesDrawingDuringScrolling") & 1) != 0
    || (objc_msgSend(v18, "seriesDrawingDuringTiling") & 1) != 0
    || objc_msgSend(v18, "seriesDrawingDuringAutoscale"))
  {
    objc_msgSend(v22, "clearAxisAnnotations");
  }
  objc_msgSend(v21, "coordinates");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(_OWORD *)&a6->c;
  v36 = *(_OWORD *)&a6->a;
  v37 = v24;
  v38 = *(_OWORD *)&a6->tx;
  -[HKLevelOverlaySeries _visibleBlockCoordinatesFromBlockCoordinates:pointTransform:screenRect:strict:](self, "_visibleBlockCoordinatesFromBlockCoordinates:pointTransform:screenRect:strict:", v23, &v36, 0, x, y, width, height);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v36 = *MEMORY[0x1E0C9BAA8];
  v37 = v26;
  v38 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v21, "firstCoordinateWithTransform:roundToViewScale:", &v36, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "startXValue");
  v30 = v29;
  objc_msgSend(v27, "startXValue");
  v32 = v30 != v31;

  v33 = *(_OWORD *)&a6->c;
  v36 = *(_OWORD *)&a6->a;
  v37 = v33;
  v38 = *(_OWORD *)&a6->tx;
  LOBYTE(v34) = v32;
  -[HKLevelOverlaySeries drawSeriesWithVisibleCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:axisAnnotationDelegate:shouldExtendFirstPoint:](self, "drawSeriesWithVisibleCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:axisAnnotationDelegate:shouldExtendFirstPoint:", v25, v20, &v36, a7, v19, v18, x, y, width, height, v22, v34);

}

- (void)drawSeriesWithVisibleCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9 axisAnnotationDelegate:(id)a10 shouldExtendFirstPoint:(BOOL)a11
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  void *v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  _BOOL4 v30;
  id v31;
  _OWORD v33[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a10;
  v31 = a9;
  v20 = a3;
  -[HKLevelOverlaySeries _drawBoundAnnotationsWithCoordinates:displayUpperBound:displayLowerBound:axisAnnotationDelegate:](self, "_drawBoundAnnotationsWithCoordinates:displayUpperBound:displayLowerBound:axisAnnotationDelegate:", v20, -[HKLevelOverlaySeries shouldDisplayUpperBound](self, "shouldDisplayUpperBound"), -[HKLevelOverlaySeries shouldDisplayLowerBound](self, "shouldDisplayLowerBound"), v19);

  -[HKGraphSeries visibleValueRange](self, "visibleValueRange");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HKLevelOverlaySeries shouldDisplayUpperBound](self, "shouldDisplayUpperBound");
  v22 = -[HKLevelOverlaySeries shouldDisplayUpperBound](self, "shouldDisplayUpperBound");
  v23 = -[HKLevelOverlaySeries shouldDisplayLowerBound](self, "shouldDisplayLowerBound");
  v24 = -[HKLevelOverlaySeries shouldDisplayLowerBound](self, "shouldDisplayLowerBound");
  -[HKLineSeries unhighlightedPresentationStyles](self, "unhighlightedPresentationStyles");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "strokeStyle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(_OWORD *)&a6->c;
  v33[0] = *(_OWORD *)&a6->a;
  v33[1] = v28;
  v33[2] = *(_OWORD *)&a6->tx;
  BYTE2(v29) = v24;
  BYTE1(v29) = v23;
  LOBYTE(v29) = v22;
  -[HKLevelOverlaySeries _drawLevelBoundsInContext:coordinates:pointTransform:seriesRect:visibleValueRange:extendFirstPoint:displayUpperBound:displayUpperBoundPath:displayLowerBound:displayLowerBoundPath:strokeStyle:seriesRenderingDelegate:](self, "_drawLevelBoundsInContext:coordinates:pointTransform:seriesRect:visibleValueRange:extendFirstPoint:displayUpperBound:displayUpperBoundPath:displayLowerBound:displayLowerBoundPath:strokeStyle:seriesRenderingDelegate:", a7, v20, v33, v21, a11, v30, x, y, width, height, v29, v27, v31);

}

- (void)_drawBoundAnnotationsWithCoordinates:(id)a3 displayUpperBound:(BOOL)a4 displayLowerBound:(BOOL)a5 axisAnnotationDelegate:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a5;
  v7 = a4;
  v13 = a6;
  -[HKLevelOverlaySeries _chartDataFromBlockCoordinates:](self, "_chartDataFromBlockCoordinates:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7)
    {
      objc_msgSend(v11, "maxValue");
      -[HKLineSeries addAxisAnnotationForValue:axisAnnotationDelegate:](self, "addAxisAnnotationForValue:axisAnnotationDelegate:", v13);
    }
    if (v6)
    {
      objc_msgSend(v12, "minValue");
      -[HKLineSeries addAxisAnnotationForValue:axisAnnotationDelegate:](self, "addAxisAnnotationForValue:axisAnnotationDelegate:", v13);
    }

  }
}

- (void)_drawLevelBoundsInContext:(CGContext *)a3 coordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 seriesRect:(CGRect)a6 visibleValueRange:(id)a7 extendFirstPoint:(BOOL)a8 displayUpperBound:(BOOL)a9 displayUpperBoundPath:(BOOL)a10 displayLowerBound:(BOOL)a11 displayLowerBoundPath:(BOOL)a12 strokeStyle:(id)a13 seriesRenderingDelegate:(id)a14
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v20;
  id v21;
  id v22;
  id v23;
  double v24;
  double v25;
  CGPoint *v26;
  CGPoint *v27;
  uint64_t v28;
  double MinY;
  double v30;
  double MaxY;
  double v32;
  void *v33;
  void *v34;
  float v35;
  double v36;
  float v37;
  double b;
  double d;
  double ty;
  uint64_t v41;
  uint64_t v42;
  size_t v43;
  size_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double MinX;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double MaxX;
  double *p_x;
  double *v78;
  double *v79;
  double v80;
  double v81;
  double v82;
  double *v83;
  double v84;
  double v85;
  double *v86;
  double *v87;
  uint64_t v88;
  CGPath *Mutable;
  CGPath *v90;
  CGPath *v91;
  CGFloat *p_y;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  double v107;
  double v108;
  id obj;
  _BOOL4 v110;
  double v111;
  double v112;
  _BOOL4 path;
  const CGPath *patha;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint64_t v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  path = a9;
  v110 = a8;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v120 = *MEMORY[0x1E0C80C00];
  v20 = a4;
  v21 = a7;
  v22 = a13;
  v23 = a14;
  if (!objc_msgSend(v20, "count"))
    goto LABEL_68;
  v102 = v23;
  objc_msgSend(v23, "seriesContentOffset");
  v25 = v24;
  v26 = (CGPoint *)malloc_type_calloc(objc_msgSend(v20, "count") + 2, 0x10uLL, 0x1000040451B5BE8uLL);
  v27 = (CGPoint *)malloc_type_calloc(objc_msgSend(v20, "count") + 2, 0x10uLL, 0x1000040451B5BE8uLL);
  v28 = objc_msgSend(v20, "count");
  v121.origin.x = x;
  v121.origin.y = y;
  v121.size.width = width;
  v121.size.height = height;
  MinY = CGRectGetMinY(v121);
  objc_msgSend(v22, "lineWidth");
  v112 = MinY - v30;
  v122.origin.x = x;
  v122.origin.y = y;
  v122.size.width = width;
  v122.size.height = height;
  MaxY = CGRectGetMaxY(v122);
  objc_msgSend(v22, "lineWidth");
  v111 = MaxY + v32;
  objc_msgSend(v21, "minValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "maxValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v34, "floatValue");
      v36 = v35;
      objc_msgSend(v33, "floatValue");
      b = a5->b;
      d = a5->d;
      ty = a5->ty;
      v111 = ty + d * v37 + b * 0.0;
      v112 = ty + d * v36 + b * 0.0;
    }
  }
  v100 = v34;
  v101 = v33;
  v103 = v22;
  v104 = v21;
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v105 = v20;
  obj = v20;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
  v108 = v25;
  if (!v41)
  {
    v43 = 0;
    v107 = v25;
    goto LABEL_60;
  }
  v42 = v41;
  v43 = 0;
  v44 = v28 - 1;
  v45 = *(_QWORD *)v116;
  v107 = v25;
  do
  {
    v46 = 0;
    do
    {
      if (*(_QWORD *)v116 != v45)
        objc_enumerationMutation(obj);
      v47 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v46);
      objc_msgSend(v47, "userInfo", v100, v101);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "endXValue");
      v50 = v49;
      objc_msgSend(v48, "maxValue");
      v52 = a5->tx + v51 * a5->c + a5->a * v50;
      v53 = a5->ty + v51 * a5->d + a5->b * v50;
      objc_msgSend(v47, "endXValue");
      v55 = v54;
      objc_msgSend(v48, "minValue");
      v57 = a5->tx + v56 * a5->c + a5->a * v55;
      v58 = a5->ty + v56 * a5->d + a5->b * v55;
      if (path)
        v59 = v53;
      else
        v59 = v112;
      if (a11)
        v60 = v58;
      else
        v60 = v111;
      v123.origin.x = x;
      v123.origin.y = y;
      v123.size.width = width;
      v123.size.height = height;
      MinX = CGRectGetMinX(v123);
      if (v43 || !v110 || v52 <= MinX)
      {
        if (v43 == 1)
        {
          v62 = v26->x;
          if (v26->x < MinX)
          {
            v63 = v26->y;
            v64 = v27->x;
            v65 = v27->y;
            v66 = v63 + (v59 - v63) * (1.0 - (v52 - MinX) / (v52 - v62));
            if (v63 >= v59)
              v67 = v26->y;
            else
              v67 = v59;
            if (v52 - v62 < 0.00000011920929)
              v66 = v67;
            if (v65 >= v60)
              v68 = v27->y;
            else
              v68 = v60;
            if (v57 - v64 < 0.00000011920929)
              v69 = v68;
            else
              v69 = v65 + (v60 - v65) * (1.0 - (v57 - MinX) / (v57 - v64));
            v26->x = MinX;
            v26->y = v66;
            v27->x = MinX;
            v27->y = v69;
            if (vabdd_f64(v63, v59) > 0.00000011920929)
            {
              v70 = MinX - v62;
              v71 = v66 - v63;
              v72 = v107 - v70;
              *(float *)&v70 = v71 * v71 + v70 * v70;
              v107 = v72 + fabsf(sqrtf(*(float *)&v70));
            }
            if (vabdd_f64(v65, v60) > 0.00000011920929)
            {
              v73 = MinX - v64;
              v74 = v69 - v65;
              v75 = v108 - v73;
              *(float *)&v73 = v74 * v74 + v73 * v73;
              v108 = v75 + fabsf(sqrtf(*(float *)&v73));
            }
          }
          v43 = 1;
        }
      }
      else
      {
        v26->x = MinX;
        v26->y = v59;
        ++v44;
        v43 = 1;
        v27->x = MinX;
        v27->y = v60;
      }
      v124.origin.x = x;
      v124.origin.y = y;
      v124.size.width = width;
      v124.size.height = height;
      MaxX = CGRectGetMaxX(v124);
      if (v43 == v44 && v52 < MaxX)
      {
        p_x = &v26[v44].x;
        *p_x = v52;
        p_x[1] = v59;
        v78 = &v27[v44].x;
        *v78 = v57;
        v78[1] = v60;
        ++v44;
LABEL_41:
        v52 = MaxX;
        v43 = v44;
        goto LABEL_54;
      }
      if (v43 == v44 && v52 > MaxX)
      {
        v79 = &v26[v44 - 1].x;
        v80 = v79[1];
        v81 = v52 - *v79;
        v82 = v80 + (v59 - v80) * (1.0 - (v52 - MaxX) / v81);
        if (v80 < v59)
          v80 = v59;
        if (v81 < 0.00000011920929)
          v59 = v80;
        else
          v59 = v82;
        v83 = &v27[v44 - 1].x;
        v84 = v83[1];
        v85 = v57 - *v83;
        if (v85 >= 0.00000011920929)
        {
          v60 = v84 + (v60 - v84) * (1.0 - (v57 - MaxX) / v85);
        }
        else if (v84 >= v60)
        {
          v60 = v83[1];
        }
        goto LABEL_41;
      }
      MaxX = v57;
LABEL_54:
      v86 = &v26[v43].x;
      *v86 = v52;
      v86[1] = v59;
      v87 = &v27[v43].x;
      *v87 = MaxX;
      v87[1] = v60;
      ++v43;

      ++v46;
    }
    while (v42 != v46);
    v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
    v42 = v88;
  }
  while (v88);
LABEL_60:

  Mutable = CGPathCreateMutable();
  v90 = CGPathCreateMutable();
  v91 = CGPathCreateMutable();
  patha = Mutable;
  CGPathAddLines(Mutable, 0, v26, v43);
  CGPathAddLines(v90, 0, v27, v43);
  CGPathAddLines(v91, 0, v26, v43);
  if ((uint64_t)(v43 - 1) >= 0)
  {
    p_y = &v27[v43 - 1].y;
    do
    {
      CGPathAddLineToPoint(v91, 0, *(p_y - 1), *p_y);
      p_y -= 2;
      --v43;
    }
    while (v43);
  }
  CGPathCloseSubpath(v91);
  objc_msgSend(v103, "strokeColor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "colorWithAlphaComponent:", 0.1);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "colorWithAlphaComponent:", 0.3);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v94, v95);
  v96 = objc_claimAutoreleasedReturnValue();

  v97 = (void *)v96;
  v22 = v103;
  v98 = objc_retainAutorelease(v97);
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v98, "CGColor"));
  v99 = objc_retainAutorelease(v93);
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v99, "CGColor"));
  if (a10)
  {
    CGContextAddPath(a3, Mutable);
    objc_msgSend(v103, "applyToContext:dashPhase:", a3, v107);
    CGContextStrokePath(a3);
  }
  v21 = v104;
  v23 = v102;
  if (a12)
  {
    CGContextAddPath(a3, v90);
    objc_msgSend(v103, "applyToContext:dashPhase:", a3, v108);
    CGContextStrokePath(a3);
  }
  CGContextAddPath(a3, v91);
  CGContextFillPath(a3);
  CGPathRelease(patha);
  CGPathRelease(v90);
  CGPathRelease(v91);
  free(v26);
  free(v27);

  v20 = v105;
LABEL_68:

}

- (id)_visibleBlockCoordinatesFromBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 screenRect:(CGRect)a5 strict:(BOOL)a6
{
  double width;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  void *v22;
  char isKindOfClass;
  id v24;
  id v25;
  void (**v26)(void *, uint64_t, uint64_t);
  id v27;
  uint64_t v29;
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  width = a5.size.width;
  x = a5.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v36;
    v15 = x + width;
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v18, "startXValue");
        v20 = a4->tx + a4->c * 0.0 + a4->a * v19;
        if (v20 >= x && v20 <= v15)
        {
          objc_msgSend(v18, "userInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v31, "addObject:", v18);
            if (!a6)
            {
              v29 = v13 + i;
              if (v16 == 0x7FFFFFFFFFFFFFFFLL)
                v16 = v13 + i;
            }
          }
        }
      }
      v13 += v12;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v12);
  }
  else
  {
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__HKLevelOverlaySeries__visibleBlockCoordinatesFromBlockCoordinates_pointTransform_screenRect_strict___block_invoke;
  aBlock[3] = &unk_1E9C44C20;
  v33 = v10;
  v24 = v31;
  v34 = v24;
  v25 = v10;
  v26 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v26[2](v26, v16, 1);
  v26[2](v26, v29, 0);
  v27 = v24;

  return v27;
}

void __102__HKLevelOverlaySeries__visibleBlockCoordinatesFromBlockCoordinates_pointTransform_screenRect_strict___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v4;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;

  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = a3 ? a2 - 1 : a2 + 1;
    if ((v4 & 0x8000000000000000) == 0 && v4 < objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v8 = *(void **)(a1 + 40);
        if (a3)
          objc_msgSend(v8, "insertObject:atIndex:", v9, 0);
        else
          objc_msgSend(v8, "addObject:", v9);
      }

    }
  }
}

- (id)_chartDataFromBlockCoordinates:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_69);
}

id __55__HKLevelOverlaySeries__chartDataFromBlockCoordinates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
