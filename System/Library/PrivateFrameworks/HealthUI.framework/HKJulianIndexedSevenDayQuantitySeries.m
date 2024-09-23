@implementation HKJulianIndexedSevenDayQuantitySeries

- (HKJulianIndexedSevenDayQuantitySeries)initWithColor:(id)a3 lineWidth:(double)a4
{
  return -[HKJulianIndexedSevenDayQuantitySeries initWithColor:lineWidth:hollowLineRatio:](self, "initWithColor:lineWidth:hollowLineRatio:", a3, a4, 0.5);
}

- (HKJulianIndexedSevenDayQuantitySeries)initWithColor:(id)a3 lineWidth:(double)a4 hollowLineRatio:(double)a5
{
  id v9;
  HKJulianIndexedSevenDayQuantitySeries *v10;
  HKJulianIndexedSevenDayQuantitySeries *v11;
  double v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKJulianIndexedSevenDayQuantitySeries;
  v10 = -[HKGraphSeries init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_color, a3);
    v11->_lineWidth = a4;
    v12 = 1.0;
    if (a5 <= 1.0)
      v12 = a5;
    v11->_hollowLineRatio = fmax(v12, 0.0);
  }

  return v11;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  id v13;
  id v14;
  UIColor *v15;
  UIColor *v16;
  double v17;
  __int128 v18;
  id v19;
  UIColor *v20;
  _OWORD v21[3];
  _QWORD v22[5];
  UIColor *v23;
  id v24;
  double v25;
  CGContext *v26;

  v13 = a9;
  v14 = a3;
  if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
  {
    v15 = self->_color;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartInactiveSeriesColor");
    v15 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  CGContextSaveGState(a7);
  CGContextSetLineCap(a7, kCGLineCapRound);
  v17 = self->_lineWidth * 0.5 + 2.0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __180__HKJulianIndexedSevenDayQuantitySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v22[3] = &unk_1E9C45680;
  v25 = v17;
  v26 = a7;
  v22[4] = self;
  v23 = v16;
  v24 = v13;
  v18 = *(_OWORD *)&a6->c;
  v21[0] = *(_OWORD *)&a6->a;
  v21[1] = v18;
  v21[2] = *(_OWORD *)&a6->tx;
  v19 = v13;
  v20 = v16;
  objc_msgSend(v14, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v21, 1, v22);

  CGContextRestoreGState(a7);
}

void __180__HKJulianIndexedSevenDayQuantitySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  int v19;
  CGContext *v20;
  id v21;

  v3 = a2;
  objc_msgSend(v3, "start");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "end");
  v9 = v8;
  v11 = v10;

  v12 = v5 + (v9 - v5) * 0.5;
  v13 = *(double *)(a1 + 56);
  if (v12 >= v5 + v13)
    v14 = v5 + v13;
  else
    v14 = v5 + (v9 - v5) * 0.5;
  v15 = v9 - v13;
  if (v12 >= v15)
    v16 = v5 + (v9 - v5) * 0.5;
  else
    v16 = v15;
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 64), *(CGFloat *)(*(_QWORD *)(a1 + 32) + 216));
  CGContextSetBlendMode(*(CGContextRef *)(a1 + 64), kCGBlendModeNormal);
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 64), (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));
  CGContextMoveToPoint(*(CGContextRef *)(a1 + 64), v14, v7);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 64), v16, v11);
  CGContextStrokePath(*(CGContextRef *)(a1 + 64));
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(double *)(v17 + 224);
  if (v18 > 0.0)
  {
    CGContextSetLineWidth(*(CGContextRef *)(a1 + 64), v18 * *(double *)(v17 + 216));
    v19 = objc_msgSend(*(id *)(a1 + 48), "seriesDrawingDuringTiling");
    v20 = *(CGContext **)(a1 + 64);
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(v20, (CGColorRef)objc_msgSend(v21, "CGColor"));

    }
    else
    {
      CGContextSetBlendMode(*(CGContextRef *)(a1 + 64), kCGBlendModeClear);
    }
    CGContextMoveToPoint(*(CGContextRef *)(a1 + 64), v14, v7);
    CGContextAddLineToPoint(*(CGContextRef *)(a1 + 64), v16, v11);
    CGContextStrokePath(*(CGContextRef *)(a1 + 64));
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
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJulianIndexedSevenDayQuantitySeries.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__HKJulianIndexedSevenDayQuantitySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C456A8;
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

void __83__HKJulianIndexedSevenDayQuantitySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(_QWORD *a1, void *a2)
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
  _HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate *v17;
  void *v18;
  _HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate *v19;
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
    v17 = [_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate alloc];
    objc_msgSend(v20, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate initWithStart:end:userInfo:](v17, "initWithStart:end:userInfo:", v18, v7, v15, v11, v15);
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
  -[HKJulianIndexedSevenDayQuantitySeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v14 = v13;
  -[HKJulianIndexedSevenDayQuantitySeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v16 = v15;

  return sqrt(v16 * v16 + v14 * v14);
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;

  x = a3.x;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJulianIndexedSevenDayQuantitySeries.m"), 182, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  v9 = v8;
  objc_msgSend(v9, "startXValue");
  v11 = v10 - x;
  objc_msgSend(v9, "endXValue");
  v13 = v12;

  v14 = fmax(v11, 0.0);
  if (x - v13 <= 0.0)
    v15 = v14;
  else
    v15 = x - v13;

  return v15;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  id v8;
  double v9;
  double v10;
  void *v12;

  y = a3.y;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJulianIndexedSevenDayQuantitySeries.m"), 197, CFSTR("yAxisDiffToPoint type class failure"));

  }
  objc_msgSend(v8, "start");
  v10 = v9 - y;

  return v10;
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v8;
  id v9;
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
  void *v21;

  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJulianIndexedSevenDayQuantitySeries.m"), 208, CFSTR("xAxisSelectedCoordinate type class failure"));

  }
  v9 = v8;
  objc_msgSend(v9, "startXValue");
  v11 = v10;
  objc_msgSend(v9, "endXValue");
  v13 = v12;

  v14 = self->_lineWidth * 0.5 + 2.0;
  v15 = v11 + (v13 - v11) * 0.5;
  v16 = v11 + v14;
  if (v15 < v11 + v14)
    v16 = v11 + (v13 - v11) * 0.5;
  v17 = v13 - v14;
  if (v15 >= v17)
    v17 = v11 + (v13 - v11) * 0.5;
  if (v16 <= a3)
    v18 = a3;
  else
    v18 = v16;
  if (v18 >= v17)
    v19 = v17;
  else
    v19 = v18;

  return v19;
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJulianIndexedSevenDayQuantitySeries.m"), 228, CFSTR("yAxisDifferenceToPoint type class failure"));

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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJulianIndexedSevenDayQuantitySeries.m"), 238, CFSTR("yAxisDifferenceToPoint type class failure"));

  }
  v9 = v8;
  objc_msgSend(v7, "start");
  v11 = v10;
  objc_msgSend(v9, "start");
  v13 = v12;

  return v11 > v13;
}

- (UIColor)color
{
  return self->_color;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (double)hollowLineRatio
{
  return self->_hollowLineRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
