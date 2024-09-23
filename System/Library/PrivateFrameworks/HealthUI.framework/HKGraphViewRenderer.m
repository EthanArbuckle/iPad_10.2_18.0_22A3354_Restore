@implementation HKGraphViewRenderer

- (id)initWithRendererSeries:(double)a3 renderingView:(double)a4 fullChartRect:(double)a5 insetChartRect:(double)a6 insetDataArea:(double)a7 rightHandInactiveArea:(double)a8 zoomScale:(double)a9 traitResolution:(uint64_t)a10 contentOffset:(void *)a11 xAxisDateZoom:(void *)a12 drawingToTile:(void *)a13 tileColumn:(void *)a14 drawingDuringScrolling:(char)a15 drawingDuringAutoscale:(void *)a16 xAxis:(void *)a17 xAxisCoordinateTransform:(void *)a18 virtualMargins:(void *)a19 outlineColor:(void *)a20 tileBackgroundColor:(void *)a21 topBaselineY:(void *)a22 bottomBaselineY:(void *)a23 selectionLineColor:(void *)a24 selectionLineStyle:(char)a25 disableXAxis:(char)a26 currentXAxisHeight:(void *)a27 gridlineRanges:(__int128 *)a28 effectiveVisibleRangeCadence:(void *)a29 effectiveVisibleRangeActive:(void *)a30 actualVisibleRange:(void *)a31 scrollingAreaRect:(void *)a32 chartMeasuringStartupTime:(void *)a33
{
  id v55;
  id v56;
  id v57;
  id *v58;
  id *v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  id v71;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  objc_super v86;

  v77 = a11;
  v71 = a12;
  v85 = a12;
  v84 = a27;
  v83 = a29;
  v82 = a30;
  v81 = a31;
  v80 = a34;
  v79 = a35;
  v78 = a38;
  v55 = a39;
  v56 = a40;
  v57 = a41;
  v86.receiver = a1;
  v86.super_class = (Class)HKGraphViewRenderer;
  v58 = (id *)objc_msgSendSuper2(&v86, sel_init);
  v59 = v58;
  if (v58)
  {
    objc_storeStrong(v58 + 6, a11);
    objc_storeStrong(v59 + 7, v71);
    *((double *)v59 + 28) = a2;
    *((double *)v59 + 29) = a3;
    *((double *)v59 + 30) = a4;
    *((double *)v59 + 31) = a5;
    *((double *)v59 + 32) = a6;
    *((double *)v59 + 33) = a7;
    *((double *)v59 + 34) = a8;
    *((double *)v59 + 35) = a9;
    v59[36] = a17;
    v59[37] = a18;
    v59[38] = a19;
    v59[39] = a20;
    v59[8] = a21;
    v59[9] = a22;
    v59[26] = a23;
    v59[27] = a24;
    v59[10] = a13;
    v59[11] = a14;
    *((_BYTE *)v59 + 8) = a15;
    v59[12] = a16;
    *((_BYTE *)v59 + 9) = a25;
    *((_BYTE *)v59 + 10) = a26;
    objc_storeStrong(v59 + 13, a27);
    v60 = *a28;
    v61 = a28[2];
    *((_OWORD *)v59 + 23) = a28[1];
    *((_OWORD *)v59 + 24) = v61;
    *((_OWORD *)v59 + 22) = v60;
    objc_storeStrong(v59 + 14, a29);
    objc_storeStrong(v59 + 15, a30);
    objc_storeStrong(v59 + 16, a31);
    v59[17] = a32;
    v59[18] = a33;
    objc_storeStrong(v59 + 19, a34);
    objc_storeStrong(v59 + 20, a35);
    *((_BYTE *)v59 + 11) = a36;
    v59[21] = a37;
    objc_storeStrong(v59 + 22, a38);
    v62 = objc_msgSend(v55, "copy");
    v63 = v59[24];
    v59[24] = (id)v62;

    v64 = objc_msgSend(v56, "copy");
    v65 = v59[23];
    v59[23] = (id)v64;

    v66 = objc_msgSend(v57, "copy");
    v67 = v59[25];
    v59[25] = (id)v66;

    v59[40] = a42;
    v59[41] = a43;
    v59[42] = a44;
    v59[43] = a45;
    *((_BYTE *)v59 + 12) = a46;
    v59[2] = 0;
    v59[3] = 0;
    v68 = v59[4];
    v59[4] = 0;

  }
  return v59;
}

