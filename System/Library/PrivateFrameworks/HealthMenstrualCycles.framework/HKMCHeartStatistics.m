@implementation HKMCHeartStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMCHeartStatistics)initWithCoder:(id)a3
{
  id v4;
  HKMCHeartStatistics *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKMCHeartStatistics;
  v5 = -[HKMCHeartStatistics init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("PercentileQuantityValue"));
    v5->_percentileQuantityValue = v6;
    v5->_sampleCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SampleCount"));
  }

  return v5;
}

- (HKMCHeartStatistics)initWithPercentileQuantityValue:(double)a3 sampleCount:(int64_t)a4
{
  HKMCHeartStatistics *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMCHeartStatistics;
  result = -[HKMCHeartStatistics init](&v7, sel_init);
  if (result)
  {
    result->_percentileQuantityValue = a3;
    result->_sampleCount = a4;
  }
  return result;
}

+ (id)heartStatisticsFromStatistics:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "percentileQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_value");
  v7 = v6;

  if (v7 == 0.0)
  {
    v12 = 0;
  }
  else
  {
    v8 = objc_alloc((Class)a1);
    objc_msgSend(v4, "percentileQuantity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValueForUnit:", v10);
    v12 = (void *)objc_msgSend(v8, "initWithPercentileQuantityValue:sampleCount:", objc_msgSend(v4, "dataCount"), v11);

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  double percentileQuantityValue;
  id v5;

  percentileQuantityValue = self->_percentileQuantityValue;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("PercentileQuantityValue"), percentileQuantityValue);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sampleCount, CFSTR("SampleCount"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_percentileQuantityValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sampleCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p percentileQuantity:%@ sampleCount:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKMCHeartStatistics *v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  BOOL v9;

  v4 = (HKMCHeartStatistics *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[HKMCHeartStatistics percentileQuantityValue](self, "percentileQuantityValue"),
          v6 = v5,
          -[HKMCHeartStatistics percentileQuantityValue](v4, "percentileQuantityValue"),
          v6 == v7))
    {
      v8 = -[HKMCHeartStatistics sampleCount](self, "sampleCount");
      v9 = v8 == -[HKMCHeartStatistics sampleCount](v4, "sampleCount");
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_percentileQuantityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sampleCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (double)percentileQuantityValue
{
  return self->_percentileQuantityValue;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

@end
