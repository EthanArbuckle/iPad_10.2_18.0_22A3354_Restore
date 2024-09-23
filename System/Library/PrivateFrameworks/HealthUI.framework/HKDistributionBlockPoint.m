@implementation HKDistributionBlockPoint

- (HKDistributionBlockPoint)initWithChartPoint:(id)a3 xAxisTransform:(id)a4 yAxisTransform:(id)a5 gapZeroCount:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  HKDistributionBlockPoint *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  NSArray *distributionSegments;
  uint64_t v25;
  HKGraphSeriesBlockCoordinateInfo *userInfo;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)HKDistributionBlockPoint;
  v13 = -[HKDistributionBlockPoint init](&v28, sel_init);
  if (v13)
  {
    objc_msgSend(v10, "xValueAsGenericType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinateForValue:", v14);
    v16 = v15;
    objc_msgSend(v10, "minYValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateForValue:", v17);
    v19 = v18;

    objc_msgSend(v10, "maxYValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateForValue:", v20);
    v22 = v21;

    v13->_minPoint.x = v16;
    v13->_minPoint.y = v19;
    v13->_maxPoint.x = v16;
    v13->_maxPoint.y = v22;
    +[HKQuantityDistributionSeries transformedSegmentsFromChartPoint:forX:minY:maxY:zeroCountForGap:](HKQuantityDistributionSeries, "transformedSegmentsFromChartPoint:forX:minY:maxY:zeroCountForGap:", v10, a6, v16, v19, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    distributionSegments = v13->_distributionSegments;
    v13->_distributionSegments = (NSArray *)v23;

    objc_msgSend(v10, "userInfo");
    v25 = objc_claimAutoreleasedReturnValue();
    userInfo = v13->_userInfo;
    v13->_userInfo = (HKGraphSeriesBlockCoordinateInfo *)v25;

  }
  return v13;
}

- (HKDistributionBlockPoint)initWithTransform:(CGAffineTransform *)a3 blockPoint:(id)a4
{
  id v6;
  char *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _OWORD v19[3];
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HKDistributionBlockPoint;
  v7 = -[HKDistributionBlockPoint init](&v20, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "minPoint");
    *(float64x2_t *)(v7 + 24) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v8), *(float64x2_t *)&a3->a, v9));
    objc_msgSend(v6, "maxPoint");
    *(float64x2_t *)(v7 + 40) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v10), *(float64x2_t *)&a3->a, v11));
    objc_msgSend(v6, "distributionSegments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)&a3->c;
    v19[0] = *(_OWORD *)&a3->a;
    v19[1] = v13;
    v19[2] = *(_OWORD *)&a3->tx;
    objc_msgSend(v7, "_applyTransformToSegments:transform:", v12, v19);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v14;

    objc_msgSend(v6, "userInfo");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v16;

  }
  return (HKDistributionBlockPoint *)v7;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  HKDistributionBlockPoint *v6;
  __int128 v7;
  _OWORD v9[3];

  v6 = [HKDistributionBlockPoint alloc];
  v7 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->tx;
  return -[HKDistributionBlockPoint initWithTransform:blockPoint:](v6, "initWithTransform:blockPoint:", v9, self);
}

- (double)startXValue
{
  return self->_minPoint.x;
}

- (double)endXValue
{
  return self->_minPoint.x;
}

- (id)_quickDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("MM/dd/YYYY-HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_minPoint.x);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDistributionBlockPoint _quickDate:](self, "_quickDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_distributionSegments;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "CGPointValue");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lg"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(";"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("distribution_point{min %@ %lg min %lg, max %lg [%@]}"), v3, *(_QWORD *)&self->_minPoint.x, *(_QWORD *)&self->_minPoint.y, *(_QWORD *)&self->_maxPoint.y, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (id)_applyTransformToSegments:(id)a3 transform:(CGAffineTransform *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "CGPointValue", (_QWORD)v16);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v12), *(float64x2_t *)&a4->a, v13)));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (CGPoint)minPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_minPoint.x;
  y = self->_minPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)maxPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_maxPoint.x;
  y = self->_maxPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSArray)distributionSegments
{
  return self->_distributionSegments;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_distributionSegments, 0);
}

@end
