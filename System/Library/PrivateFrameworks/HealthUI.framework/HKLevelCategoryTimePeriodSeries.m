@implementation HKLevelCategoryTimePeriodSeries

- (HKLevelCategoryTimePeriodSeries)init
{
  HKLevelCategoryTimePeriodSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  uint64_t v5;
  UIColor *innerMarkColorStorage;
  UIFont *categoryLevelFontStorage;
  UIColor *categoryLevelColorStorage;
  UIColor *specialMarkColorStorage;
  NSString *specialMarkLegendLabelStorage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKLevelCategoryTimePeriodSeries;
  v2 = -[HKHorizontalTimePeriodSeries init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKLevelCategoryTimePeriodSeriesLock"));
    v2->_markerRadiusStorage = 4.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
    innerMarkColorStorage = v2->_innerMarkColorStorage;
    v2->_innerMarkColorStorage = (UIColor *)v5;

    categoryLevelFontStorage = v2->_categoryLevelFontStorage;
    v2->_categoryLevelFontStorage = 0;

    categoryLevelColorStorage = v2->_categoryLevelColorStorage;
    v2->_categoryLevelColorStorage = 0;

    specialMarkColorStorage = v2->_specialMarkColorStorage;
    v2->_specialMarkColorStorage = 0;

    specialMarkLegendLabelStorage = v2->_specialMarkLegendLabelStorage;
    v2->_specialMarkLegendLabelStorage = 0;

    v2->_drawSampleSpansStorage = 0;
    v2->_roundDaySamplesStorage = 0;
  }
  return v2;
}

- (double)markerRadius
{
  void *v3;
  double markerRadiusStorage;
  void *v5;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  markerRadiusStorage = self->_markerRadiusStorage;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return markerRadiusStorage;
}

