@implementation _HKSleepDurationAverageSeries

- (_HKSleepDurationAverageSeries)init
{
  _HKSleepDurationAverageSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  NSNumber *averageValueTypeStorage;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKSleepDurationAverageSeries;
  v2 = -[HKSleepDurationSeries init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("_HKSleepDurationAverageSeriesLock"));
    v2->_averageValueStorage = -1.0;
    averageValueTypeStorage = v2->_averageValueTypeStorage;
    v2->_averageValueTypeStorage = 0;

  }
  return v2;
}

- (void)setAverageValue:(double)a3
{
  void *v5;
  id v6;

  -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_averageValueStorage = a3;
  -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (NSNumber)averageValueType
{
  void *v3;
  NSNumber *v4;
  void *v5;

  -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_averageValueTypeStorage;
  -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setAverageValueType:(id)a3
{
  NSNumber *v4;
  void *v5;
  NSNumber *averageValueTypeStorage;
  id v7;

  v4 = (NSNumber *)a3;
  -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  averageValueTypeStorage = self->_averageValueTypeStorage;
  self->_averageValueTypeStorage = v4;

  -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (int64_t)overlayType
{
  return 2;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  void *v7;
  void *v8;
  _QWORD v10[5];
  HKGraphSeriesDataBlockPath v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_HKSleepDurationAverageSeries;
  v11 = *a4;
  -[HKSleepDurationSeries coordinatesForBlock:blockPath:xAxis:yAxis:](&v12, sel_coordinatesForBlock_blockPath_xAxis_yAxis_, a3, &v11, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75___HKSleepDurationAverageSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v10[3] = &unk_1E9C45838;
  v10[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  return v7;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  void *v10;
  double averageValueStorage;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a9;
  -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lock");

  averageValueStorage = self->_averageValueStorage;
  -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

  objc_msgSend(v21, "axisAnnotationDelegateForSeries:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "seriesDrawingDuringScrolling") & 1) != 0
    || (objc_msgSend(v21, "seriesDrawingDuringTiling") & 1) != 0
    || averageValueStorage < 0.0)
  {
    objc_msgSend(v13, "clearAxisAnnotations");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepDurationSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "strokeColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepDurationSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "strokeColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKAttributedDurationFormatter formattedValueWithDuration:unitsStyle:font:valueColor:unitColor:](HKAttributedDurationFormatter, "formattedValueWithDuration:unitsStyle:font:valueColor:unitColor:", 1, v14, v16, v18, averageValueStorage);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", averageValueStorage);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAxisAnnotation:forSeries:modelCoordinate:", v19, self, v20);

  }
}

- (void)drawOverlayInContext:(CGContext *)a3 seriesOverlayData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double averageValueStorage;
  void *v10;
  _HKSleepDurationAverageSeries *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v6 = a4;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

    averageValueStorage = self->_averageValueStorage;
    -[_HKSleepDurationAverageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlock");

    objc_msgSend(v7, "graphSeries");
    v11 = (_HKSleepDurationAverageSeries *)objc_claimAutoreleasedReturnValue();

    if (v11 == self && averageValueStorage >= 0.0)
    {
      if (v7)
      {
        objc_msgSend(v7, "graphSeriesPointTransform");
        v12 = *((double *)&v21 + 1);
        v13 = *((double *)&v22 + 1);
        v14 = *((double *)&v23 + 1);
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v21 = 0u;
        v14 = 0.0;
        v13 = 0.0;
        v12 = 0.0;
      }
      v15 = v14 + averageValueStorage * v13 + v12 * 0.0;
      -[HKSleepDurationSeries goalLineStrokeStyle](self, "goalLineStrokeStyle", v21, v22, v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applyToContext:", a3);

      objc_msgSend(v7, "graphSeriesScreenRect");
      CGContextMoveToPoint(a3, v17, v15);
      objc_msgSend(v7, "graphSeriesScreenRect");
      v19 = v18;
      objc_msgSend(v7, "graphSeriesScreenRect");
      CGContextAddLineToPoint(a3, v19 + v20, v15);
      CGContextStrokePath(a3);
    }

  }
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (double)averageValueStorage
{
  return self->_averageValueStorage;
}

- (void)setAverageValueStorage:(double)a3
{
  self->_averageValueStorage = a3;
}

- (NSNumber)averageValueTypeStorage
{
  return self->_averageValueTypeStorage;
}

- (void)setAverageValueTypeStorage:(id)a3
{
  objc_storeStrong((id *)&self->_averageValueTypeStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageValueTypeStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