- (void)renderContentToContext:(CGContext *)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
  HKGraphSeriesSecondaryRenderContext *v18;

  UIGraphicsPushContext(a3);
  if (-[HKGraphViewRenderer drawingToTile](self, "drawingToTile"))
    -[HKGraphViewRenderer _clearBackgroundInContext:](self, "_clearBackgroundInContext:", a3);
  -[HKGraphViewRenderer _renderXAxisLabelAndGridsNeedsNewRendererInContext:](self, "_renderXAxisLabelAndGridsNeedsNewRendererInContext:", a3);
  if ((-[HKGraphViewRenderer postUpdates](self, "postUpdates") & 4) == 0)
  {
    v18 = objc_alloc_init(HKGraphSeriesSecondaryRenderContext);
    -[HKGraphViewRenderer renderingView](self, "renderingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphViewRenderer insetChartRect](self, "insetChartRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[HKGraphViewRenderer zoomScale](self, "zoomScale");
    v15 = v14;
    -[HKGraphViewRenderer contentOffset](self, "contentOffset");
    -[HKGraphViewRenderer _renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:](self, "_renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:", a3, v5, 0, v7, v9, v11, v13, v15, v16, v17);

    -[HKGraphViewRenderer insetChartRect](self, "insetChartRect");
    -[HKGraphViewRenderer _renderSeriesWithContext:secondaryRenderContext:chartRect:](self, "_renderSeriesWithContext:secondaryRenderContext:chartRect:", a3, v18);
    -[HKGraphViewRenderer _renderVirtualMarginsWithContext:](self, "_renderVirtualMarginsWithContext:", a3);
    -[HKGraphViewRenderer insetChartRect](self, "insetChartRect");
    -[HKGraphViewRenderer _renderBaselineWithContext:chartRect:](self, "_renderBaselineWithContext:chartRect:", a3);
    -[HKGraphViewRenderer _renderDataAreaDividersWithContext:](self, "_renderDataAreaDividersWithContext:", a3);
    UIGraphicsPopContext();

  }
}

- (void)_clearBackgroundInContext:(CGContext *)a3
{
  id v5;
  CGColor *v6;
  CGRect v7;

  -[HKGraphViewRenderer tileBackgroundColor](self, "tileBackgroundColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  CGContextSetFillColorWithColor(a3, v6);
  -[HKGraphViewRenderer fullChartRect](self, "fullChartRect");
  CGContextFillRect(a3, v7);
}

- (void)_renderXAxisLabelAndGridsNeedsNewRendererInContext:(CGContext *)a3
{
  double v5;
  double v6;
  double v7;

  -[HKGraphViewRenderer _renderXAxisGridlinesInContext:withBlendMode:](self, "_renderXAxisGridlinesInContext:withBlendMode:", a3, 0);
  if (!-[HKGraphViewRenderer disableXAxis](self, "disableXAxis"))
  {
    -[HKGraphViewRenderer _renderXAxisLabelsInContext:](self, "_renderXAxisLabelsInContext:", a3);
    v6 = v5;
    -[HKGraphViewRenderer currentXAxisHeight](self, "currentXAxisHeight");
    if (!HKUIEqualCGFloats(v6, v7) && !-[HKGraphViewRenderer drawingToTile](self, "drawingToTile"))
    {
      self->_postUpdates |= 4uLL;
      self->_postXAxisHeight = v6;
    }
  }
}

- (void)_renderXAxisGridlinesInContext:(CGContext *)a3 withBlendMode:(int)a4
{
  uint64_t v4;
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
  HKAxis *xAxis;
  void *v25;
  void *v26;
  id v27;

  v4 = *(_QWORD *)&a4;
  -[HKGraphViewRenderer zoomScale](self, "zoomScale", a3);
  v7 = v6;
  -[HKGraphViewRenderer contentOffset](self, "contentOffset");
  v9 = v8;
  v11 = v10;
  -[HKGraphViewRenderer insetDataArea](self, "insetDataArea");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[HKGraphViewRenderer topBaselineY](self, "topBaselineY");
  v21 = v19 - (v20 - v15);
  if (v20 > 0.00000011920929)
    v22 = v20;
  else
    v22 = v15 + 4.0;
  if (v20 > 0.00000011920929)
    v23 = v21;
  else
    v23 = v19 + -4.0;
  if (v20 <= 0.00000011920929)
    v13 = v13 + 0.0;
  xAxis = self->_xAxis;
  -[HKGraphViewRenderer effectiveVisibleRangeCadence](self, "effectiveVisibleRangeCadence");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewRenderer gridlineRanges](self, "gridlineRanges");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewRenderer renderingView](self, "renderingView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxis drawGridlinesForModelRange:chartRect:gridlineRanges:zoomScale:contentOffset:renderView:blendMode:](xAxis, "drawGridlinesForModelRange:chartRect:gridlineRanges:zoomScale:contentOffset:renderView:blendMode:", v27, v25, v26, v4, v13, v22, v17, v23, v7, v9, v11);

}

