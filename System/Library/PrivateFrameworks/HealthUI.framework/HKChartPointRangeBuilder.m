@implementation HKChartPointRangeBuilder

- (HKChartPointRangeBuilder)init
{
  HKChartPointRangeBuilder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKChartPointRangeBuilder;
  result = -[HKChartPointRangeBuilder init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_maximumMax = xmmword_1D7B82B10;
  return result;
}

- (id)suggestedValueRangeWithRounding:(BOOL)a3
{
  double minimumMin;
  double v4;
  double maximumMax;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_numChartPoints)
  {
    minimumMin = fmax(self->_uMin + sqrt(self->_vMin) * -1.25, 0.0);
    v4 = self->_uMax + sqrt(self->_vMax) * 1.25;
    if (minimumMin < self->_minimumMin)
      minimumMin = self->_minimumMin;
    maximumMax = fmax(v4, 0.0);
    if (maximumMax >= self->_maximumMax)
      maximumMax = self->_maximumMax;
    v6 = floor(minimumMin);
    v7 = ceil(maximumMax);
    if (a3)
      v8 = v7;
    else
      v8 = maximumMax;
    if (a3)
      minimumMin = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", minimumMin);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)visitChartPoint:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  float64x2_t v9;
  int64_t numChartPoints;
  int64_t v12;
  double v13;
  double uMax;
  double uMin;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  double v21;
  double v22;
  float64x2_t v23;
  int8x16_t v24;
  int8x16_t v25;
  double v26;
  double v27;

  v4 = a3;
  objc_msgSend(v4, "maxYValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v27 = v6;

  objc_msgSend(v4, "minYValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v26 = v8;

  v9.f64[0] = v27;
  if (v27 > -1.79769313e308 && v26 < 1.79769313e308)
  {
    numChartPoints = self->_numChartPoints;
    v12 = numChartPoints + 1;
    v13 = (double)numChartPoints;
    uMax = self->_uMax;
    uMin = self->_uMin;
    v16 = (double)(numChartPoints + 1);
    v17 = (v27 + uMax * (double)numChartPoints) / v16;
    v18 = (v26 + uMin * (double)numChartPoints) / v16;
    v19 = numChartPoints <= 1;
    v20 = numChartPoints - 1;
    if (v19)
    {
      v21 = 0.0;
      v22 = 0.0;
    }
    else
    {
      v21 = ((v27 - uMax) * (v27 - v17) + (double)v20 * self->_vMax) / v13;
      v22 = ((v26 - uMin) * (v26 - v18) + (double)v20 * self->_vMin) / v13;
    }
    self->_uMax = v17;
    self->_uMin = v18;
    self->_vMax = v21;
    self->_vMin = v22;
    v23 = *(float64x2_t *)&self->_maximumMax;
    v24.i64[1] = *(_QWORD *)&self->_minimumMin;
    *(double *)v24.i64 = v27;
    v9.f64[1] = v26;
    v25 = (int8x16_t)vcgtq_f64(v9, v23);
    v23.f64[1] = v26;
    *(int8x16_t *)&self->_maximumMax = vbslq_s8(v25, v24, (int8x16_t)v23);
    self->_numChartPoints = v12;
  }
}

- (double)uMax
{
  return self->_uMax;
}

- (void)setUMax:(double)a3
{
  self->_uMax = a3;
}

- (double)uMin
{
  return self->_uMin;
}

- (void)setUMin:(double)a3
{
  self->_uMin = a3;
}

- (double)vMax
{
  return self->_vMax;
}

- (void)setVMax:(double)a3
{
  self->_vMax = a3;
}

- (double)vMin
{
  return self->_vMin;
}

- (void)setVMin:(double)a3
{
  self->_vMin = a3;
}

- (double)maximumMax
{
  return self->_maximumMax;
}

- (void)setMaximumMax:(double)a3
{
  self->_maximumMax = a3;
}

- (double)minimumMin
{
  return self->_minimumMin;
}

- (void)setMinimumMin:(double)a3
{
  self->_minimumMin = a3;
}

- (int64_t)numChartPoints
{
  return self->_numChartPoints;
}

- (void)setNumChartPoints:(int64_t)a3
{
  self->_numChartPoints = a3;
}

@end
