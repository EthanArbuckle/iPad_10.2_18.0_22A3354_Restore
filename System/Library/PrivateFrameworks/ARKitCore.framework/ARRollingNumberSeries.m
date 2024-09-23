@implementation ARRollingNumberSeries

- (ARRollingNumberSeries)initWithWindowSize:(unint64_t)a3
{
  ARRollingNumberSeries *v4;
  ARRollingNumberSeries *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARRollingNumberSeries;
  v4 = -[ARRollingNumberSeries init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_windowSize = a3;
    v4->_count = 0;
    v4->_series = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v5->_currentIndex = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_series);
  v3.receiver = self;
  v3.super_class = (Class)ARRollingNumberSeries;
  -[ARRollingNumberSeries dealloc](&v3, sel_dealloc);
}

- (double)max
{
  unint64_t count;
  double *series;
  double result;
  double v5;
  double v6;

  count = self->_count;
  if (!count)
    return 2.22507386e-308;
  series = self->_series;
  result = 2.22507386e-308;
  do
  {
    v5 = *series++;
    v6 = v5;
    if (result < v5)
      result = v6;
    --count;
  }
  while (count);
  return result;
}

- (double)min
{
  unint64_t count;
  double *series;
  double result;
  double v5;
  double v6;

  count = self->_count;
  if (!count)
    return 1.79769313e308;
  series = self->_series;
  result = 1.79769313e308;
  do
  {
    v5 = *series++;
    v6 = v5;
    if (result >= v5)
      result = v6;
    --count;
  }
  while (count);
  return result;
}

- (void)appendNumber:(double)a3
{
  unint64_t count;
  unint64_t windowSize;
  double *series;
  unint64_t v6;
  unint64_t currentIndex;
  double v8;
  double average;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  windowSize = self->_windowSize;
  count = self->_count;
  series = self->_series;
  if (count >= windowSize)
  {
    currentIndex = self->_currentIndex;
    v8 = series[currentIndex];
    self->_sum = self->_sum - v8;
    series[currentIndex] = a3;
    v6 = count;
  }
  else
  {
    series[count] = a3;
    v6 = count + 1;
    self->_count = count + 1;
    currentIndex = self->_currentIndex;
    v8 = 0.0;
  }
  self->_currentIndex = (currentIndex + 1) % windowSize;
  average = self->_average;
  v10 = self->_sum + a3;
  v11 = v10 / (double)v6;
  self->_sum = v10;
  self->_average = v11;
  if (v6 < 2)
  {
    self->_sumVariance = 0.0;
    v14 = 0.0;
  }
  else
  {
    v12 = a3 - average;
    v13 = a3 - v11;
    if (count >= windowSize)
      v14 = v12 * v13 - (v8 - average) * (v8 - v11) + self->_sumVariance;
    else
      v14 = self->_sumVariance + v12 * v13;
    self->_sumVariance = v14;
  }
  self->_variance = fabs(v14 / (double)(v6 - 1));
}

- (void)clear
{
  self->_currentIndex = 0;
  self->_sumVariance = 0.0;
  *(_OWORD *)&self->_count = 0u;
  *(_OWORD *)&self->_average = 0u;
}

- (unint64_t)windowSize
{
  return self->_windowSize;
}

- (unint64_t)count
{
  return self->_count;
}

- (double)sum
{
  return self->_sum;
}

- (double)average
{
  return self->_average;
}

- (double)variance
{
  return self->_variance;
}

@end