- (double)_renderXAxisLabelsInContext:(CGContext *)a3
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
  uint64_t v14;
  double MinY;
  double Height;
  HKAxis *xAxis;
  HKValueRange *effectiveVisibleRangeCadence;
  void *v19;
  uint64_t v21;
  double v22;
  CGRect v23;
  CGRect v24;

  -[HKGraphViewRenderer zoomScale](self, "zoomScale", a3);
  v5 = v4;
  -[HKGraphViewRenderer contentOffset](self, "contentOffset");
  v7 = v6;
  v9 = v8;
  -[HKGraphViewRenderer insetDataArea](self, "insetDataArea");
  v11 = v10;
  v13 = v12;
  v14 = -[HKGraphViewRenderer drawingToTile](self, "drawingToTile") ^ 1;
  v22 = 16.0;
  -[HKGraphViewRenderer scrollingAreaRect](self, "scrollingAreaRect", 0);
  MinY = CGRectGetMinY(v23);
  -[HKGraphViewRenderer scrollingAreaRect](self, "scrollingAreaRect");
  Height = CGRectGetHeight(v24);
  xAxis = self->_xAxis;
  effectiveVisibleRangeCadence = self->_effectiveVisibleRangeCadence;
  -[HKGraphViewRenderer renderingView](self, "renderingView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxis drawLabelsWithModelRange:chartRect:zoomScale:contentOffset:renderView:maximumLabelSize:omitOffscreenLabels:](xAxis, "drawLabelsWithModelRange:chartRect:zoomScale:contentOffset:renderView:maximumLabelSize:omitOffscreenLabels:", effectiveVisibleRangeCadence, v19, &v21, v14, v11, MinY, v13, Height, v5, v7, v9);

  return HKUICeilToScreenScale(v22);
}

- (void)_renderYAxisGridlinesInContext:(CGContext *)a3 renderingView:(id)a4 chartRect:(CGRect)a5 withBlendMode:(int)a6 zoomScale:(double)a7 contentOffset:(CGPoint)a8
{
  double y;
  double x;
  uint64_t v11;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  y = a8.y;
  x = a8.x;
  v11 = *(_QWORD *)&a6;
  v37 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HKGraphViewRenderer seriesConfiguration](self, "seriesConfiguration", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "seriesRows");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v20, "mainSeriesForRow");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "yAxisRect");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        objc_msgSend(v21, "visibleValueRange");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "yAxis");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "drawGridlinesForModelRange:chartRect:gridlineRanges:zoomScale:contentOffset:renderView:blendMode:", v30, 0, v13, v11, v23, v25, v27, v29, a7, x, y);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v17);
  }

}

