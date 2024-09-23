@implementation HKSleepComparisonDaySeries

- (HKSleepComparisonDaySeries)init
{
  HKSleepComparisonDaySeries *v2;
  HKSleepComparisonDaySeries *v3;
  NSArray *defaultFillStylesStorage;
  NSLock *v5;
  NSLock *seriesMutableStateLock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSleepComparisonDaySeries;
  v2 = -[HKGraphSeries init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cornerRadiiStorage.width = 0.0;
    v2->_cornerRadiiStorage.height = 0.0;
    defaultFillStylesStorage = v2->_defaultFillStylesStorage;
    v2->_defaultFillStylesStorage = (NSArray *)MEMORY[0x1E0C9AA60];

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v3->_seriesMutableStateLock;
    v3->_seriesMutableStateLock = v5;

    -[NSLock setName:](v3->_seriesMutableStateLock, "setName:", CFSTR("HKSleepComparisonDaySeriesLock"));
  }
  return v3;
}

- (CGSize)cornerRadii
{
  void *v3;
  CGFloat width;
  CGFloat height;
  void *v6;
  double v7;
  double v8;
  CGSize result;

  -[HKSleepComparisonDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  width = self->_cornerRadiiStorage.width;
  height = self->_cornerRadiiStorage.height;
  -[HKSleepComparisonDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setCornerRadii:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  id v7;

  height = a3.height;
  width = a3.width;
  -[HKSleepComparisonDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  self->_cornerRadiiStorage.width = width;
  self->_cornerRadiiStorage.height = height;
  -[HKSleepComparisonDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (NSArray)defaultFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepComparisonDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_defaultFillStylesStorage;
  -[HKSleepComparisonDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
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
  -[HKSleepComparisonDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  defaultFillStylesStorage = self->_defaultFillStylesStorage;
  self->_defaultFillStylesStorage = v6;

  -[HKSleepComparisonDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v18;
  __int128 v19;
  int64_t resolution;
  _QWORD v21[4];
  id v22;
  id v23;

  v10 = a5;
  objc_msgSend(a3, "chartPoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepComparisonDaySeries.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v10, "transform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__HKSleepComparisonDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v21[3] = &unk_1E9C43B18;
  v22 = v12;
  v23 = v13;
  v14 = v13;
  v15 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);
  v19 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v14, &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __72__HKSleepComparisonDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
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
  HKSleepComparisonDayCoordinate *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HKSleepComparisonDayCoordinate *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v18, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateForValue:", v5);
    v7 = v6;

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v18, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinateForValue:", v9);
    v11 = v10;

    v12 = *(void **)(a1 + 40);
    v13 = [HKSleepComparisonDayCoordinate alloc];
    objc_msgSend(v18, "yValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (int)objc_msgSend(v14, "intValue");
    objc_msgSend(v18, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKSleepComparisonDayCoordinate initWithXValueStart:xValueEnd:sleepValue:userInfo:](v13, "initWithXValueStart:xValueEnd:sleepValue:userInfo:", v15, v16, v7, v11);
    objc_msgSend(v12, "addObject:", v17);

  }
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  HKSleepComparisonDaySeries *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD v35[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v35[2] = *MEMORY[0x1E0C80C00];
  v16 = (void *)MEMORY[0x1E0DC3508];
  v17 = a3;
  objc_msgSend(v16, "bezierPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v18;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __169__HKSleepComparisonDaySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v28[3] = &unk_1E9C43B40;
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  v29 = v21;
  v30 = self;
  v22 = *(_OWORD *)&a6->c;
  v25 = *(_OWORD *)&a6->a;
  v26 = v22;
  v27 = *(_OWORD *)&a6->tx;
  v23 = v21;
  objc_msgSend(v17, "enumerateCoordinatesWithTransform:roundToViewScale:block:", &v25, 1, v28);

  -[HKSleepComparisonDaySeries defaultFillStyles](self, "defaultFillStyles", v25, v26, v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepComparisonDaySeries _drawPaths:withFillStyles:axisRect:context:](self, "_drawPaths:withFillStyles:axisRect:context:", v23, v24, a7, x, y, width, height);

}

void __169__HKSleepComparisonDaySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  CGFloat v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double x;
  double y;
  double width;
  double height;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v3 = *(double *)(a1 + 72);
  v4 = v3 * 0.3;
  v5 = *(double *)(a1 + 56) + (v3 - v3 * 0.3) * 0.5;
  v6 = a2;
  objc_msgSend(v6, "xValueStart");
  v8 = v7;
  objc_msgSend(v6, "xValueEnd");
  v10 = v9;
  objc_msgSend(v6, "xValueStart");
  v21.size.width = v10 - v11;
  v21.origin.x = v8;
  v21.origin.y = v5;
  v21.size.height = v4;
  v22 = CGRectStandardize(v21);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v16 = objc_msgSend(v6, "sleepValue");

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v16 != 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cornerRadii");
  +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1, x, y, width, height, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendPath:", v19);

}

- (void)_drawPaths:(id)a3 withFillStyles:(id)a4 axisRect:(CGRect)a5 context:(CGContext *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  id v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v19 = a3;
  v13 = a4;
  if (objc_msgSend(v19, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEmpty") & 1) == 0)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = objc_msgSend(objc_retainAutorelease(v15), "CGPath");
          -[HKGraphSeries alpha](self, "alpha");
          objc_msgSend(v16, "renderPath:context:axisRect:alpha:", v17, a6, x, y, width, height, v18);
        }

      }
      ++v14;
    }
    while (v14 < objc_msgSend(v19, "count"));
  }

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
  -[HKSleepComparisonDaySeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v14 = v13;
  -[HKSleepComparisonDaySeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v16 = v15;

  return sqrt(v16 * v16 + v14 * v14);
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepComparisonDaySeries.m"), 251, CFSTR("xAxisSelectedCoordinate type class failure"));

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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepComparisonDaySeries.m"), 261, CFSTR("xAxisDistanceFromPoint type class failure"));

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
  return 0.0;
}

- (id)visibleValueRange
{
  return +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CED578, &unk_1E9CED588);
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[HKSleepComparisonDaySeries visibleValueRange](self, "visibleValueRange", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  HKAxisLabel *v4;
  HKAxisLabel *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(HKAxisLabel);
  -[HKAxisLabel setText:](v4, "setText:", &stru_1E9C4C428);
  -[HKAxisLabel setLocation:](v4, "setLocation:", &unk_1E9CED578);
  -[HKAxisLabel setLabelType:](v4, "setLabelType:", 1);
  v5 = objc_alloc_init(HKAxisLabel);
  -[HKAxisLabel setText:](v5, "setText:", &stru_1E9C4C428);
  -[HKAxisLabel setLocation:](v5, "setLocation:", &unk_1E9CED588);
  -[HKAxisLabel setLabelType:](v5, "setLabelType:", 1);
  v8[0] = v4;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  double v9;
  double v10;
  CGPoint result;

  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v10;
  result.x = v9;
  return result;
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

- (NSArray)defaultFillStylesStorage
{
  return self->_defaultFillStylesStorage;
}

- (void)setDefaultFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
  objc_storeStrong((id *)&self->_defaultFillStylesStorage, 0);
}

@end
