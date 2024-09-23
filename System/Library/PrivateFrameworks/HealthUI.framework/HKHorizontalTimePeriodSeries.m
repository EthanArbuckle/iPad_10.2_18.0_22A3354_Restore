@implementation HKHorizontalTimePeriodSeries

- (HKHorizontalTimePeriodSeries)init
{
  HKHorizontalTimePeriodSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  NSArray *cachedAxisLabelsStorage;
  NSArray *v6;
  UIImage *selectedPointMarkerImageStorage;
  UIColor *fillColorStorage;
  NSArray *enumerationValueOrderingStorage;
  NSDictionary *valueLabelsStorage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKHorizontalTimePeriodSeries;
  v2 = -[HKGraphSeries init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKHorizontalTimePeriodSeriesLock"));
    cachedAxisLabelsStorage = v2->_cachedAxisLabelsStorage;
    v6 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_cachedAxisLabelsStorage = (NSArray *)MEMORY[0x1E0C9AA60];

    selectedPointMarkerImageStorage = v2->_selectedPointMarkerImageStorage;
    v2->_selectedPointMarkerImageStorage = 0;

    fillColorStorage = v2->_fillColorStorage;
    v2->_fillColorStorage = 0;

    v2->_lineWidthStorage = 1.0;
    enumerationValueOrderingStorage = v2->_enumerationValueOrderingStorage;
    v2->_enumerationValueOrderingStorage = v6;

    valueLabelsStorage = v2->_valueLabelsStorage;
    v2->_valueLabelsStorage = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v2;
}

- (id)cachedAxisLabels
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_cachedAxisLabelsStorage;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (UIImage)selectedPointMarkerImage
{
  void *v3;
  UIImage *v4;
  void *v5;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_selectedPointMarkerImageStorage;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSelectedPointMarkerImage:(id)a3
{
  UIImage *v4;
  void *v5;
  UIImage *selectedPointMarkerImageStorage;
  id v7;

  v4 = (UIImage *)a3;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  selectedPointMarkerImageStorage = self->_selectedPointMarkerImageStorage;
  self->_selectedPointMarkerImageStorage = v4;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (UIColor)fillColor
{
  void *v3;
  UIColor *v4;
  void *v5;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_fillColorStorage;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setFillColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *fillColorStorage;
  id v7;

  v4 = (UIColor *)a3;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  fillColorStorage = self->_fillColorStorage;
  self->_fillColorStorage = v4;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (double)lineWidth
{
  void *v3;
  double lineWidthStorage;
  void *v5;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  lineWidthStorage = self->_lineWidthStorage;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return lineWidthStorage;
}

- (void)setLineWidth:(double)a3
{
  void *v5;
  id v6;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_lineWidthStorage = a3;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (NSArray)enumerationValueOrdering
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_enumerationValueOrderingStorage;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setEnumerationValueOrdering:(id)a3
{
  NSArray *v4;
  void *v5;
  NSArray *enumerationValueOrderingStorage;
  NSArray *v7;
  NSArray *v8;
  NSArray *cachedAxisLabelsStorage;
  id v10;

  v4 = (NSArray *)a3;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  enumerationValueOrderingStorage = self->_enumerationValueOrderingStorage;
  self->_enumerationValueOrderingStorage = v4;
  v7 = v4;

  -[HKHorizontalTimePeriodSeries _generateAxisLabels](self, "_generateAxisLabels");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cachedAxisLabelsStorage = self->_cachedAxisLabelsStorage;
  self->_cachedAxisLabelsStorage = v8;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

}

- (NSDictionary)valueLabels
{
  void *v3;
  NSDictionary *v4;
  void *v5;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_valueLabelsStorage;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setValueLabels:(id)a3
{
  NSDictionary *v4;
  void *v5;
  NSDictionary *valueLabelsStorage;
  NSDictionary *v7;
  NSArray *v8;
  NSArray *cachedAxisLabelsStorage;
  id v10;

  v4 = (NSDictionary *)a3;
  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  valueLabelsStorage = self->_valueLabelsStorage;
  self->_valueLabelsStorage = v4;
  v7 = v4;

  -[HKHorizontalTimePeriodSeries _generateAxisLabels](self, "_generateAxisLabels");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cachedAxisLabelsStorage = self->_cachedAxisLabelsStorage;
  self->_cachedAxisLabelsStorage = v8;

  -[HKHorizontalTimePeriodSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  CGFloat v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  void *v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  id v37;
  CGImage *v38;
  void *v39;
  _OWORD v40[3];
  _QWORD v41[5];
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGContext *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  CGFloat *v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGRect v68;
  CGRect v69;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3;
  v20 = a5;
  v21 = a8;
  v22 = a9;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  -[HKGraphSeries closestXCoordinateRange](self, "closestXCoordinateRange");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minValue");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v23) = -[HKGraphSeries isHighlighted](self, "isHighlighted");
  v59 = 0;
  v60 = (CGFloat *)&v59;
  v61 = 0x3010000000;
  v62 = &unk_1D7BC951A;
  v63 = *MEMORY[0x1E0C9D538];
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  CGContextSaveGState(a7);
  -[HKHorizontalTimePeriodSeries lineWidth](self, "lineWidth");
  CGContextSetLineWidth(a7, v24);
  CGContextSetLineCap(a7, kCGLineCapRound);
  -[HKHorizontalTimePeriodSeries fillColor](self, "fillColor");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a7, (CGColorRef)objc_msgSend(v25, "CGColor"));

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __171__HKHorizontalTimePeriodSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v41[3] = &unk_1E9C469F0;
  v45 = x;
  v46 = y;
  v47 = width;
  v48 = height;
  v49 = a7;
  v54 = (char)v23;
  v50 = v64;
  v51 = v65;
  v52 = v66;
  v53 = v67;
  v26 = v19;
  v41[4] = self;
  v43 = &v55;
  v27 = v39;
  v42 = v27;
  v44 = &v59;
  v28 = *(_OWORD *)&a6->c;
  v40[0] = *(_OWORD *)&a6->a;
  v40[1] = v28;
  v40[2] = *(_OWORD *)&a6->tx;
  objc_msgSend(v26, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v40, 1, v41);
  if (*((_BYTE *)v56 + 24))
  {
    -[HKHorizontalTimePeriodSeries selectedPointMarkerImage](self, "selectedPointMarkerImage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = HKChartSeriesPointMarkerBaseRect(v29);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v37 = objc_retainAutorelease(v29);
    v38 = (CGImage *)objc_msgSend(v37, "CGImage");
    v68.origin.x = v30;
    v68.origin.y = v32;
    v68.size.width = v34;
    v68.size.height = v36;
    v69 = CGRectOffset(v68, v60[4], v60[5]);
    CGContextDrawImage(a7, v69, v38);

  }
  CGContextRestoreGState(a7);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

}

void __171__HKHorizontalTimePeriodSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  id v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  float v19;
  uint64_t v20;
  _OWORD v21[4];
  _OWORD v22[2];

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "start");
  v10 = v9;
  objc_msgSend(v8, "end");
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "offsetForCoordinate:axisRect:", v7, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v14 = v13;

  CGContextMoveToPoint(*(CGContextRef *)(a1 + 96), v10, v14);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 96), v12, v14);
  CGContextStrokePath(*(CGContextRef *)(a1 + 96));
  if (*(_BYTE *)(a1 + 168))
  {
    v15 = a3[1];
    v22[0] = *a3;
    v22[1] = v15;
    v16 = *(_OWORD *)(a1 + 120);
    v21[0] = *(_OWORD *)(a1 + 104);
    v21[1] = v16;
    v17 = *(_OWORD *)(a1 + 152);
    v21[2] = *(_OWORD *)(a1 + 136);
    v21[3] = v17;
    if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v22, (uint64_t *)v21))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v18 = *(void **)(a1 + 40);
      if (v18)
      {
        objc_msgSend(v18, "floatValue");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v19;
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      else
      {
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        *(CGFloat *)(v20 + 32) = v10;
      }
      *(CGFloat *)(v20 + 40) = v14;
    }
  }
}

- (int64_t)_enumeratedLevelForCoordinate:(id)a3
{
  double v3;

  objc_msgSend(a3, "start");
  return llround(v3);
}

- (CGRect)enumerationRectForLevel:(int64_t)a3 axisRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[HKHorizontalTimePeriodSeries valueLabels](self, "valueLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[HKHorizontalTimePeriodSeries valueLabels](self, "valueLabels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (double)(unint64_t)objc_msgSend(v11, "count");

  }
  else
  {
    v12 = 1.0;
  }

  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v13 = CGRectGetHeight(v17) / v12;
  v14 = y + (double)a3 * v13;
  v15 = x;
  v16 = width;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (double)offsetForEnumerationRect:(CGRect)a3
{
  return a3.origin.y + a3.size.height * 0.5;
}

- (double)offsetForCoordinate:(id)a3 axisRect:(CGRect)a4
{
  double result;

  -[HKHorizontalTimePeriodSeries enumerationRectForLevel:axisRect:](self, "enumerationRectForLevel:axisRect:", -[HKHorizontalTimePeriodSeries _enumeratedLevelForCoordinate:](self, "_enumeratedLevelForCoordinate:", a3), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[HKHorizontalTimePeriodSeries offsetForEnumerationRect:](self, "offsetForEnumerationRect:");
  return result;
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
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalTimePeriodSeries.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74__HKHorizontalTimePeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C46A18;
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

void __74__HKHorizontalTimePeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(_QWORD *a1, void *a2)
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  HKStackedCategoryValueSeriesCoordinate *v17;
  void *v18;
  HKStackedCategoryValueSeriesCoordinate *v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)a1[4];
    objc_msgSend(v20, "xStart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateForValue:", v5);
    v7 = v6;

    v8 = (void *)a1[4];
    objc_msgSend(v20, "xEnd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinateForValue:", v9);
    v11 = v10;

    v12 = (void *)a1[5];
    objc_msgSend(v20, "yValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateForValue:", v13);
    v15 = v14;

    v16 = (void *)a1[6];
    v17 = [HKStackedCategoryValueSeriesCoordinate alloc];
    objc_msgSend(v20, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HKStackedCategoryValueSeriesCoordinate initWithStart:end:pointStyle:userInfo:](v17, "initWithStart:end:pointStyle:userInfo:", 0, v18, v7, v15, v11, v15);
    objc_msgSend(v16, "addObject:", v19);

  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = a4;
  -[HKHorizontalTimePeriodSeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v14 = v13;
  -[HKHorizontalTimePeriodSeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v16 = v15;

  return sqrt(v16 * v16 + v14 * v14);
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height;
  double y;
  double v7;
  double x;
  id v11;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v21;

  height = a5.size.height;
  y = a5.origin.y;
  v7 = a3.y;
  x = a3.x;
  v11 = a4;
  if (v7 >= y && v7 <= y + height)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalTimePeriodSeries.m"), 263, CFSTR("xAxisDistanceFromPoint type class failure"));

    }
    v14 = v11;
    objc_msgSend(v14, "startXValue");
    v16 = v15 - x;
    objc_msgSend(v14, "endXValue");
    v18 = v17;

    v19 = fmax(v16, 0.0);
    if (x - v18 <= 0.0)
      v13 = v19;
    else
      v13 = x - v18;
  }
  else
  {
    v13 = 1.79769313e308;
  }

  return v13;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  id v12;
  double v13;
  double v14;
  void *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a3.y;
  v12 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalTimePeriodSeries.m"), 279, CFSTR("yAxisDifferenceToPoint type class failure"));

  }
  -[HKHorizontalTimePeriodSeries offsetForCoordinate:axisRect:](self, "offsetForCoordinate:axisRect:", v12, x, y, width, height);
  v14 = v13 - v9;

  return v14;
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;

  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalTimePeriodSeries.m"), 291, CFSTR("xAxisSelectedCoordinate type class failure"));

  }
  v9 = v8;
  objc_msgSend(v9, "startXValue");
  if (v10 <= a3)
    v11 = a3;
  else
    v11 = v10;
  objc_msgSend(v9, "endXValue");
  v13 = v12;

  if (v11 < v13)
    v13 = v11;

  return v13;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalTimePeriodSeries.m"), 300, CFSTR("yAxisDifferenceToPoint type class failure"));

  }
  v9 = v8;
  objc_msgSend(v7, "start");
  v11 = v10;
  objc_msgSend(v9, "start");
  v13 = v12;

  return v11 < v13;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalTimePeriodSeries.m"), 310, CFSTR("yAxisDifferenceToPoint type class failure"));

  }
  v9 = v8;
  objc_msgSend(v7, "start");
  v11 = v10;
  objc_msgSend(v9, "start");
  v13 = v12;

  return v11 > v13;
}