- (void)_renderSeriesWithContext:(CGContext *)a3 secondaryRenderContext:(id)a4 chartRect:(CGRect)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  HKGraphSeriesOverlayData *v47;
  HKGraphSeriesOverlayData *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSMutableArray *postOverlayData;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id obj;
  id obja;
  void *v60;
  id v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
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
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v61 = a4;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", -[HKGraphViewRenderer xAxisDateZoom](self, "xAxisDateZoom"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  -[HKGraphViewRenderer seriesConfiguration](self, "seriesConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "seriesRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v85 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        objc_msgSend(v13, "selectedSeriesForRow");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "drawSelectionLineBehindAllSeries"))
        {
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          objc_msgSend(v13, "overlaidSeries");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v81;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v81 != v18)
                  objc_enumerationMutation(v15);
                if (!((*(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j) != (_QWORD)v14) | v10 & 1))
                {
                  -[HKGraphViewRenderer _renderSelectionLineWithContext:](self, "_renderSelectionLineWithContext:", a3);
                  v10 = 1;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
            }
            while (v17);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[HKGraphViewRenderer seriesConfiguration](self, "seriesConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "seriesRows");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v21;
  v55 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
  v22 = 0;
  if (v55)
  {
    v54 = *(_QWORD *)v77;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v77 != v54)
          objc_enumerationMutation(v53);
        v24 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v23);
        objc_msgSend(v24, "selectedSeriesForRow");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "yAxisRect");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        objc_msgSend(v24, "axisAnnotationHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "startAnnotationSequence");

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v56 = v24;
        objc_msgSend(v24, "overlaidSeries");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
        v57 = v23;
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v73;
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v73 != v37)
                objc_enumerationMutation(obja);
              v39 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
              if (!((v39 != v25) | v10 & 1))
              {
                -[HKGraphViewRenderer _renderSelectionLineWithContext:](self, "_renderSelectionLineWithContext:", a3);
                v10 = 1;
              }
              v40 = objc_msgSend(v39, "resolutionForTimeScope:traitResolution:", -[HKGraphViewRenderer xAxisDateZoom](self, "xAxisDateZoom"), -[HKGraphViewRenderer traitResolution](self, "traitResolution"));
              -[HKGraphViewRenderer xAxis](self, "xAxis");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKGraphViewRenderer zoomScale](self, "zoomScale");
              v43 = v42;
              -[HKGraphViewRenderer contentOffset](self, "contentOffset");
              objc_msgSend(v39, "seriesCoordinatesWithXAxis:chartRect:zoomScale:contentOffset:resolution:", v41, v40, v27, v29, v31, v33, v43, v44, v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              v70 = 0u;
              v71 = 0u;
              v69 = 0u;
              -[HKGraphViewRenderer xAxisCoordinateTransform](self, "xAxisCoordinateTransform");
              v67 = 0u;
              v68 = 0u;
              v66 = 0u;
              if (v39)
              {
                v63 = v69;
                v64 = v70;
                v65 = v71;
                objc_msgSend(v39, "coordinateTransformFromXAxisTransform:chartRect:", &v63, v27, v29, v31, v33);
              }
              v63 = v66;
              v64 = v67;
              v65 = v68;
              objc_msgSend(v39, "drawWithChartRect:seriesCoordinates:zoomLevelConfiguration:coordinateTransform:inContext:secondaryRenderContext:seriesRenderingDelegate:", v46, v60, &v63, a3, v61, self, v27, v29, v31, v33);
              if (objc_msgSend(v39, "overlayType"))
              {
                if (!v22)
                  v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v47 = [HKGraphSeriesOverlayData alloc];
                v63 = v66;
                v64 = v67;
                v65 = v68;
                v48 = -[HKGraphSeriesOverlayData initWithGraphSeries:graphSeriesScreenRect:graphSeriesCoordinates:graphSeriesPointTransform:](v47, "initWithGraphSeries:graphSeriesScreenRect:graphSeriesCoordinates:graphSeriesPointTransform:", v39, v46, &v63, v27, v29, v31, v33);
                -[NSMutableArray addObject:](v22, "addObject:", v48);

              }
            }
            v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
          }
          while (v36);
        }

        objc_msgSend(v56, "axisAnnotationHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "overlaidSeries");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "applyAnnotationForSeries:", v50);

        if ((unint64_t)(v51 - 1) <= 1)
          self->_postUpdates |= v51;

        v23 = v57 + 1;
      }
      while (v57 + 1 != v55);
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    }
    while (v55);
  }

  if ((v10 & 1) == 0)
    -[HKGraphViewRenderer _renderSelectionLineWithContext:](self, "_renderSelectionLineWithContext:", a3);
  postOverlayData = self->_postOverlayData;
  self->_postOverlayData = v22;

}

