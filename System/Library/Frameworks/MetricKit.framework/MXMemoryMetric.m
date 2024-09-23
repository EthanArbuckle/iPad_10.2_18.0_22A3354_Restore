@implementation MXMemoryMetric

- (MXMemoryMetric)initWithPeakMemoryUsageMeasurement:(id)a3 averageMemoryUsageMeasurement:(id)a4
{
  id v7;
  id v8;
  MXMemoryMetric *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  MXMemoryMetric *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MXMemoryMetric;
  v9 = -[MXMetric init](&v16, sel_init);
  if (!v9)
    goto LABEL_6;
  objc_msgSend(v7, "doubleValue");
  if (v10 >= 0.0)
  {
    objc_msgSend(v8, "averageMeasurement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    if (v13 >= 0.0)
    {
      objc_storeStrong((id *)&v9->_peakMemoryUsage, a3);
      objc_storeStrong((id *)&v9->_averageSuspendedMemory, a4);
LABEL_6:
      v14 = v9;
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMeasurement *peakMemoryUsage;
  id v5;

  peakMemoryUsage = self->_peakMemoryUsage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", peakMemoryUsage, CFSTR("peakMemoryUsage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageSuspendedMemory, CFSTR("averageSuspendedMemory"));

}

- (MXMemoryMetric)initWithCoder:(id)a3
{
  id v4;
  MXMemoryMetric *v5;
  uint64_t v6;
  NSMeasurement *peakMemoryUsage;
  uint64_t v8;
  MXAverage *averageSuspendedMemory;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXMemoryMetric;
  v5 = -[MXMetric init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peakMemoryUsage"));
    v6 = objc_claimAutoreleasedReturnValue();
    peakMemoryUsage = v5->_peakMemoryUsage;
    v5->_peakMemoryUsage = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageSuspendedMemory"));
    v8 = objc_claimAutoreleasedReturnValue();
    averageSuspendedMemory = v5->_averageSuspendedMemory;
    v5->_averageSuspendedMemory = (MXAverage *)v8;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  void *v5;
  MXAverage *averageSuspendedMemory;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_peakMemoryUsage)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromMeasurement:", self->_peakMemoryUsage);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("peakMemoryUsage"));

  }
  averageSuspendedMemory = self->_averageSuspendedMemory;
  if (averageSuspendedMemory)
  {
    -[MXAverage toDictionary](averageSuspendedMemory, "toDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("averageSuspendedMemory"));

  }
  return v3;
}

- (NSMeasurement)peakMemoryUsage
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (MXAverage)averageSuspendedMemory
{
  return (MXAverage *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageSuspendedMemory, 0);
  objc_storeStrong((id *)&self->_peakMemoryUsage, 0);
}

@end