- (id)_generateAxisLabels
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  HKAxisLabel *v10;
  void *v11;
  NSArray *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_enumerationValueOrderingStorage;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        -[NSDictionary objectForKeyedSubscript:](self->_valueLabelsStorage, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc_init(HKAxisLabel);
        -[HKAxisLabel setText:](v10, "setText:", v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6 + v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAxisLabel setLocation:](v10, "setLocation:", v11);

        objc_msgSend(v3, "addObject:", v10);
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v6 += v8;
    }
    while (v5);
  }

  return v3;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  _BOOL4 v9;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  v9 = a8;
  -[HKHorizontalTimePeriodSeries enumerationRectForLevel:axisRect:](self, "enumerationRectForLevel:axisRect:", objc_msgSend(a3, "integerValue", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5, a6.x, a6.y), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[HKHorizontalTimePeriodSeries offsetForEnumerationRect:](self, "offsetForEnumerationRect:");
  v13 = HKUIFloorToScreenScale(v12);
  if (v9)
    v14 = v13;
  else
    v14 = a7;
  v15 = v18 + v14;
  if (v9)
    v13 = a7;
  v16 = v19 + v13;
  v17 = v15;
  result.y = v16;
  result.x = v17;
  return result;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (NSArray)cachedAxisLabelsStorage
{
  return self->_cachedAxisLabelsStorage;
}

- (UIImage)selectedPointMarkerImageStorage
{
  return self->_selectedPointMarkerImageStorage;
}

- (void)setSelectedPointMarkerImageStorage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPointMarkerImageStorage, a3);
}

- (UIColor)fillColorStorage
{
  return self->_fillColorStorage;
}

- (void)setFillColorStorage:(id)a3
{
  objc_storeStrong((id *)&self->_fillColorStorage, a3);
}

- (double)lineWidthStorage
{
  return self->_lineWidthStorage;
}

- (void)setLineWidthStorage:(double)a3
{
  self->_lineWidthStorage = a3;
}

- (NSArray)enumerationValueOrderingStorage
{
  return self->_enumerationValueOrderingStorage;
}

- (void)setEnumerationValueOrderingStorage:(id)a3
{
  objc_storeStrong((id *)&self->_enumerationValueOrderingStorage, a3);
}

- (NSDictionary)valueLabelsStorage
{
  return self->_valueLabelsStorage;
}

- (void)setValueLabelsStorage:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabelsStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabelsStorage, 0);
  objc_storeStrong((id *)&self->_enumerationValueOrderingStorage, 0);
  objc_storeStrong((id *)&self->_fillColorStorage, 0);
  objc_storeStrong((id *)&self->_selectedPointMarkerImageStorage, 0);
  objc_storeStrong((id *)&self->_cachedAxisLabelsStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
