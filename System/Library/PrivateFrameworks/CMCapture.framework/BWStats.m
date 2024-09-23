@implementation BWStats

- (void)addDataPoint:(double)a3
{
  double v3;
  int64_t numberOfSamples;
  double v5;
  int64_t maxNumberOfSamplesForMedianCalculation;

  v3 = self->_multiplier * a3;
  numberOfSamples = self->_numberOfSamples;
  self->_numberOfSamples = numberOfSamples + 1;
  if (v3 < self->_min)
    self->_min = v3;
  if (v3 > self->_max)
    self->_max = v3;
  v5 = self->_sumXX + v3 * v3;
  self->_sumX = v3 + self->_sumX;
  self->_sumXX = v5;
  maxNumberOfSamplesForMedianCalculation = self->_maxNumberOfSamplesForMedianCalculation;
  if (maxNumberOfSamplesForMedianCalculation < 1 || numberOfSamples < maxNumberOfSamplesForMedianCalculation)
    -[NSMutableArray addObject:](self->_samples, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"));
}

- (BWStats)init
{
  return -[BWStats initWithMedianCalculationEnabled:maxNumberOfSamplesForMedianCalculation:](self, "initWithMedianCalculationEnabled:maxNumberOfSamplesForMedianCalculation:", 0, 0);
}

- (BWStats)initWithMedianCalculationEnabled:(BOOL)a3 maxNumberOfSamplesForMedianCalculation:(int64_t)a4
{
  _BOOL4 v5;
  BWStats *v6;
  BWStats *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BWStats;
  v6 = -[BWStats init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_multiplier = 1.0;
    v6->_unitDesignator = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", &stru_1E4928818);
    v7->_medianCalculationEnabled = v5;
    v7->_maxNumberOfSamplesForMedianCalculation = a4;
    v7->_numberOfSamples = 0;
    *(_OWORD *)&v7->_min = xmmword_1A32B0D00;
    v7->_sumX = 0.0;
    v7->_sumXX = 0.0;
    if (v5)
      v7->_samples = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v7;
}

- (double)average
{
  int64_t numberOfSamples;

  numberOfSamples = self->_numberOfSamples;
  if (numberOfSamples)
    return self->_sumX / (double)numberOfSamples;
  else
    return 0.0;
}

- (void)removeDataPoint:(double)a3
{
  int64_t numberOfSamples;
  BOOL v4;
  int64_t v5;
  double v6;
  double v7;

  numberOfSamples = self->_numberOfSamples;
  v4 = numberOfSamples < 1;
  v5 = numberOfSamples - 1;
  if (!v4)
  {
    v6 = self->_multiplier * a3;
    self->_numberOfSamples = v5;
    v7 = self->_sumXX - v6 * v6;
    self->_sumX = self->_sumX - v6;
    self->_sumXX = v7;
    -[NSMutableArray removeObject:](self->_samples, "removeObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"));
  }
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (void)setUnitDesignator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BWStats)initWithStats:(id)a3
{
  BWStats *v4;
  BWStats *v5;
  uint64_t v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWStats;
  v4 = -[BWStats init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_multiplier = *((double *)a3 + 1);
    if (*((_QWORD *)a3 + 2))
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", *((_QWORD *)a3 + 2));
    else
      v6 = 0;
    v5->_unitDesignator = (NSString *)v6;
    v5->_medianCalculationEnabled = *((_BYTE *)a3 + 24);
    v5->_maxNumberOfSamplesForMedianCalculation = *((_QWORD *)a3 + 4);
    v5->_numberOfSamples = *((_QWORD *)a3 + 5);
    objc_msgSend(a3, "min");
    v5->_min = v7;
    objc_msgSend(a3, "max");
    v5->_max = v8;
    v5->_sumX = *((double *)a3 + 8);
    v5->_sumXX = *((double *)a3 + 9);
    v5->_samples = (NSMutableArray *)objc_msgSend(*((id *)a3 + 10), "copy");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStats;
  -[BWStats dealloc](&v3, sel_dealloc);
}

- (double)standardDeviation
{
  int64_t numberOfSamples;

  numberOfSamples = self->_numberOfSamples;
  if (numberOfSamples)
    return sqrt(vabdd_f64(self->_sumXX, self->_sumX * self->_sumX / (double)numberOfSamples) / (double)numberOfSamples);
  else
    return 0.0;
}

- (double)median
{
  uint64_t v3;
  double result;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;

  v3 = -[NSMutableArray count](self->_samples, "count");
  result = 0.0;
  if (self->_medianCalculationEnabled && v3 != 0)
  {
    v6 = v3;
    v7 = (void *)-[NSMutableArray sortedArrayUsingSelector:](self->_samples, "sortedArrayUsingSelector:", sel_compare_, 0.0);
    v8 = v7;
    v9 = v6 >> 1;
    if ((self->_numberOfSamples & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v9), "doubleValue");
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v9 - 1), "doubleValue");
      v11 = v10;
      objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v9), "doubleValue");
      return (v11 + v12) * 0.5;
    }
  }
  return result;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  int64_t numberOfSamples;
  NSString *unitDesignator;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;

  v3 = 0;
  if (self->_numberOfSamples < 1)
  {
    v5 = 0;
  }
  else
  {
    -[BWStats min](self, "min");
    v5 = v4;
    if (self->_numberOfSamples >= 1)
    {
      -[BWStats max](self, "max");
      v3 = v6;
    }
  }
  if (self->_medianCalculationEnabled)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[BWStats median](self, "median");
    v9 = (const __CFString *)objc_msgSend(v7, "stringWithFormat:", CFSTR(", median: %lf%@"), v8, -[BWStats unitDesignator](self, "unitDesignator"));
  }
  else
  {
    v9 = &stru_1E4928818;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  numberOfSamples = self->_numberOfSamples;
  unitDesignator = self->_unitDesignator;
  -[BWStats average](self, "average");
  v14 = v13;
  v15 = self->_unitDesignator;
  -[BWStats standardDeviation](self, "standardDeviation");
  return (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("Number of samples: %lld, min: %lf%@, max: %lf%@, average: %lf%@, standard deviation: %lf%@ %@"), numberOfSamples, v5, unitDesignator, v3, unitDesignator, v14, v15, v16, self->_unitDesignator, v9);
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v4), self, -[BWStats description](self, "description"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[BWStats multiplier](self, "multiplier");
  objc_msgSend((id)v4, "setMultiplier:");
  objc_msgSend((id)v4, "setUnitDesignator:", -[BWStats unitDesignator](self, "unitDesignator"));
  *(_QWORD *)(v4 + 40) = -[BWStats numberOfSamples](self, "numberOfSamples");
  *(double *)(v4 + 48) = self->_min;
  *(double *)(v4 + 56) = self->_max;
  *(double *)(v4 + 64) = self->_sumX;
  *(double *)(v4 + 72) = self->_sumXX;
  *(_BYTE *)(v4 + 24) = self->_medianCalculationEnabled;
  *(_QWORD *)(v4 + 32) = self->_maxNumberOfSamplesForMedianCalculation;
  *(_QWORD *)(v4 + 80) = -[NSMutableArray copy](self->_samples, "copy");
  return (id)v4;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (NSString)unitDesignator
{
  return self->_unitDesignator;
}

- (int64_t)numberOfSamples
{
  return self->_numberOfSamples;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (int64_t)nextDataPointIndex
{
  return self->_nextDataPointIndex;
}

- (void)setNextDataPointIndex:(int64_t)a3
{
  self->_nextDataPointIndex = a3;
}

@end
