@implementation HKMHValenceDistributionData

- (HKMHValenceDistributionData)initWithMinimumValence:(double)a3 maximumValence:(double)a4 sampleCount:(int64_t)a5 reflectiveInterval:(int64_t)a6
{
  HKMHValenceDistributionData *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKMHValenceDistributionData;
  result = -[HKMHValenceDistributionData init](&v11, sel_init);
  if (result)
  {
    result->_minimumValence = a3;
    result->_maximumValence = a4;
    result->_sampleCount = a5;
    result->_reflectiveInterval = a6;
  }
  return result;
}

- (void)addValenceDistribution:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "minimumValence");
  if (v4 < self->_minimumValence)
  {
    objc_msgSend(v8, "minimumValence");
    self->_minimumValence = v5;
  }
  objc_msgSend(v8, "maximumValence");
  if (v6 > self->_maximumValence)
  {
    objc_msgSend(v8, "maximumValence");
    self->_maximumValence = v7;
  }
  self->_sampleCount += objc_msgSend(v8, "sampleCount");

}

- (BOOL)isEqual:(id)a3
{
  HKMHValenceDistributionData *v4;
  HKMHValenceDistributionData *v5;
  BOOL v6;

  v4 = (HKMHValenceDistributionData *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_minimumValence == v5->_minimumValence
        && self->_maximumValence == v5->_maximumValence
        && self->_sampleCount == v5->_sampleCount
        && self->_reflectiveInterval == v5->_reflectiveInterval;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_minimumValence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maximumValence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4 ^ self->_sampleCount ^ self->_reflectiveInterval;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKMHValenceDistributionData initWithMinimumValence:maximumValence:sampleCount:reflectiveInterval:](+[HKMHValenceDistributionData allocWithZone:](HKMHValenceDistributionData, "allocWithZone:", a3), "initWithMinimumValence:maximumValence:sampleCount:reflectiveInterval:", self->_sampleCount, self->_reflectiveInterval, self->_minimumValence, self->_maximumValence);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)HKMHValenceDistributionData;
  -[HKMHValenceDistributionData description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_minimumValence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maximumValence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sampleCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_reflectiveInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[min:%@ max:%@ count:%@ interval:%@]"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)hk_redactedDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMHValenceDistributionData;
  -[HKMHValenceDistributionData description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHValenceDistributionData)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MinimumValence"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MaximumValence"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SampleCount"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ReflectiveInterval"));

  return -[HKMHValenceDistributionData initWithMinimumValence:maximumValence:sampleCount:reflectiveInterval:](self, "initWithMinimumValence:maximumValence:sampleCount:reflectiveInterval:", v9, v10, v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  double minimumValence;
  id v5;

  minimumValence = self->_minimumValence;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("MinimumValence"), minimumValence);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("MaximumValence"), self->_maximumValence);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sampleCount, CFSTR("SampleCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reflectiveInterval, CFSTR("ReflectiveInterval"));

}

- (double)minimumValence
{
  return self->_minimumValence;
}

- (double)maximumValence
{
  return self->_maximumValence;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (int64_t)reflectiveInterval
{
  return self->_reflectiveInterval;
}

@end
