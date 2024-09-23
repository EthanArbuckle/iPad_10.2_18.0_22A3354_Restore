@implementation HKHistogramChartPoint

- (HKHistogramChartPoint)initWithXValue:(id)a3 yValue:(id)a4
{
  id v7;
  id v8;
  HKHistogramChartPoint *v9;
  HKHistogramChartPoint *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHistogramChartPoint;
  v9 = -[HKHistogramChartPoint init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xValue, a3);
    objc_storeStrong((id *)&v10->_yValue, a4);
  }

  return v10;
}

- (id)allYValues
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HKHistogramChartPoint yValue](self, "yValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userInfo
{
  HKHistogramChartData *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  HKHistogramChartData *v9;

  v3 = [HKHistogramChartData alloc];
  -[HKHistogramChartPoint xValue](self, "xValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  -[HKHistogramChartPoint yValue](self, "yValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = -[HKHistogramChartData initWithXValue:yValue:](v3, "initWithXValue:yValue:", v6, v8);

  return v9;
}

- (NSNumber)xValue
{
  return self->_xValue;
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