- (void)_renderVirtualMarginsWithContext:(CGContext *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  id v31;

  -[HKGraphViewRenderer insetDataArea](self, "insetDataArea");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[HKGraphViewRenderer virtualMargins](self, "virtualMargins");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "virtualLeftMarginWidth");
  if (v14 > 0.0)
  {
    -[HKGraphViewRenderer virtualMargins](self, "virtualMargins");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "virtualLeftMarginStyle");

    if (!v16)
      goto LABEL_5;
    -[HKGraphViewRenderer insetDataArea](self, "insetDataArea");
    v18 = v17;
    -[HKGraphViewRenderer insetDataArea](self, "insetDataArea");
    v20 = v19;
    -[HKGraphViewRenderer virtualMargins](self, "virtualMargins");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "virtualLeftMarginWidth");
    v23 = v22 - HKUIOnePixel();

    -[HKGraphViewRenderer virtualMargins](self, "virtualMargins");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphViewRenderer _renderVirtualMarginInRect:context:marginStyle:](self, "_renderVirtualMarginInRect:context:marginStyle:", a3, objc_msgSend(v13, "virtualLeftMarginStyle"), v18, v20, v23, v12);
  }

LABEL_5:
  -[HKGraphViewRenderer virtualMargins](self, "virtualMargins");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "virtualRightMarginWidth");
  v26 = v25;
  -[HKGraphViewRenderer rightHandInactiveArea](self, "rightHandInactiveArea");
  v28 = v26 + v27;

  if (v28 > 0.0)
  {
    -[HKGraphViewRenderer virtualMargins](self, "virtualMargins");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "virtualRightMarginStyle");

    if (v30)
    {
      -[HKGraphViewRenderer virtualMargins](self, "virtualMargins");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      -[HKGraphViewRenderer _renderVirtualMarginInRect:context:marginStyle:](self, "_renderVirtualMarginInRect:context:marginStyle:", a3, objc_msgSend(v31, "virtualRightMarginStyle"), v6 + v10 - v28, v8, v28, v12);

    }
  }
}

- (void)_renderBaselineWithContext:(CGContext *)a3 chartRect:(CGRect)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
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
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[HKGraphViewRenderer zoomScale](self, "zoomScale", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = v5;
  -[HKGraphViewRenderer contentOffset](self, "contentOffset");
  v8 = v7;
  v10 = v9;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HKGraphViewRenderer seriesConfiguration](self, "seriesConfiguration", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "seriesRows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v17, "mainSeriesForRow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "yAxisRect");
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        objc_msgSend(v18, "visibleValueRange");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v18, "yAxis");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKGraphViewRenderer renderingView](self, "renderingView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "drawBaselineForModelRange:chartRect:zoomScale:contentOffset:renderView:", v27, v29, v20, v22, v24, v26, v6, v8, v10);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v14);
  }

}

