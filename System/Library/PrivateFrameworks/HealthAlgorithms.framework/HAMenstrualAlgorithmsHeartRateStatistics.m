@implementation HAMenstrualAlgorithmsHeartRateStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *lowerPercentile;
  void *v5;
  int64_t sampleCount;
  void *v7;
  id v8;

  v8 = a3;
  lowerPercentile = self->_lowerPercentile;
  NSStringFromSelector(sel_lowerPercentile);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", lowerPercentile, v5);

  sampleCount = self->_sampleCount;
  NSStringFromSelector(sel_sampleCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeInteger:forKey:", sampleCount, v7);

}

- (HAMenstrualAlgorithmsHeartRateStatistics)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsHeartRateStatistics *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSNumber *lowerPercentile;
  void *v10;
  HAMenstrualAlgorithmsHeartRateStatistics *v11;

  v4 = a3;
  v5 = -[HAMenstrualAlgorithmsHeartRateStatistics init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_lowerPercentile);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    lowerPercentile = v5->_lowerPercentile;
    v5->_lowerPercentile = (NSNumber *)v8;

    NSStringFromSelector(sel_sampleCount);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sampleCount = objc_msgSend(v4, "decodeIntegerForKey:", v10);

    v11 = v5;
  }

  return v5;
}

- (NSNumber)lowerPercentile
{
  return self->_lowerPercentile;
}

- (void)setLowerPercentile:(id)a3
{
  objc_storeStrong((id *)&self->_lowerPercentile, a3);
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(int64_t)a3
{
  self->_sampleCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerPercentile, 0);
}

@end
