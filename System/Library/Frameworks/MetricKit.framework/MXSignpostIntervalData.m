@implementation MXSignpostIntervalData

- (MXSignpostIntervalData)initWithHistogramDurationData:(id)a3 withCumulativeCPUTime:(id)a4 withAverageMemory:(id)a5 withCumulativeLogicalWrites:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MXSignpostIntervalData *v14;
  MXHistogram *v15;
  MXHistogram *histogrammedSignpostDuration;
  NSMeasurementFormatter *v17;
  NSMeasurementFormatter *measurementFormatter;
  void *v19;
  void *v20;
  MXSignpostIntervalData *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MXSignpostIntervalData;
  v14 = -[MXSignpostIntervalData init](&v23, sel_init);
  if (v14)
  {
    if (!v10)
    {
      v21 = 0;
      goto LABEL_6;
    }
    v15 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v10);
    histogrammedSignpostDuration = v14->_histogrammedSignpostDuration;
    v14->_histogrammedSignpostDuration = v15;

    objc_storeStrong((id *)&v14->_cumulativeCPUTime, a4);
    objc_storeStrong((id *)&v14->_averageMemory, a5);
    objc_storeStrong((id *)&v14->_cumulativeLogicalWrites, a6);
    v17 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    measurementFormatter = v14->_measurementFormatter;
    v14->_measurementFormatter = v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v14->_measurementFormatter, "setLocale:", v19);

    -[NSMeasurementFormatter setUnitOptions:](v14->_measurementFormatter, "setUnitOptions:", 1);
    -[NSMeasurementFormatter setUnitStyle:](v14->_measurementFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v14->_measurementFormatter, "numberFormatter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMaximumFractionDigits:", 0);

  }
  v21 = v14;
LABEL_6:

  return v21;
}

- (MXSignpostIntervalData)initWithHistogramDurationData:(id)a3 withCumulativeCPUTime:(id)a4 withAverageMemory:(id)a5 withCumulativeLogicalWrites:(id)a6 withCumulativeHitchTimeRatio:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MXSignpostIntervalData *v17;
  MXSignpostIntervalData *v18;
  MXSignpostIntervalData *v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MXSignpostIntervalData;
  v17 = -[MXSignpostIntervalData init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    if (!v12)
    {
      v19 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v17->_cumulativeHitchTimeRatio, a7);
  }
  v18 = -[MXSignpostIntervalData initWithHistogramDurationData:withCumulativeCPUTime:withAverageMemory:withCumulativeLogicalWrites:](v18, "initWithHistogramDurationData:withCumulativeCPUTime:withAverageMemory:withCumulativeLogicalWrites:", v12, v13, v14, v15);
  v19 = v18;
LABEL_6:

  return v19;
}