- (void)_renderDataAreaDividersWithContext:(CGContext *)a3
{
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
  void *v15;

  CGContextSaveGState(a3);
  -[HKGraphViewRenderer insetDataArea](self, "insetDataArea");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[HKGraphViewRenderer topBaselineY](self, "topBaselineY");
  if (v13 <= 0.00000011920929)
  {
    v14 = HKUIOnePixel();
    -[HKGraphViewRenderer outlineColor](self, "outlineColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBorderLineView drawBorderLinesInContext:bounds:verticalDrawRanges:borderEdges:borderLineWidth:borderLineColor:borderInsets:](HKBorderLineView, "drawBorderLinesInContext:bounds:verticalDrawRanges:borderEdges:borderLineWidth:borderLineColor:borderInsets:", a3, 0, 1, v15, v6, v8, v10, v12, v14, 0x4010000000000000, 0, 0, 0);

  }
  CGContextRestoreGState(a3);
}

- (void)_renderSelectionLineWithContext:(CGContext *)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void (**v14)(void *, void *, double);
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableArray *postSelectionPoints;
  uint64_t v31;
  NSMutableArray *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD aBlock[8];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!-[HKGraphViewRenderer drawingToTile](self, "drawingToTile", a3))
  {
    -[HKGraphViewRenderer insetDataArea](self, "insetDataArea");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[HKGraphViewRenderer bottomBaselineY](self, "bottomBaselineY");
    v13 = v12 - v7;
    aBlock[0] = MEMORY[0x1E0C809B0];
    if (v12 <= v7)
      v13 = v11;
    aBlock[1] = 3221225472;
    aBlock[2] = __55__HKGraphViewRenderer__renderSelectionLineWithContext___block_invoke;
    aBlock[3] = &__block_descriptor_64_e40___UIBezierPath_24__0d8__HKStrokeStyle_16l;
    aBlock[4] = v5;
    *(double *)&aBlock[5] = v7;
    aBlock[6] = v9;
    *(double *)&aBlock[7] = v13;
    v14 = (void (**)(void *, void *, double))_Block_copy(aBlock);
    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[HKGraphViewRenderer seriesConfiguration](self, "seriesConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "seriesRows");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v16;
    v35 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v35)
    {
      v34 = *(_QWORD *)v38;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v38 != v34)
            objc_enumerationMutation(obj);
          v36 = v17;
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
          objc_msgSend(v18, "selectedRangeBoundariesXValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            if (objc_msgSend(v19, "count"))
            {
              -[NSMutableArray addObjectsFromArray:](v32, "addObjectsFromArray:", v20);
              if (objc_msgSend(v18, "selectedTouchPointCount") >= 1)
              {
                v21 = 0;
                do
                {
                  objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "doubleValue");
                  v24 = HKUIFloorToScreenScale(v23);

                  -[HKGraphViewRenderer renderingView](self, "renderingView");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKGraphViewRenderer selectionLineStyle](self, "selectionLineStyle");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "selectedPointLineStrokeStyle");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v14[2](v14, v27, v24);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKGraphViewRenderer selectionLineColor](self, "selectionLineColor");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v31) = 1;
                  objc_msgSend(v25, "drawPath:strokeColor:fillColor:markerImage:useGradientFill:blendMode:clipToAxes:", v28, v29, 0, 0, 0, 0, v31);

                  ++v21;
                }
                while (v21 < objc_msgSend(v18, "selectedTouchPointCount"));
              }
            }
          }

          v17 = v36 + 1;
        }
        while (v36 + 1 != v35);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v35);
    }

    postSelectionPoints = self->_postSelectionPoints;
    self->_postSelectionPoints = v32;

  }
}

id __55__HKGraphViewRenderer__renderSelectionLineWithContext___block_invoke(CGRect *a1, void *a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "moveToPoint:", a3, CGRectGetMinY(a1[1]));
  objc_msgSend(v6, "addLineToPoint:", a3, CGRectGetMaxY(a1[1]));
  objc_msgSend(v5, "lineWidth");
  v8 = v7;

  objc_msgSend(v6, "setLineWidth:", v8);
  return v6;
}