- (void)setMarkerRadius:(double)a3
{
  void *v5;
  id v6;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_markerRadiusStorage = a3;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (UIColor)innerMarkColor
{
  void *v3;
  UIColor *v4;
  void *v5;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_innerMarkColorStorage;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setInnerMarkColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *innerMarkColorStorage;
  id v7;

  v4 = (UIColor *)a3;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  innerMarkColorStorage = self->_innerMarkColorStorage;
  self->_innerMarkColorStorage = v4;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (UIFont)categoryLevelFont
{
  void *v3;
  UIFont *v4;
  void *v5;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_categoryLevelFontStorage;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setCategoryLevelFont:(id)a3
{
  UIFont *v4;
  void *v5;
  UIFont *categoryLevelFontStorage;
  id v7;

  v4 = (UIFont *)a3;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  categoryLevelFontStorage = self->_categoryLevelFontStorage;
  self->_categoryLevelFontStorage = v4;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (UIColor)categoryLevelColor
{
  void *v3;
  UIColor *v4;
  void *v5;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_categoryLevelColorStorage;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setCategoryLevelColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *categoryLevelColorStorage;
  id v7;

  v4 = (UIColor *)a3;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  categoryLevelColorStorage = self->_categoryLevelColorStorage;
  self->_categoryLevelColorStorage = v4;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (UIColor)specialMarkColor
{
  void *v3;
  UIColor *v4;
  void *v5;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_specialMarkColorStorage;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSpecialMarkColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *specialMarkColorStorage;
  id v7;

  v4 = (UIColor *)a3;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  specialMarkColorStorage = self->_specialMarkColorStorage;
  self->_specialMarkColorStorage = v4;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (NSString)specialMarkLegendLabel
{
  void *v3;
  NSString *v4;
  void *v5;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_specialMarkLegendLabelStorage;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSpecialMarkLegendLabel:(id)a3
{
  NSString *v4;
  void *v5;
  NSString *specialMarkLegendLabelStorage;
  id v7;

  v4 = (NSString *)a3;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  specialMarkLegendLabelStorage = self->_specialMarkLegendLabelStorage;
  self->_specialMarkLegendLabelStorage = v4;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (BOOL)drawSampleSpans
{
  void *v3;
  void *v4;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_drawSampleSpansStorage;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setDrawSampleSpans:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_drawSampleSpansStorage = a3;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (BOOL)roundDaySamples
{
  void *v3;
  void *v4;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_roundDaySamplesStorage;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setRoundDaySamples:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_roundDaySamplesStorage = a3;
  -[HKLevelCategoryTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (BOOL)_interiorCategoryLabels
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[HKHorizontalTimePeriodSeries valueLabels](self, "valueLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKLevelCategoryTimePeriodSeries categoryLevelFont](self, "categoryLevelFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HKLevelCategoryTimePeriodSeries categoryLevelColor](self, "categoryLevelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  if (-[HKLevelCategoryTimePeriodSeries _interiorCategoryLabels](self, "_interiorCategoryLabels"))
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HKLevelCategoryTimePeriodSeries;
    -[HKHorizontalTimePeriodSeries findAxisLabelsInModelRange:zoomScale:](&v9, sel_findAxisLabelsInModelRange_zoomScale_, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
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
  int64_t v24;
  _QWORD v25[4];
  id v26;
  HKLevelCategoryTimePeriodSeries *v27;
  id v28;
  id v29;
  __int128 v30;
  int64_t resolution;

  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "chartPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKLevelCategoryTimePeriodSeries.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__HKLevelCategoryTimePeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C40328;
  v26 = v14;
  v27 = self;
  v30 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  v28 = v15;
  v29 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
  v23 = *(_OWORD *)&a4->index;
  v24 = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v17, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __77__HKLevelCategoryTimePeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  HKStackedCategoryValueSeriesCoordinate *v21;
  void *v22;
  HKStackedCategoryValueSeriesCoordinate *v23;
  id v24;

  v24 = a2;
  objc_msgSend(v24, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v24, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateForValue:", v5);
    v7 = v6;

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v24, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinateForValue:", v9);
    v11 = v10;

    if (objc_msgSend(*(id *)(a1 + 40), "roundDaySamples"))
    {
      v12 = floor(v7);
      v13 = ceil(v11);
      if (*(_QWORD *)(a1 + 72) == 6)
      {
        v7 = v12;
        v11 = v13;
      }
    }
    v14 = *(void **)(a1 + 48);
    objc_msgSend(v24, "yValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinateForValue:", v15);
    v17 = v16;

    v18 = objc_msgSend(v24, "pointStyle");
    if (v18 == 2)
      v19 = 2;
    else
      v19 = v18 == 1;
    v20 = *(void **)(a1 + 56);
    v21 = [HKStackedCategoryValueSeriesCoordinate alloc];
    objc_msgSend(v24, "userInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HKStackedCategoryValueSeriesCoordinate initWithStart:end:pointStyle:userInfo:](v21, "initWithStart:end:pointStyle:userInfo:", v19, v22, v7, v17, v11, v17);
    objc_msgSend(v20, "addObject:", v23);

  }
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  char v19;
  __int128 v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  _QWORD v34[15];
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  v18 = a9;
  v19 = objc_msgSend(v18, "seriesDrawingDuringTiling");
  if (-[HKLevelCategoryTimePeriodSeries drawSampleSpans](self, "drawSampleSpans"))
  {
    v20 = *(_OWORD *)&a6->c;
    v36 = *(_OWORD *)&a6->a;
    v37 = v20;
    v38 = *(_OWORD *)&a6->tx;
    -[HKLevelCategoryTimePeriodSeries _coordinateForNow:pointTransform:](self, "_coordinateForNow:pointTransform:", v18, &v36);
    v22 = v21;
  }
  else
  {
    v22 = 0xFFEFFFFFFFFFFFFFLL;
  }
  CGContextSaveGState(a7);
  -[HKLevelCategoryTimePeriodSeries _drawCategoryLabels:axisRect:seriesRenderingDelegate:](self, "_drawCategoryLabels:axisRect:seriesRenderingDelegate:", a7, v18, x, y, width, height);
  -[HKHorizontalTimePeriodSeries fillColor](self, "fillColor");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = objc_msgSend(v23, "CGColor");

  -[HKLevelCategoryTimePeriodSeries innerMarkColor](self, "innerMarkColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    -[HKLevelCategoryTimePeriodSeries innerMarkColor](self, "innerMarkColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = objc_msgSend(v26, "CGColor");

  -[HKLevelCategoryTimePeriodSeries markerRadius](self, "markerRadius");
  v29 = v28;
  -[HKLevelCategoryTimePeriodSeries specialMarkColor](self, "specialMarkColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v24;
  if (v30)
  {
    -[HKLevelCategoryTimePeriodSeries specialMarkColor](self, "specialMarkColor");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = objc_msgSend(v32, "CGColor");

  }
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __174__HKLevelCategoryTimePeriodSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v34[3] = &unk_1E9C40350;
  v34[4] = self;
  *(double *)&v34[5] = x;
  *(double *)&v34[6] = y;
  *(double *)&v34[7] = width;
  *(double *)&v34[8] = height;
  v34[9] = v22;
  v34[10] = a7;
  v34[11] = v29;
  v35 = v19;
  v34[12] = v24;
  v34[13] = v27;
  v34[14] = v31;
  v33 = *(_OWORD *)&a6->c;
  v36 = *(_OWORD *)&a6->a;
  v37 = v33;
  v38 = *(_OWORD *)&a6->tx;
  objc_msgSend(v17, "enumerateCoordinatesWithTransform:roundToViewScale:block:", &v36, 1, v34);
  CGContextRestoreGState(a7);

}

void __174__HKLevelCategoryTimePeriodSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGColor *v14;
  CGContext *v15;
  CGContext *v16;
  double v17;
  CGFloat v18;
  int v19;
  id v20;

  v20 = a2;
  v6 = a4;
  objc_msgSend(v20, "start");
  v8 = v7;
  objc_msgSend(v20, "end");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "offsetForCoordinate:axisRect:", v6, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v12 = v11;

  if (objc_msgSend(*(id *)(a1 + 32), "drawSampleSpans"))
  {
    v13 = *(double *)(a1 + 72);
    v14 = *(CGColor **)(a1 + 96);
    if (v13 <= v8)
    {
      v16 = *(CGContext **)(a1 + 80);
      v17 = *(double *)(a1 + 88) + *(double *)(a1 + 88);
      v19 = *(unsigned __int8 *)(a1 + 120);
      v18 = v8;
      goto LABEL_7;
    }
    CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 80), v14);
    CGContextSetLineWidth(*(CGContextRef *)(a1 + 80), *(double *)(a1 + 88) + *(double *)(a1 + 88));
    CGContextSetLineCap(*(CGContextRef *)(a1 + 80), kCGLineCapButt);
    CGContextMoveToPoint(*(CGContextRef *)(a1 + 80), v8, v12);
    v15 = *(CGContext **)(a1 + 80);
    if (v13 >= v8 && v13 <= v10)
    {
      CGContextAddLineToPoint(v15, *(CGFloat *)(a1 + 72), v12);
      CGContextStrokePath(*(CGContextRef *)(a1 + 80));
      v16 = *(CGContext **)(a1 + 80);
      v17 = *(double *)(a1 + 88) + *(double *)(a1 + 88);
      v18 = *(double *)(a1 + 72);
      v14 = *(CGColor **)(a1 + 96);
      v19 = *(unsigned __int8 *)(a1 + 120);
LABEL_7:
      DrawDiagonalSlashPatternLine(v16, v14, v19, v17, v18, v12, v10, v12);
      goto LABEL_9;
    }
    CGContextAddLineToPoint(v15, v10, v12);
    CGContextStrokePath(*(CGContextRef *)(a1 + 80));
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "_drawMarkerWithContext:style:color:innerColor:specialColor:location:radius:", *(_QWORD *)(a1 + 80), objc_msgSend(v20, "pointStyle"), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v8, v12, *(double *)(a1 + 88));
  if (objc_msgSend(*(id *)(a1 + 32), "drawSampleSpans"))
    objc_msgSend(*(id *)(a1 + 32), "_drawMarkerWithContext:style:color:innerColor:specialColor:location:radius:", *(_QWORD *)(a1 + 80), objc_msgSend(v20, "pointStyle"), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v10, v12, *(double *)(a1 + 88));

}

- (void)_drawMarkerWithContext:(CGContext *)a3 style:(int64_t)a4 color:(CGColor *)a5 innerColor:(CGColor *)a6 specialColor:(CGColor *)a7 location:(CGPoint)a8 radius:(double)a9
{
  CGColor *v9;

  if (a4 == 2)
  {
    v9 = a7;
LABEL_5:
    +[HKGraphSeries drawFilledMarkerInContext:color:x:y:radius:](HKGraphSeries, "drawFilledMarkerInContext:color:x:y:radius:", a3, v9, a8.x, a8.y, a9);
    return;
  }
  if (a4 != 1)
  {
    if (a4)
      return;
    v9 = a5;
    goto LABEL_5;
  }
  +[HKGraphSeries drawInnerDotMarkerInContext:outColor:inColor:x:y:radius:](HKGraphSeries, "drawInnerDotMarkerInContext:outColor:inColor:x:y:radius:", a3, a5, a6, a8.x, a8.y, a9);
}

- (void)_drawCategoryLabels:(CGContext *)a3 axisRect:(CGRect)a4 seriesRenderingDelegate:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  CGColor *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[2];
  _QWORD v44[4];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v44[2] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (-[HKLevelCategoryTimePeriodSeries _interiorCategoryLabels](self, "_interiorCategoryLabels"))
  {
    v43[0] = *MEMORY[0x1E0DC1138];
    -[HKLevelCategoryTimePeriodSeries categoryLevelFont](self, "categoryLevelFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v12;
    v43[1] = *MEMORY[0x1E0DC1140];
    -[HKLevelCategoryTimePeriodSeries categoryLevelColor](self, "categoryLevelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v11;
    objc_msgSend(v11, "virtualMarginInsets");
    v16 = v15;
    -[HKLevelCategoryTimePeriodSeries categoryLevelColor](self, "categoryLevelColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (CGColor *)objc_msgSend(v17, "CGColor");

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[HKHorizontalTimePeriodSeries enumerationValueOrdering](self, "enumerationValueOrdering");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v39;
      v23 = v16 + 6.0;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v24);
          -[HKHorizontalTimePeriodSeries enumerationRectForLevel:axisRect:](self, "enumerationRectForLevel:axisRect:", v21 + v24, x, y, width, height);
          v27 = v26;
          v29 = v28;
          -[HKHorizontalTimePeriodSeries valueLabels](self, "valueLabels");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v25);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "sizeWithAttributes:", v14);
          objc_msgSend(v31, "drawInRect:withAttributes:", v14, v23, v27 + 3.0, v32, v33);
          v34 = v27 + v29 + 0.0;
          CGContextSetStrokeColorWithColor(a3, v18);
          v35 = HKUIOnePixel();
          CGContextSetLineWidth(a3, v35);
          CGContextMoveToPoint(a3, x, v34);
          CGContextAddLineToPoint(a3, x + width, v34);
          CGContextStrokePath(a3);

          ++v24;
        }
        while (v20 != v24);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        v21 += v24;
      }
      while (v20);
    }

    v11 = v36;
  }

}

- (double)_coordinateForNow:(id)a3 pointTransform:(CGAffineTransform *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a3;
  objc_msgSend(v5, "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "seriesDrawingXAxis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "transform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinateForValue:", v7);
  v11 = a4->tx + a4->c * 0.0 + a4->a * v10;

  return v11;
}

- (double)offsetForEnumerationRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double result;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[HKLevelCategoryTimePeriodSeries _interiorCategoryLabels](self, "_interiorCategoryLabels"))
    return y + (height + height) / 3.0;
  v9.receiver = self;
  v9.super_class = (Class)HKLevelCategoryTimePeriodSeries;
  -[HKHorizontalTimePeriodSeries offsetForEnumerationRect:](&v9, sel_offsetForEnumerationRect_, x, y, width, height);
  return result;
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[HKHorizontalTimePeriodSeries enumerationValueOrdering](self, "enumerationValueOrdering", a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CEAF28, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (double)markerRadiusStorage
{
  return self->_markerRadiusStorage;
}

- (void)setMarkerRadiusStorage:(double)a3
{
  self->_markerRadiusStorage = a3;
}

- (UIColor)innerMarkColorStorage
{
  return self->_innerMarkColorStorage;
}

- (void)setInnerMarkColorStorage:(id)a3
{
  objc_storeStrong((id *)&self->_innerMarkColorStorage, a3);
}

- (UIFont)categoryLevelFontStorage
{
  return self->_categoryLevelFontStorage;
}

- (void)setCategoryLevelFontStorage:(id)a3
{
  objc_storeStrong((id *)&self->_categoryLevelFontStorage, a3);
}

- (UIColor)categoryLevelColorStorage
{
  return self->_categoryLevelColorStorage;
}

- (void)setCategoryLevelColorStorage:(id)a3
{
  objc_storeStrong((id *)&self->_categoryLevelColorStorage, a3);
}

- (UIColor)specialMarkColorStorage
{
  return self->_specialMarkColorStorage;
}

- (void)setSpecialMarkColorStorage:(id)a3
{
  objc_storeStrong((id *)&self->_specialMarkColorStorage, a3);
}

- (NSString)specialMarkLegendLabelStorage
{
  return self->_specialMarkLegendLabelStorage;
}

- (void)setSpecialMarkLegendLabelStorage:(id)a3
{
  objc_storeStrong((id *)&self->_specialMarkLegendLabelStorage, a3);
}

- (BOOL)drawSampleSpansStorage
{
  return self->_drawSampleSpansStorage;
}

- (void)setDrawSampleSpansStorage:(BOOL)a3
{
  self->_drawSampleSpansStorage = a3;
}

- (BOOL)roundDaySamplesStorage
{
  return self->_roundDaySamplesStorage;
}

- (void)setRoundDaySamplesStorage:(BOOL)a3
{
  self->_roundDaySamplesStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialMarkLegendLabelStorage, 0);
  objc_storeStrong((id *)&self->_specialMarkColorStorage, 0);
  objc_storeStrong((id *)&self->_categoryLevelColorStorage, 0);
  objc_storeStrong((id *)&self->_categoryLevelFontStorage, 0);
  objc_storeStrong((id *)&self->_innerMarkColorStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
