@implementation _HKAudioVisibleRangeOverlaySeries

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
  id v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  void *v21;
  _OWORD v22[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3;
  v17 = a9;
  objc_msgSend(v17, "axisAnnotationDelegateForSeries:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "seriesDrawingDuringScrolling") & 1) != 0
    || (objc_msgSend(v17, "seriesDrawingDuringTiling") & 1) != 0
    || objc_msgSend(v17, "seriesDrawingDuringAutoscale"))
  {
    objc_msgSend(v18, "clearAxisAnnotations");
  }
  else
  {
    objc_msgSend(v16, "coordinates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_OWORD *)&a6->c;
    v22[0] = *(_OWORD *)&a6->a;
    v22[1] = v20;
    v22[2] = *(_OWORD *)&a6->tx;
    -[_HKAudioVisibleRangeOverlaySeries _leqDataFromBlockCoordinates:pointTransform:screenRect:](self, "_leqDataFromBlockCoordinates:pointTransform:screenRect:", v19, v22, x, y, width, height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "averageLEQ");
      -[HKLineSeries addAxisAnnotationForValue:axisAnnotationDelegate:](self, "addAxisAnnotationForValue:axisAnnotationDelegate:", v18);
    }

  }
}

- (void)drawOverlayInContext:(CGContext *)a3 seriesOverlayData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v6 = a4;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "graphSeriesCoordinates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v7, "graphSeriesPointTransform");
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
    }
    objc_msgSend(v7, "graphSeriesScreenRect");
    -[_HKAudioVisibleRangeOverlaySeries _leqDataFromBlockCoordinates:pointTransform:screenRect:](self, "_leqDataFromBlockCoordinates:pointTransform:screenRect:", v9, &v32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "graphSeries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && v10)
    {
      objc_msgSend(v10, "averageLEQ");
      v14 = v13;
      if (v7)
      {
        objc_msgSend(v7, "graphSeriesPointTransform");
        v15 = *((double *)&v29 + 1);
        v16 = *((double *)&v30 + 1);
        v17 = *((double *)&v31 + 1);
      }
      else
      {
        v30 = 0u;
        v31 = 0u;
        v29 = 0u;
        v17 = 0.0;
        v16 = 0.0;
        v15 = 0.0;
      }
      v18 = v17 + v14 * v16 + v15 * 0.0;
      objc_msgSend(v7, "graphSeriesScreenRect", v29, v30, v31, v32, v33, v34);
      v20 = v18 + v19;
      objc_msgSend(v7, "graphSeries");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "unhighlightedPresentationStyles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "strokeStyle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "applyToContext:", a3);
      objc_msgSend(v7, "graphSeriesScreenRect");
      CGContextMoveToPoint(a3, v25, v20);
      objc_msgSend(v7, "graphSeriesScreenRect");
      v27 = v26;
      objc_msgSend(v7, "graphSeriesScreenRect");
      CGContextAddLineToPoint(a3, v27 + v28, v20);
      CGContextStrokePath(a3);

    }
  }

}

- (id)_leqDataFromBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 screenRect:(CGRect)a5
{
  double width;
  double x;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  void *v20;
  char isKindOfClass;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  HKInteractiveChartAudioData *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  width = a5.size.width;
  x = a5.origin.x;
  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v47;
    v13 = x + width;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v16, "startXValue", v40);
        v18 = a4->tx + a4->c * 0.0 + a4->a * v17;
        if (v18 >= x && v18 <= v13)
        {
          objc_msgSend(v16, "userInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v16, "userInfo");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v22);
            v23 = objc_alloc(MEMORY[0x1E0CB6300]);
            objc_msgSend(v22, "averageLEQ");
            v25 = v24;
            objc_msgSend(v22, "duration");
            v27 = (void *)objc_msgSend(v23, "initWithValue:duration:", v25, v26);
            objc_msgSend(v41, "addObject:", v27);
            objc_msgSend(v22, "duration");
            v14 = v14 + v28;

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v11);
  }
  else
  {
    v14 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB62F8], "computeLEQFromAudioExposureValues:", v41);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "decibelAWeightedSoundPressureLevelUnit");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValueForUnit:", v30);
    v32 = v31;
    v33 = objc_alloc_init(HKInteractiveChartAudioData);
    -[HKInteractiveChartAudioData setAverageLEQ:](v33, "setAverageLEQ:", v32);
    -[HKInteractiveChartAudioData setDuration:](v33, "setDuration:", v14);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = v40;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "setOverviewData:", v33, v40);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v36);
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return a3 == 5 && a4 == 1;
}

@end
