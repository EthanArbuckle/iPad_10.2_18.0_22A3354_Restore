@implementation HKStatistics

- (HKStatistics)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (void)_validateOptions:(unint64_t)a3 forDataType:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = v5;
  if (a3 != 0x10000000)
  {
    v8 = v5;
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3AD098))
    {
      v7 = v8;
      if ((objc_msgSend(v7, "supportsStatisticOptions:", a3) & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Statistics option is not compatible with statistic configuration providing data type %@"), v7);

      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpected data type %@ not permitted for non-presence options."), v8);
      goto LABEL_12;
    }
    v6 = v8;
    if (a3 != 0xFFFFFFFF80000000 && a3 != 64 && a3 != 0x40000000)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Statistics option is not compatible with non-quantity data type %@"), v8);
LABEL_12:
      v6 = v8;
    }
  }

}

- (HKStatistics)initWithDataType:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKStatistics *v12;
  HKStatistics *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKStatistics;
  v12 = -[HKStatistics init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataType, a3);
    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_endDate, a5);
  }

  return v13;
}

- (HKQuantity)averageQuantityForSource:(HKSource *)source
{
  NSDictionary *averageQuantityBySource;
  void *v4;
  void *v5;

  averageQuantityBySource = self->_averageQuantityBySource;
  -[HKSource bundleIdentifier](source, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](averageQuantityBySource, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (HKQuantity)minimumQuantityForSource:(HKSource *)source
{
  NSDictionary *minimumQuantityBySource;
  void *v4;
  void *v5;

  minimumQuantityBySource = self->_minimumQuantityBySource;
  -[HKSource bundleIdentifier](source, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](minimumQuantityBySource, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (HKQuantity)maximumQuantityForSource:(HKSource *)source
{
  NSDictionary *maximumQuantityBySource;
  void *v4;
  void *v5;

  maximumQuantityBySource = self->_maximumQuantityBySource;
  -[HKSource bundleIdentifier](source, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](maximumQuantityBySource, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (HKQuantity)mostRecentQuantityForSource:(HKSource *)source
{
  NSDictionary *mostRecentQuantityBySource;
  void *v4;
  void *v5;

  mostRecentQuantityBySource = self->_mostRecentQuantityBySource;
  -[HKSource bundleIdentifier](source, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](mostRecentQuantityBySource, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (NSDateInterval)mostRecentQuantityDateIntervalForSource:(HKSource *)source
{
  NSDictionary *mostRecentQuantityDateIntervalBySource;
  void *v4;
  void *v5;

  mostRecentQuantityDateIntervalBySource = self->_mostRecentQuantityDateIntervalBySource;
  -[HKSource bundleIdentifier](source, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](mostRecentQuantityDateIntervalBySource, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateInterval *)v5;
}

- (HKQuantity)sumQuantityForSource:(HKSource *)source
{
  NSDictionary *sumQuantityBySource;
  void *v4;
  void *v5;

  sumQuantityBySource = self->_sumQuantityBySource;
  -[HKSource bundleIdentifier](source, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sumQuantityBySource, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (HKQuantity)durationForSource:(HKSource *)source
{
  NSDictionary *durationBySource;
  void *v4;
  void *v5;

  durationBySource = self->_durationBySource;
  -[HKSource bundleIdentifier](source, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](durationBySource, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v5;
}

- (id)baselineRelativeValueState
{
  HKObjectType *v3;
  HKQuantity *minimumQuantity;
  HKQuantity *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  if (!self->_minimumQuantity && !self->_maximumQuantity)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v3 = self->_dataType;
  if (-[HKObjectType _supportsRelativeDataCalculation](v3, "_supportsRelativeDataCalculation"))
  {
    minimumQuantity = self->_minimumQuantity;
    if (!minimumQuantity)
      minimumQuantity = self->_maximumQuantity;
    v5 = minimumQuantity;
    -[HKObjectType _unitForChangeInCanonicalUnit](v3, "_unitForChangeInCanonicalUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantity doubleValueForUnit:](v5, "doubleValueForUnit:", v6);
    v8 = v7;

    v9 = &unk_1E3895260;
    if (v8 == 1.79769313e308)
      v9 = &unk_1E3895248;
    if (v8 == -1.79769313e308)
      v10 = &unk_1E3895230;
    else
      v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setAverageQuantity:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKStatistics quantityType](self, "quantityType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "aggregationStyle");

    if ((unint64_t)(v6 - 1) <= 2)
    {
      if (v8)
      {
        objc_msgSend(v8, "_unit");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKStatistics _validateUnit:](self, "_validateUnit:", v7);

      }
      objc_storeStrong((id *)&self->_averageQuantity, a3);
    }
  }

}

- (void)setMinimumQuantity:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKStatistics quantityType](self, "quantityType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "aggregationStyle");

    if ((unint64_t)(v6 - 1) <= 2)
    {
      if (v8)
      {
        objc_msgSend(v8, "_unit");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKStatistics _validateUnit:](self, "_validateUnit:", v7);

      }
      objc_storeStrong((id *)&self->_minimumQuantity, a3);
    }
  }

}

- (void)setMaximumQuantity:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKStatistics quantityType](self, "quantityType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "aggregationStyle");

    if ((unint64_t)(v6 - 1) <= 2)
    {
      if (v8)
      {
        objc_msgSend(v8, "_unit");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKStatistics _validateUnit:](self, "_validateUnit:", v7);

      }
      objc_storeStrong((id *)&self->_maximumQuantity, a3);
    }
  }

}

- (void)setMostRecentQuantity:(id)a3
{
  HKQuantity *v4;
  HKQuantity *v5;
  void *v6;
  HKQuantity *mostRecentQuantity;

  v4 = (HKQuantity *)a3;
  v5 = v4;
  if (v4)
  {
    -[HKQuantity _unit](v4, "_unit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics _validateUnit:](self, "_validateUnit:", v6);

  }
  mostRecentQuantity = self->_mostRecentQuantity;
  self->_mostRecentQuantity = v5;

}

- (void)setSumQuantity:(id)a3
{
  HKObjectType *v5;
  HKObjectType *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[HKObjectType conformsToProtocol:](self->_dataType, "conformsToProtocol:", &unk_1EE3AD098))
  {
    v5 = self->_dataType;
    v6 = v5;
    if (v5 && !-[HKObjectType aggregationStyleForStatistics](v5, "aggregationStyleForStatistics"))
    {
      if (v8)
      {
        objc_msgSend(v8, "_unit");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKStatistics _validateUnit:](self, "_validateUnit:", v7);

      }
      objc_storeStrong((id *)&self->_sumQuantity, a3);
    }
  }
  else
  {
    v6 = 0;
  }

}

- (void)_validateUnit:(id)a3
{
  id v4;

  v4 = a3;
  if (-[HKObjectType conformsToProtocol:](self->_dataType, "conformsToProtocol:", &unk_1EE3AD098))
    -[HKObjectType validateUnitForStatistic:](self->_dataType, "validateUnitForStatistic:", v4);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ %@ is not able to determine compatibility of unit %@"), objc_opt_class(), self->_dataType, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initAsCopyOf:", self);
}

- (id)_initAsCopyOf:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HKStatistics *v8;
  uint64_t v9;
  HKQuantity *averageQuantity;
  uint64_t v11;
  HKQuantity *minimumQuantity;
  uint64_t v13;
  HKQuantity *maximumQuantity;
  uint64_t v15;
  HKQuantity *mostRecentQuantity;
  uint64_t v17;
  NSDateInterval *mostRecentQuantityDateInterval;
  uint64_t v19;
  HKQuantity *sumQuantity;
  uint64_t v21;
  HKQuantity *duration;
  uint64_t v23;
  NSDictionary *averageQuantityBySource;
  uint64_t v25;
  NSDictionary *minimumQuantityBySource;
  uint64_t v27;
  NSDictionary *maximumQuantityBySource;
  uint64_t v29;
  NSDictionary *mostRecentQuantityBySource;
  uint64_t v31;
  NSDictionary *mostRecentQuantityDateIntervalBySource;
  uint64_t v33;
  NSDictionary *sumQuantityBySource;
  uint64_t v35;
  NSDictionary *dataCountBySource;
  uint64_t v37;
  NSDictionary *durationBySource;
  void *v39;
  uint64_t v40;
  NSArray *sources;

  v4 = a3;
  v5 = v4[1];
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKStatistics initWithDataType:startDate:endDate:](self, "initWithDataType:startDate:endDate:", v5, v6, v7);

  if (v8)
  {
    -[HKStatistics setDataCount:](v8, "setDataCount:", objc_msgSend(v4, "dataCount"));
    v8->_dataCount = objc_msgSend(v4, "dataCount");
    objc_msgSend(v4, "averageQuantity");
    v9 = objc_claimAutoreleasedReturnValue();
    averageQuantity = v8->_averageQuantity;
    v8->_averageQuantity = (HKQuantity *)v9;

    objc_msgSend(v4, "minimumQuantity");
    v11 = objc_claimAutoreleasedReturnValue();
    minimumQuantity = v8->_minimumQuantity;
    v8->_minimumQuantity = (HKQuantity *)v11;

    objc_msgSend(v4, "maximumQuantity");
    v13 = objc_claimAutoreleasedReturnValue();
    maximumQuantity = v8->_maximumQuantity;
    v8->_maximumQuantity = (HKQuantity *)v13;

    objc_msgSend(v4, "mostRecentQuantity");
    v15 = objc_claimAutoreleasedReturnValue();
    mostRecentQuantity = v8->_mostRecentQuantity;
    v8->_mostRecentQuantity = (HKQuantity *)v15;

    objc_msgSend(v4, "mostRecentQuantityDateInterval");
    v17 = objc_claimAutoreleasedReturnValue();
    mostRecentQuantityDateInterval = v8->_mostRecentQuantityDateInterval;
    v8->_mostRecentQuantityDateInterval = (NSDateInterval *)v17;

    objc_msgSend(v4, "sumQuantity");
    v19 = objc_claimAutoreleasedReturnValue();
    sumQuantity = v8->_sumQuantity;
    v8->_sumQuantity = (HKQuantity *)v19;

    objc_msgSend(v4, "duration");
    v21 = objc_claimAutoreleasedReturnValue();
    duration = v8->_duration;
    v8->_duration = (HKQuantity *)v21;

    objc_msgSend(v4, "averageQuantityBySource");
    v23 = objc_claimAutoreleasedReturnValue();
    averageQuantityBySource = v8->_averageQuantityBySource;
    v8->_averageQuantityBySource = (NSDictionary *)v23;

    objc_msgSend(v4, "minimumQuantityBySource");
    v25 = objc_claimAutoreleasedReturnValue();
    minimumQuantityBySource = v8->_minimumQuantityBySource;
    v8->_minimumQuantityBySource = (NSDictionary *)v25;

    objc_msgSend(v4, "maximumQuantityBySource");
    v27 = objc_claimAutoreleasedReturnValue();
    maximumQuantityBySource = v8->_maximumQuantityBySource;
    v8->_maximumQuantityBySource = (NSDictionary *)v27;

    objc_msgSend(v4, "mostRecentQuantityBySource");
    v29 = objc_claimAutoreleasedReturnValue();
    mostRecentQuantityBySource = v8->_mostRecentQuantityBySource;
    v8->_mostRecentQuantityBySource = (NSDictionary *)v29;

    objc_msgSend(v4, "mostRecentQuantityDateIntervalBySource");
    v31 = objc_claimAutoreleasedReturnValue();
    mostRecentQuantityDateIntervalBySource = v8->_mostRecentQuantityDateIntervalBySource;
    v8->_mostRecentQuantityDateIntervalBySource = (NSDictionary *)v31;

    objc_msgSend(v4, "sumQuantityBySource");
    v33 = objc_claimAutoreleasedReturnValue();
    sumQuantityBySource = v8->_sumQuantityBySource;
    v8->_sumQuantityBySource = (NSDictionary *)v33;

    objc_msgSend(v4, "dataCountBySource");
    v35 = objc_claimAutoreleasedReturnValue();
    dataCountBySource = v8->_dataCountBySource;
    v8->_dataCountBySource = (NSDictionary *)v35;

    objc_msgSend(v4, "durationBySource");
    v37 = objc_claimAutoreleasedReturnValue();
    durationBySource = v8->_durationBySource;
    v8->_durationBySource = (NSDictionary *)v37;

    objc_msgSend(v4, "sources");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    sources = v8->_sources;
    v8->_sources = (NSArray *)v40;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKObjectType *dataType;
  id v5;

  dataType = self->_dataType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dataType, CFSTR("dataType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dataCount, CFSTR("dataCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sources, CFSTR("sources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageQuantity, CFSTR("average"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumQuantity, CFSTR("min"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximumQuantity, CFSTR("max"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostRecentQuantity, CFSTR("mostRecent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostRecentQuantityDateInterval, CFSTR("mostRecentDateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sumQuantity, CFSTR("sum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_duration, CFSTR("duration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageQuantityBySource, CFSTR("averageBySource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumQuantityBySource, CFSTR("minBySource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximumQuantityBySource, CFSTR("maxBySource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostRecentQuantityBySource, CFSTR("mostRecentBySource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostRecentQuantityDateIntervalBySource, CFSTR("mostRecentDateIntervalBySource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sumQuantityBySource, CFSTR("sumBySource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataCountBySource, CFSTR("countBySource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_durationBySource, CFSTR("durationBySource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryValue, CFSTR("categoryValueKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryValueBySource, CFSTR("categoryValueBySourceKey"));

}

- (HKStatistics)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKStatistics *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *sources;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKStatistics initWithDataType:startDate:endDate:](self, "initWithDataType:startDate:endDate:", v5, v6, v7);
  if (v8)
  {
    v8->_dataCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dataCount"));
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v36 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("sources"));
    v11 = objc_claimAutoreleasedReturnValue();
    sources = v8->_sources;
    v8->_sources = (NSArray *)v11;

    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("average"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setAverageQuantity:](v8, "setAverageQuantity:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("min"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setMinimumQuantity:](v8, "setMinimumQuantity:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("max"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setMaximumQuantity:](v8, "setMaximumQuantity:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("mostRecent"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setMostRecentQuantity:](v8, "setMostRecentQuantity:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, CFSTR("mostRecentDateInterval"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setMostRecentQuantityDateInterval:](v8, "setMostRecentQuantityDateInterval:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("sum"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setSumQuantity:](v8, "setSumQuantity:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("duration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setDuration:](v8, "setDuration:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("categoryValueKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setCategoryValue:](v8, "setCategoryValue:", v24);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), v15, v16, v13, v14, 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("averageBySource"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setAverageQuantityBySource:](v8, "setAverageQuantityBySource:", v26);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("minBySource"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setMinimumQuantityBySource:](v8, "setMinimumQuantityBySource:", v27);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("maxBySource"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setMaximumQuantityBySource:](v8, "setMaximumQuantityBySource:", v28);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("mostRecentBySource"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setMostRecentQuantityBySource:](v8, "setMostRecentQuantityBySource:", v29);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("mostRecentDateIntervalBySource"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setMostRecentQuantityDateIntervalBySource:](v8, "setMostRecentQuantityDateIntervalBySource:", v30);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("sumBySource"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setSumQuantityBySource:](v8, "setSumQuantityBySource:", v31);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("countBySource"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setDataCountBySource:](v8, "setDataCountBySource:", v32);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("durationBySource"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setDurationBySource:](v8, "setDurationBySource:", v33);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("categoryValueBySourceKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStatistics setCategoryValueBySource:](v8, "setCategoryValueBySource:", v34);

  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[HKObjectType hash](self->_dataType, "hash");
  v4 = -[NSDate hash](self->_startDate, "hash") ^ v3;
  return v4 ^ -[NSDate hash](self->_endDate, "hash") ^ (2654435761u * self->_dataCount);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKQuantity *averageQuantity;
  HKQuantity *v6;
  HKQuantity *minimumQuantity;
  HKQuantity *v8;
  HKQuantity *maximumQuantity;
  HKQuantity *v10;
  HKQuantity *mostRecentQuantity;
  HKQuantity *v12;
  NSDateInterval *mostRecentQuantityDateInterval;
  NSDateInterval *v14;
  HKQuantity *sumQuantity;
  HKQuantity *v16;
  HKQuantity *duration;
  HKQuantity *v18;
  NSArray *sources;
  NSArray *v20;
  NSDictionary *dataCountBySource;
  NSDictionary *v22;
  NSDictionary *averageQuantityBySource;
  NSDictionary *v24;
  NSDictionary *minimumQuantityBySource;
  NSDictionary *v26;
  NSDictionary *maximumQuantityBySource;
  NSDictionary *v28;
  NSDictionary *mostRecentQuantityBySource;
  NSDictionary *v30;
  NSDictionary *mostRecentQuantityDateIntervalBySource;
  NSDictionary *v32;
  NSDictionary *sumQuantityBySource;
  NSDictionary *v34;
  NSDictionary *durationBySource;
  NSDictionary *v36;
  NSNumber *categoryValue;
  NSNumber *v38;
  NSDictionary *categoryValueBySource;
  NSDictionary *v40;
  char v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_60;
  if (!-[HKObjectType isEqual:](self->_dataType, "isEqual:", v4[1]))
    goto LABEL_60;
  if (!-[NSDate isEqual:](self->_startDate, "isEqual:", v4[2]))
    goto LABEL_60;
  if (!-[NSDate isEqual:](self->_endDate, "isEqual:", v4[3]))
    goto LABEL_60;
  if (self->_dataCount != v4[7])
    goto LABEL_60;
  averageQuantity = self->_averageQuantity;
  v6 = (HKQuantity *)v4[8];
  if (averageQuantity != v6 && (!v6 || !-[HKQuantity isEqual:](averageQuantity, "isEqual:")))
    goto LABEL_60;
  minimumQuantity = self->_minimumQuantity;
  v8 = (HKQuantity *)v4[9];
  if (minimumQuantity != v8 && (!v8 || !-[HKQuantity isEqual:](minimumQuantity, "isEqual:")))
    goto LABEL_60;
  maximumQuantity = self->_maximumQuantity;
  v10 = (HKQuantity *)v4[10];
  if (maximumQuantity != v10 && (!v10 || !-[HKQuantity isEqual:](maximumQuantity, "isEqual:")))
    goto LABEL_60;
  mostRecentQuantity = self->_mostRecentQuantity;
  v12 = (HKQuantity *)v4[11];
  if (mostRecentQuantity != v12 && (!v12 || !-[HKQuantity isEqual:](mostRecentQuantity, "isEqual:")))
    goto LABEL_60;
  mostRecentQuantityDateInterval = self->_mostRecentQuantityDateInterval;
  v14 = (NSDateInterval *)v4[12];
  if (mostRecentQuantityDateInterval != v14
    && (!v14 || !-[NSDateInterval isEqual:](mostRecentQuantityDateInterval, "isEqual:")))
  {
    goto LABEL_60;
  }
  sumQuantity = self->_sumQuantity;
  v16 = (HKQuantity *)v4[23];
  if (sumQuantity != v16 && (!v16 || !-[HKQuantity isEqual:](sumQuantity, "isEqual:")))
    goto LABEL_60;
  duration = self->_duration;
  v18 = (HKQuantity *)v4[13];
  if (duration != v18 && (!v18 || !-[HKQuantity isEqual:](duration, "isEqual:")))
    goto LABEL_60;
  sources = self->_sources;
  v20 = (NSArray *)v4[4];
  if (sources != v20 && (!v20 || !-[NSArray isEqual:](sources, "isEqual:")))
    goto LABEL_60;
  dataCountBySource = self->_dataCountBySource;
  v22 = (NSDictionary *)v4[20];
  if (dataCountBySource != v22 && (!v22 || !-[NSDictionary isEqual:](dataCountBySource, "isEqual:")))
    goto LABEL_60;
  averageQuantityBySource = self->_averageQuantityBySource;
  v24 = (NSDictionary *)v4[15];
  if (averageQuantityBySource != v24
    && (!v24 || !-[NSDictionary isEqual:](averageQuantityBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  minimumQuantityBySource = self->_minimumQuantityBySource;
  v26 = (NSDictionary *)v4[16];
  if (minimumQuantityBySource != v26
    && (!v26 || !-[NSDictionary isEqual:](minimumQuantityBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  maximumQuantityBySource = self->_maximumQuantityBySource;
  v28 = (NSDictionary *)v4[17];
  if (maximumQuantityBySource != v28
    && (!v28 || !-[NSDictionary isEqual:](maximumQuantityBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  mostRecentQuantityBySource = self->_mostRecentQuantityBySource;
  v30 = (NSDictionary *)v4[18];
  if (mostRecentQuantityBySource != v30
    && (!v30 || !-[NSDictionary isEqual:](mostRecentQuantityBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  mostRecentQuantityDateIntervalBySource = self->_mostRecentQuantityDateIntervalBySource;
  v32 = (NSDictionary *)v4[19];
  if (mostRecentQuantityDateIntervalBySource != v32
    && (!v32 || !-[NSDictionary isEqual:](mostRecentQuantityDateIntervalBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  sumQuantityBySource = self->_sumQuantityBySource;
  v34 = (NSDictionary *)v4[24];
  if (sumQuantityBySource != v34 && (!v34 || !-[NSDictionary isEqual:](sumQuantityBySource, "isEqual:")))
    goto LABEL_60;
  durationBySource = self->_durationBySource;
  v36 = (NSDictionary *)v4[21];
  if (durationBySource != v36 && (!v36 || !-[NSDictionary isEqual:](durationBySource, "isEqual:")))
    goto LABEL_60;
  categoryValue = self->_categoryValue;
  v38 = (NSNumber *)v4[5];
  if (categoryValue != v38 && (!v38 || !-[NSNumber isEqual:](categoryValue, "isEqual:")))
    goto LABEL_60;
  categoryValueBySource = self->_categoryValueBySource;
  v40 = (NSDictionary *)v4[6];
  if (categoryValueBySource == v40)
  {
    v41 = 1;
    goto LABEL_61;
  }
  if (v40)
    v41 = -[NSDictionary isEqual:](categoryValueBySource, "isEqual:");
  else
LABEL_60:
    v41 = 0;
LABEL_61:

  return v41;
}

- (HKQuantityType)quantityType
{
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStatistics.m"), 441, CFSTR("Data type is not a quantity"));

  }
  return (HKQuantityType *)self->_dataType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)_setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)_setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)_setSources:(id)a3
{
  NSArray *v4;
  NSArray *sources;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  sources = self->_sources;
  self->_sources = v4;

}

- (BOOL)getData:(id *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  NSObject *v9;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HKStatistics getData:error:].cold.1((uint64_t)self, (uint64_t *)a4, v9);

  }
  return v8 != 0;
}

- (int64_t)bucketIndexForIntervalComponents:(id)a3 anchorDate:(id)a4
{
  return objc_msgSend(a3, "hk_indexForDate:anchorDate:", self->_startDate, a4);
}

- (NSString)description
{
  id v3;
  void *v4;
  NSDate *endDate;
  void *v6;
  void *v7;
  __int128 v9;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)HKStatistics;
  -[HKStatistics description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&self->_dataType;
  endDate = self->_endDate;
  -[NSArray componentsJoinedByString:](self->_sources, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ Statistics on %@ (%@ - %@) over sources (%@)>"), v4, v9, endDate, v6);

  return (NSString *)v7;
}

- (NSNumber)categoryValue
{
  return self->_categoryValue;
}

- (void)setCategoryValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)categoryValueBySource
{
  return self->_categoryValueBySource;
}

- (void)setCategoryValueBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)dataCount
{
  return self->_dataCount;
}

- (void)setDataCount:(unint64_t)a3
{
  self->_dataCount = a3;
}

- (HKQuantity)averageQuantity
{
  return self->_averageQuantity;
}

- (HKQuantity)minimumQuantity
{
  return self->_minimumQuantity;
}

- (HKQuantity)maximumQuantity
{
  return self->_maximumQuantity;
}

- (HKQuantity)mostRecentQuantity
{
  return self->_mostRecentQuantity;
}

- (NSDateInterval)mostRecentQuantityDateInterval
{
  return self->_mostRecentQuantityDateInterval;
}

- (void)setMostRecentQuantityDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (HKQuantity)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (HKQuantity)percentileQuantity
{
  return self->_percentileQuantity;
}

- (void)setPercentileQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)averageQuantityBySource
{
  return self->_averageQuantityBySource;
}

- (void)setAverageQuantityBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)minimumQuantityBySource
{
  return self->_minimumQuantityBySource;
}

- (void)setMinimumQuantityBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)maximumQuantityBySource
{
  return self->_maximumQuantityBySource;
}

- (void)setMaximumQuantityBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDictionary)mostRecentQuantityBySource
{
  return self->_mostRecentQuantityBySource;
}

- (void)setMostRecentQuantityBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDictionary)mostRecentQuantityDateIntervalBySource
{
  return self->_mostRecentQuantityDateIntervalBySource;
}

- (void)setMostRecentQuantityDateIntervalBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDictionary)dataCountBySource
{
  return self->_dataCountBySource;
}

- (void)setDataCountBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDictionary)durationBySource
{
  return self->_durationBySource;
}

- (void)setDurationBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDictionary)percentileQuantityBySource
{
  return self->_percentileQuantityBySource;
}

- (void)setPercentileQuantityBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (HKQuantity)sumQuantity
{
  return self->_sumQuantity;
}

- (NSDictionary)sumQuantityBySource
{
  return self->_sumQuantityBySource;
}

- (void)setSumQuantityBySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDictionary)sumQuantityBySourceID
{
  return self->_sumQuantityBySourceID;
}

- (void)setSumQuantityBySourceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sumQuantityBySourceID, 0);
  objc_storeStrong((id *)&self->_sumQuantityBySource, 0);
  objc_storeStrong((id *)&self->_sumQuantity, 0);
  objc_storeStrong((id *)&self->_percentileQuantityBySource, 0);
  objc_storeStrong((id *)&self->_durationBySource, 0);
  objc_storeStrong((id *)&self->_dataCountBySource, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantityDateIntervalBySource, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantityBySource, 0);
  objc_storeStrong((id *)&self->_maximumQuantityBySource, 0);
  objc_storeStrong((id *)&self->_minimumQuantityBySource, 0);
  objc_storeStrong((id *)&self->_averageQuantityBySource, 0);
  objc_storeStrong((id *)&self->_percentileQuantity, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantityDateInterval, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantity, 0);
  objc_storeStrong((id *)&self->_maximumQuantity, 0);
  objc_storeStrong((id *)&self->_minimumQuantity, 0);
  objc_storeStrong((id *)&self->_averageQuantity, 0);
  objc_storeStrong((id *)&self->_categoryValueBySource, 0);
  objc_storeStrong((id *)&self->_categoryValue, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dataType, 0);
}

- (id)asJSONObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HKStatistics averageQuantity](self, "averageQuantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStatistics quantityType](self, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asJSONObjectForUnit:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("averageQuantity"));

  -[HKStatistics minimumQuantity](self, "minimumQuantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStatistics quantityType](self, "quantityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "canonicalUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asJSONObjectForUnit:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("minimumQuantity"));

  -[HKStatistics maximumQuantity](self, "maximumQuantity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStatistics quantityType](self, "quantityType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "canonicalUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "asJSONObjectForUnit:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("maximumQuantity"));

  -[HKStatistics mostRecentQuantity](self, "mostRecentQuantity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStatistics quantityType](self, "quantityType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "canonicalUnit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "asJSONObjectForUnit:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("mostRecentQuantity"));

  return v3;
}

- (void)getData:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Error getting archived data from statistics %@: %@", (uint8_t *)&v4, 0x16u);
}

@end
