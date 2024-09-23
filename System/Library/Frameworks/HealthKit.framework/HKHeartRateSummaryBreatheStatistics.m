@implementation HKHeartRateSummaryBreatheStatistics

- (id)initFromStatistics:(id)a3
{
  id *v4;
  id *v5;
  id *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryBreatheStatistics;
  v5 = -[HKHeartRateSummaryStatistics initFromStatistics:](&v8, sel_initFromStatistics_, v4);
  v6 = v5;
  if (v5)
    objc_storeStrong(v5 + 7, v4[7]);

  return v6;
}

- (void)_setFinalReading:(id)a3
{
  objc_storeStrong((id *)&self->_finalReading, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKHeartRateSummaryBreatheStatistics;
  v4 = a3;
  -[HKHeartRateSummaryStatistics encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_finalReading, CFSTR("FinalReading"), v5.receiver, v5.super_class);

}

- (HKHeartRateSummaryBreatheStatistics)initWithCoder:(id)a3
{
  id v4;
  HKHeartRateSummaryBreatheStatistics *v5;
  uint64_t v6;
  HKHeartRateSummaryReading *finalReading;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHeartRateSummaryBreatheStatistics;
  v5 = -[HKHeartRateSummaryStatistics initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FinalReading"));
    v6 = objc_claimAutoreleasedReturnValue();
    finalReading = v5->_finalReading;
    v5->_finalReading = (HKHeartRateSummaryReading *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryStatistics sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryStatistics dateInterval](self, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryStatistics dateInterval](self, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHeartRateSummaryBreatheStatistics finalReading](self, "finalReading");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p count:%@ session:%@ (%@ - %@) finalReading:%@>"), v4, self, v5, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HKHeartRateSummaryBreatheStatistics *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = (HKHeartRateSummaryBreatheStatistics *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v12.receiver = self,
          v12.super_class = (Class)HKHeartRateSummaryBreatheStatistics,
          -[HKHeartRateSummaryStatistics isEqual:](&v12, sel_isEqual_, v4)))
    {
      -[HKHeartRateSummaryBreatheStatistics finalReading](self, "finalReading");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHeartRateSummaryBreatheStatistics finalReading](v4, "finalReading");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        v10 = 1;
      }
      else
      {
        -[HKHeartRateSummaryBreatheStatistics finalReading](v4, "finalReading");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          -[HKHeartRateSummaryBreatheStatistics finalReading](self, "finalReading");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummaryBreatheStatistics finalReading](v4, "finalReading");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "isEqual:", v9);

        }
        else
        {
          v10 = 0;
        }

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKHeartRateSummaryBreatheStatistics;
  v3 = -[HKHeartRateSummaryStatistics hash](&v7, sel_hash);
  -[HKHeartRateSummaryBreatheStatistics finalReading](self, "finalReading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (HKHeartRateSummaryReading)finalReading
{
  return self->_finalReading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalReading, 0);
}

@end
