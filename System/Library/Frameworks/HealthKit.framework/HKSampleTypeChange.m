@implementation HKSampleTypeChange

- (id)_initWithSampleType:(id)a3 startTime:(double)a4 endTime:(double)a5 hasUnfrozenSeries:(BOOL)a6 queryStrategy:(int64_t)a7
{
  id v13;
  HKSampleTypeChange *v14;
  uint64_t v15;
  HKSampleType *sampleType;
  void *v18;
  objc_super v19;

  v13 = a3;
  if (a4 > a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKDatabaseChangesQuery.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startTime <= endTime"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HKSampleTypeChange;
  v14 = -[HKSampleTypeChange init](&v19, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    sampleType = v14->_sampleType;
    v14->_sampleType = (HKSampleType *)v15;

    v14->_startTime = a4;
    v14->_endTime = a5;
    v14->_hasUnfrozenSeries = a6;
    v14->_queryStrategy = a7;
  }

  return v14;
}

+ (id)sampleTypeChangeWithSampleType:(id)a3 dateInterval:(id)a4 hasUnfrozenSeries:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc((Class)a1);
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v9, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(v9, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = (void *)objc_msgSend(v11, "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v8, v5, 0, v14, v16);

  }
  else
  {
    v17 = (void *)objc_msgSend(v10, "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v8, v5, 0, -1.79769313e308, -1.79769313e308);
  }

  return v17;
}

- (NSDateInterval)dateInterval
{
  void *v3;
  id v4;
  void *v5;

  if (self->_startTime == -1.79769313e308 && self->_endTime == -1.79769313e308)
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3588]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", self->_startTime);
    v3 = (void *)objc_msgSend(v4, "initWithStartDate:duration:", v5, self->_endTime - self->_startTime);

  }
  return (NSDateInterval *)v3;
}

- (void)_extendDateIntervalWithSample:(id)a3
{
  double startTime;
  double v5;
  double v6;
  double endTime;
  double v8;
  id v10;

  v10 = a3;
  startTime = self->_startTime;
  objc_msgSend(v10, "_startTimestamp");
  if (startTime >= v5)
    v6 = v5;
  else
    v6 = startTime;
  if (startTime != -1.79769313e308)
    v5 = v6;
  self->_startTime = v5;
  endTime = self->_endTime;
  objc_msgSend(v10, "_endTimestamp");
  if (endTime >= v8 && endTime != -1.79769313e308)
    v8 = endTime;
  self->_endTime = v8;

}

- (NSString)hk_redactedDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKSampleTypeChange dateInterval](self, "dateInterval");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E37FD4C0;
  if (v5)
    v7 = (const __CFString *)v5;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  HKSampleType *sampleType;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  sampleType = self->_sampleType;
  -[HKSampleTypeChange dateInterval](self, "dateInterval");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E37FD4C0;
  if (v6)
    v8 = (const __CFString *)v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@>"), v4, self, sampleType, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HKSampleTypeChange *v4;
  HKSampleTypeChange *v5;
  HKSampleType *sampleType;
  HKSampleType *v7;
  BOOL v8;

  v4 = (HKSampleTypeChange *)a3;
  v5 = v4;
  if (v4 == self)
    v8 = 1;
  else
    v8 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ((sampleType = self->_sampleType, v7 = v5->_sampleType, sampleType == v7)
       || v7 && -[HKObjectType isEqual:](sampleType, "isEqual:"))
      && self->_startTime == v5->_startTime
      && self->_endTime == v5->_endTime
      && self->_queryStrategy == v5->_queryStrategy;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSampleTypeChange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  HKSampleTypeChange *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sampleType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("start"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("end"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("unfrozen"));
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("strategy"));

  v12 = -[HKSampleTypeChange _initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:](self, "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v5, v10, v11, v7, v9);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  HKSampleType *sampleType;
  id v5;

  sampleType = self->_sampleType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sampleType, CFSTR("sampleType"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("start"), self->_startTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("end"), self->_endTime);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasUnfrozenSeries, CFSTR("unfrozen"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_queryStrategy, CFSTR("strategy"));

}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (BOOL)hasUnfrozenSeries
{
  return self->_hasUnfrozenSeries;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)queryStrategy
{
  return self->_queryStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleType, 0);
}

@end