- (MXSignpostIntervalData)initWithHistogramDurationData:(id)a3 withCumulativeCPUTime:(id)a4 withPeakMemory:(id)a5 withAverageMemory:(id)a6 withCumulativeLogicalWrites:(id)a7
{
  return -[MXSignpostIntervalData initWithHistogramDurationData:withCumulativeCPUTime:withAverageMemory:withCumulativeLogicalWrites:](self, "initWithHistogramDurationData:withCumulativeCPUTime:withAverageMemory:withCumulativeLogicalWrites:", a3, a4, a6, a7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MXHistogram *histogrammedSignpostDuration;
  id v5;

  histogrammedSignpostDuration = self->_histogrammedSignpostDuration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", histogrammedSignpostDuration, CFSTR("histogrammedSignpostDurations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeCPUTime, CFSTR("signpostCumulativeCPUTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageMemory, CFSTR("signpostAverageMemory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeLogicalWrites, CFSTR("signpostCumulativeLogicalWrites"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeHitchTimeRatio, CFSTR("signpostCumulativeHitchTimeRatio"));

}

- (MXSignpostIntervalData)initWithCoder:(id)a3
{
  id v4;
  MXSignpostIntervalData *v5;
  uint64_t v6;
  NSMeasurement *cumulativeCPUTime;
  uint64_t v8;
  MXAverage *averageMemory;
  uint64_t v10;
  NSMeasurement *cumulativeLogicalWrites;
  uint64_t v12;
  MXHistogram *histogrammedSignpostDuration;
  uint64_t v14;
  NSMeasurement *cumulativeHitchTimeRatio;
  NSMeasurementFormatter *v16;
  NSMeasurementFormatter *measurementFormatter;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MXSignpostIntervalData;
  v5 = -[MXSignpostIntervalData init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostCumulativeCPUTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    cumulativeCPUTime = v5->_cumulativeCPUTime;
    v5->_cumulativeCPUTime = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostAverageMemory"));
    v8 = objc_claimAutoreleasedReturnValue();
    averageMemory = v5->_averageMemory;
    v5->_averageMemory = (MXAverage *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostCumulativeLogicalWrites"));
    v10 = objc_claimAutoreleasedReturnValue();
    cumulativeLogicalWrites = v5->_cumulativeLogicalWrites;
    v5->_cumulativeLogicalWrites = (NSMeasurement *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogrammedSignpostDurations"));
    v12 = objc_claimAutoreleasedReturnValue();
    histogrammedSignpostDuration = v5->_histogrammedSignpostDuration;
    v5->_histogrammedSignpostDuration = (MXHistogram *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostCumulativeHitchTimeRatio"));
    v14 = objc_claimAutoreleasedReturnValue();
    cumulativeHitchTimeRatio = v5->_cumulativeHitchTimeRatio;
    v5->_cumulativeHitchTimeRatio = (NSMeasurement *)v14;

    v16 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    measurementFormatter = v5->_measurementFormatter;
    v5->_measurementFormatter = v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v5->_measurementFormatter, "setLocale:", v18);

    -[NSMeasurementFormatter setUnitOptions:](v5->_measurementFormatter, "setUnitOptions:", 1);
    -[NSMeasurementFormatter setUnitStyle:](v5->_measurementFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v5->_measurementFormatter, "numberFormatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMaximumFractionDigits:", 0);

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  MXHistogram *histogrammedSignpostDuration;
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  histogrammedSignpostDuration = self->_histogrammedSignpostDuration;
  if (histogrammedSignpostDuration)
  {
    -[MXHistogram toDictionary](histogrammedSignpostDuration, "toDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("histogrammedSignpostDurations"));

  }
  if (self->_cumulativeCPUTime)
  {
    -[MXSignpostIntervalData measurementFormatter](self, "measurementFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromMeasurement:", self->_cumulativeCPUTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("signpostCumulativeCPUTime"));

  }
  if (self->_averageMemory)
  {
    -[MXSignpostIntervalData measurementFormatter](self, "measurementFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXAverage averageMeasurement](self->_averageMemory, "averageMeasurement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromMeasurement:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("signpostAverageMemory"));

  }
  if (self->_cumulativeLogicalWrites)
  {
    -[MXSignpostIntervalData measurementFormatter](self, "measurementFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromMeasurement:", self->_cumulativeLogicalWrites);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("signpostCumulativeLogicalWrites"));

  }
  if (self->_cumulativeHitchTimeRatio)
  {
    -[MXSignpostIntervalData measurementFormatter](self, "measurementFormatter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromMeasurement:", self->_cumulativeHitchTimeRatio);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("signpostCumulativeHitchTimeRatio"));

  }
  return v3;
}

- (MXHistogram)histogrammedSignpostDuration
{
  return (MXHistogram *)objc_getProperty(self, a2, 8, 1);
}

- (NSMeasurement)cumulativeCPUTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (MXAverage)averageMemory
{
  return (MXAverage *)objc_getProperty(self, a2, 24, 1);
}

- (NSMeasurement)cumulativeLogicalWrites
{
  return (NSMeasurement *)objc_getProperty(self, a2, 32, 1);
}

- (NSMeasurement)cumulativeHitchTimeRatio
{
  return (NSMeasurement *)objc_getProperty(self, a2, 40, 1);
}

- (NSMeasurementFormatter)measurementFormatter
{
  return (NSMeasurementFormatter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMeasurementFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_storeStrong((id *)&self->_cumulativeHitchTimeRatio, 0);
  objc_storeStrong((id *)&self->_cumulativeLogicalWrites, 0);
  objc_storeStrong((id *)&self->_averageMemory, 0);
  objc_storeStrong((id *)&self->_cumulativeCPUTime, 0);
  objc_storeStrong((id *)&self->_histogrammedSignpostDuration, 0);
}

@end
