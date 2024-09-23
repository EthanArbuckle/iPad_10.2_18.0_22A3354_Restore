@implementation BWMovingWindowStats

- (BWMovingWindowStats)initWithWindowSize:(int)a3
{
  BWMovingWindowStats *v4;
  BWMovingWindowStats *v5;
  objc_super v7;

  if (a3 < 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Window size needs to be greater than 0"), 0));
  v7.receiver = self;
  v7.super_class = (Class)BWMovingWindowStats;
  v4 = -[BWStats init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_windowSize = a3;
    v4->_numDataPoints = 0;
    v4->_dataPointIndex = 0;
    v4->_dataPoints = (double *)malloc_type_malloc(8 * v4->_windowSize, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)addDataPoint:(double)a3
{
  uint64_t dataPointIndex;
  int numDataPoints;
  objc_super v7;

  if (self->_numDataPoints == self->_windowSize)
    -[BWStats removeDataPoint:](self, "removeDataPoint:", self->_dataPoints[self->_dataPointIndex]);
  v7.receiver = self;
  v7.super_class = (Class)BWMovingWindowStats;
  -[BWStats addDataPoint:](&v7, sel_addDataPoint_, a3);
  dataPointIndex = self->_dataPointIndex;
  self->_dataPoints[dataPointIndex] = a3;
  self->_dataPointIndex = ((int)dataPointIndex + 1) % self->_windowSize;
  numDataPoints = self->_numDataPoints;
  if (numDataPoints < self->_windowSize)
    self->_numDataPoints = numDataPoints + 1;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_dataPoints);
  v3.receiver = self;
  v3.super_class = (Class)BWMovingWindowStats;
  -[BWStats dealloc](&v3, sel_dealloc);
}

- (double)min
{
  uint64_t numDataPoints;
  double *dataPoints;
  double v4;
  double *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  numDataPoints = self->_numDataPoints;
  if ((int)numDataPoints < 1)
  {
    v4 = 0.0;
  }
  else
  {
    dataPoints = self->_dataPoints;
    v4 = *dataPoints;
    if ((_DWORD)numDataPoints != 1)
    {
      v5 = dataPoints + 1;
      v6 = numDataPoints - 1;
      do
      {
        v7 = *v5++;
        v8 = v7;
        if (v4 > v7)
          v4 = v8;
        --v6;
      }
      while (v6);
    }
  }
  -[BWStats multiplier](self, "multiplier");
  return v4 * v9;
}

- (double)max
{
  uint64_t numDataPoints;
  double *dataPoints;
  double v4;
  double *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  numDataPoints = self->_numDataPoints;
  if ((int)numDataPoints < 1)
  {
    v4 = 0.0;
  }
  else
  {
    dataPoints = self->_dataPoints;
    v4 = *dataPoints;
    if ((_DWORD)numDataPoints != 1)
    {
      v5 = dataPoints + 1;
      v6 = numDataPoints - 1;
      do
      {
        v7 = *v5++;
        v8 = v7;
        if (v4 < v7)
          v4 = v8;
        --v6;
      }
      while (v6);
    }
  }
  -[BWStats multiplier](self, "multiplier");
  return v4 * v9;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMovingWindowStats;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moving Average: %@"), -[BWStats description](&v3, sel_description));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWMovingWindowStats;
  v4 = -[BWStats copyWithZone:](&v7, sel_copyWithZone_, a3);
  v4[24] = self->_windowSize;
  v4[25] = self->_numDataPoints;
  v4[26] = self->_dataPointIndex;
  v5 = malloc_type_malloc(8 * self->_windowSize, 0x100004000313F17uLL);
  *((_QWORD *)v4 + 14) = v5;
  memcpy(v5, self->_dataPoints, 8 * self->_windowSize);
  return v4;
}

- (int)windowSize
{
  return self->_windowSize;
}

@end