- (void)_renderVirtualMarginInRect:(CGRect)a3 context:(CGContext *)a4 marginStyle:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMajorGridColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphViewRenderer renderingView](self, "renderingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    LOBYTE(v17) = 0;
    v14 = v18;
    v15 = v11;
    v16 = 18;
  }
  else
  {
    if (a5 != 1)
      return;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMajorGridColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphViewRenderer renderingView](self, "renderingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    LOBYTE(v17) = 0;
    v14 = v18;
    v15 = v11;
    v16 = 0;
  }
  objc_msgSend(v12, "drawPath:strokeColor:fillColor:markerImage:useGradientFill:blendMode:clipToAxes:", v14, 0, v15, 0, 0, v16, v17);

  -[HKGraphViewRenderer _renderVirtualMarginGridLines:context:](self, "_renderVirtualMarginGridLines:context:", a4, x, y, width, height);
}

- (void)_renderVirtualMarginGridLines:(CGRect)a3 context:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HKGraphViewRenderer insetDataArea](self, "insetDataArea");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  CGContextSaveGState(a4);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  CGContextAddRect(a4, v28);
  CGContextClip(a4);
  -[HKGraphViewRenderer renderingView](self, "renderingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewRenderer zoomScale](self, "zoomScale");
  v20 = v19;
  -[HKGraphViewRenderer contentOffset](self, "contentOffset");
  -[HKGraphViewRenderer _renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:](self, "_renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:", a4, v18, 17, v11, v13, v15, v17, v20, v21, v22);

  -[HKGraphViewRenderer renderingView](self, "renderingView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewRenderer zoomScale](self, "zoomScale");
  v25 = v24;
  -[HKGraphViewRenderer contentOffset](self, "contentOffset");
  -[HKGraphViewRenderer _renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:](self, "_renderYAxisGridlinesInContext:renderingView:chartRect:withBlendMode:zoomScale:contentOffset:", a4, v23, 17, v11, v13, v15, v17, v25, v26, v27);

  -[HKGraphViewRenderer _renderXAxisGridlinesInContext:withBlendMode:](self, "_renderXAxisGridlinesInContext:withBlendMode:", a4, 17);
  CGContextRestoreGState(a4);
}

- (UIEdgeInsets)virtualMarginInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[HKGraphViewRenderer virtualMargins](self, "virtualMargins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "virtualLeftMarginWidth");
  v5 = v4;
  -[HKGraphViewRenderer virtualMargins](self, "virtualMargins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "virtualRightMarginWidth");
  v8 = v7;
  -[HKGraphViewRenderer rightHandInactiveArea](self, "rightHandInactiveArea");
  v10 = v8 + v9;

  v11 = 0.0;
  v12 = 0.0;
  v13 = v5;
  v14 = v10;
  result.right = v14;
  result.bottom = v12;
  result.left = v13;
  result.top = v11;
  return result;
}

- (CGRect)screenRectForSeries:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;
  CGRect result;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HKGraphViewRenderer seriesConfiguration](self, "seriesConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "seriesRows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v15, "overlaidSeries", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v16);
              if (*(id *)(*((_QWORD *)&v29 + 1) + 8 * j) == v4)
              {
                objc_msgSend(v15, "yAxisRect");
                v5 = v21;
                v6 = v22;
                v7 = v23;
                v8 = v24;

                goto LABEL_18;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v18)
              continue;
            break;
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
  }
LABEL_18:

  v25 = v5;
  v26 = v6;
  v27 = v7;
  v28 = v8;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)axisAnnotationDelegateForSeries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HKGraphViewRenderer seriesConfiguration](self, "seriesConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seriesRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v11, "overlaidSeries", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              if (*(id *)(*((_QWORD *)&v19 + 1) + 8 * j) == v4)
              {
                objc_msgSend(v11, "axisAnnotationHandler");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 0;
    }
    while (v8);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)seriesDrawingAsTopOverlay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HKGraphViewRenderer seriesConfiguration](self, "seriesConfiguration", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seriesRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (-[HKGraphViewRenderer _lastSeriesInMultiSeriesRow:series:](self, "_lastSeriesInMultiSeriesRow:series:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), v4))
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)_lastSeriesInMultiSeriesRow:(id)a3 series:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "overlaidSeries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "overlaidSeries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9 == v6;

  }
  return v10;
}

- (int64_t)postUpdates
{
  return self->_postUpdates;
}

