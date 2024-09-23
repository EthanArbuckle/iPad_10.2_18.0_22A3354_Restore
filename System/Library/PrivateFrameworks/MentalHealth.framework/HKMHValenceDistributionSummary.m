@implementation HKMHValenceDistributionSummary

- (HKMHValenceDistributionSummary)initWithDayIndexRange:(id)a3 valenceDistributions:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  HKMHValenceDistributionSummary *v8;
  HKMHValenceDistributionSummary *v9;
  uint64_t v10;
  NSArray *valenceDistributions;
  double v12;
  double v13;
  objc_super v15;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKMHValenceDistributionSummary;
  v8 = -[HKMHValenceDistributionSummary init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_dayIndexRange.start = var0;
    v8->_dayIndexRange.duration = var1;
    v10 = objc_msgSend(v7, "copy");
    valenceDistributions = v9->_valenceDistributions;
    v9->_valenceDistributions = (NSArray *)v10;

    objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", &__block_literal_global);
    v9->_countDaily = (uint64_t)v12;
    objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", &__block_literal_global_184);
    v9->_countMomentary = (uint64_t)v13;
  }

  return v9;
}

double __77__HKMHValenceDistributionSummary_initWithDayIndexRange_valenceDistributions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;

  v2 = a2;
  v3 = 0.0;
  if (objc_msgSend(v2, "reflectiveInterval") == 2)
    v3 = (double)objc_msgSend(v2, "sampleCount");

  return v3;
}

double __77__HKMHValenceDistributionSummary_initWithDayIndexRange_valenceDistributions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  double v3;

  v2 = a2;
  v3 = 0.0;
  if (objc_msgSend(v2, "reflectiveInterval") == 1)
    v3 = (double)objc_msgSend(v2, "sampleCount");

  return v3;
}

- (int64_t)totalSampleCount
{
  return self->_countMomentary + self->_countDaily;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[HKMHValenceDistributionSummary valenceDistributions](self, "valenceDistributions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valenceDistributions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToArray:", v7)
      && self->_countDaily == v5[3]
      && self->_countMomentary == v5[2]
      && self->_dayIndexRange.start == v5[4]
      && self->_dayIndexRange.duration == v5[5];

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int8x16_t v5;
  unint64_t v6;

  -[HKMHValenceDistributionSummary valenceDistributions](self, "valenceDistributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = veorq_s8(*(int8x16_t *)&self->_countMomentary, (int8x16_t)self->_dayIndexRange);
  v6 = *(_QWORD *)&veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)) ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)HKMHValenceDistributionSummary;
  -[HKMHValenceDistributionSummary description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[range:(%ld - %ld) distributions:%@]"), v4, self->_dayIndexRange.start, self->_dayIndexRange.duration + self->_dayIndexRange.start, self->_valenceDistributions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)hk_redactedDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMHValenceDistributionSummary;
  -[HKMHValenceDistributionSummary description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHValenceDistributionSummary)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  HKMHValenceDistributionSummary *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ValenceDistributions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("DayIndexRangeStart"));
  v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("DayIndexRangeDuration"));

  v11 = -[HKMHValenceDistributionSummary initWithDayIndexRange:valenceDistributions:](self, "initWithDayIndexRange:valenceDistributions:", v9, v10, v8);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *valenceDistributions;
  id v5;

  valenceDistributions = self->_valenceDistributions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", valenceDistributions, CFSTR("ValenceDistributions"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dayIndexRange.start, CFSTR("DayIndexRangeStart"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dayIndexRange.duration, CFSTR("DayIndexRangeDuration"));

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_dayIndexRange.duration;
  start = self->_dayIndexRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (NSArray)valenceDistributions
{
  return self->_valenceDistributions;
}

- (int64_t)countMomentary
{
  return self->_countMomentary;
}

- (int64_t)countDaily
{
  return self->_countDaily;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valenceDistributions, 0);
}

@end