- (double)postXAxisHeight
{
  return self->_postXAxisHeight;
}

- (NSMutableArray)postOverlayData
{
  return self->_postOverlayData;
}

- (NSMutableArray)postSelectionPoints
{
  return self->_postSelectionPoints;
}

- (HKGraphViewRendererSeriesConfiguration)seriesConfiguration
{
  return self->_seriesConfiguration;
}

- (HKGraphRenderer)renderingView
{
  return self->_renderingView;
}

- (CGRect)fullChartRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fullChartRect.origin.x;
  y = self->_fullChartRect.origin.y;
  width = self->_fullChartRect.size.width;
  height = self->_fullChartRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)insetChartRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_insetChartRect.origin.x;
  y = self->_insetChartRect.origin.y;
  width = self->_insetChartRect.size.width;
  height = self->_insetChartRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)insetDataArea
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_insetDataArea.origin.x;
  y = self->_insetDataArea.origin.y;
  width = self->_insetDataArea.size.width;
  height = self->_insetDataArea.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)rightHandInactiveArea
{
  return self->_rightHandInactiveArea;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (int64_t)traitResolution
{
  return self->_traitResolution;
}

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)xAxisDateZoom
{
  return self->_xAxisDateZoom;
}

- (BOOL)drawingToTile
{
  return self->_drawingToTile;
}

- (int64_t)tileColumn
{
  return self->_tileColumn;
}

- (BOOL)drawingDuringScrolling
{
  return self->_drawingDuringScrolling;
}

- (BOOL)drawingDuringAutoscale
{
  return self->_drawingDuringAutoscale;
}

- (HKAxis)xAxis
{
  return self->_xAxis;
}

- (CGAffineTransform)xAxisCoordinateTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].a;
  return self;
}

- (HKGraphViewRendererVirtualMarginConfiguration)virtualMargins
{
  return self->_virtualMargins;
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (UIColor)tileBackgroundColor
{
  return self->_tileBackgroundColor;
}

- (double)topBaselineY
{
  return self->_topBaselineY;
}

- (double)bottomBaselineY
{
  return self->_bottomBaselineY;
}

- (UIColor)selectionLineColor
{
  return self->_selectionLineColor;
}

- (HKGraphViewSelectionStyle)selectionLineStyle
{
  return self->_selectionLineStyle;
}

- (BOOL)disableXAxis
{
  return self->_disableXAxis;
}

- (double)currentXAxisHeight
{
  return self->_currentXAxisHeight;
}

- (NSArray)gridlineRanges
{
  return self->_gridlineRanges;
}

- (HKValueRange)effectiveVisibleRangeActive
{
  return self->_effectiveVisibleRangeActive;
}

- (HKValueRange)effectiveVisibleRangeCadence
{
  return self->_effectiveVisibleRangeCadence;
}

- (HKValueRange)actualVisibleRange
{
  return self->_actualVisibleRange;
}

- (CGRect)scrollingAreaRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollingAreaRect.origin.x;
  y = self->_scrollingAreaRect.origin.y;
  width = self->_scrollingAreaRect.size.width;
  height = self->_scrollingAreaRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)chartMeasuringStartupTime
{
  return self->_chartMeasuringStartupTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualVisibleRange, 0);
  objc_storeStrong((id *)&self->_effectiveVisibleRangeCadence, 0);
  objc_storeStrong((id *)&self->_effectiveVisibleRangeActive, 0);
  objc_storeStrong((id *)&self->_gridlineRanges, 0);
  objc_storeStrong((id *)&self->_selectionLineStyle, 0);
  objc_storeStrong((id *)&self->_selectionLineColor, 0);
  objc_storeStrong((id *)&self->_tileBackgroundColor, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
  objc_storeStrong((id *)&self->_virtualMargins, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_storeStrong((id *)&self->_renderingView, 0);
  objc_storeStrong((id *)&self->_seriesConfiguration, 0);
  objc_storeStrong((id *)&self->_postSelectionPoints, 0);
  objc_storeStrong((id *)&self->_postOverlayData, 0);
}

@end
