@implementation MXAverage

- (MXAverage)initWithDoubleValue:(double)a3 sampleCount:(int64_t)a4 standardDeviation:(double)a5 unit:(id)a6
{
  id v10;
  MXAverage *v11;
  uint64_t v12;
  NSMeasurement *averageMeasurement;
  NSMeasurementFormatter *v14;
  NSMeasurementFormatter *averageMeasurementFormatter;
  void *v16;
  void *v17;
  objc_super v19;

  v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MXAverage;
  v11 = -[MXAverage init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1660]), "initWithDoubleValue:unit:", v10, a3);
    averageMeasurement = v11->_averageMeasurement;
    v11->_averageMeasurement = (NSMeasurement *)v12;

    v11->_sampleCount = a4;
    v11->_standardDeviation = a5;
    v14 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    averageMeasurementFormatter = v11->_averageMeasurementFormatter;
    v11->_averageMeasurementFormatter = v14;

    -[NSMeasurementFormatter setUnitOptions:](v11->_averageMeasurementFormatter, "setUnitOptions:", 1);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v11->_averageMeasurementFormatter, "setLocale:", v16);

    -[NSMeasurementFormatter setUnitStyle:](v11->_averageMeasurementFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v11->_averageMeasurementFormatter, "numberFormatter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMaximumFractionDigits:", 0);

  }
  return v11;
}

- (MXAverage)initWithMeasurement:(id)a3 sampleCount:(int64_t)a4 standardDeviation:(double)a5
{
  id v9;
  MXAverage *v10;
  MXAverage *v11;
  NSMeasurementFormatter *v12;
  NSMeasurementFormatter *averageMeasurementFormatter;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MXAverage;
  v10 = -[MXAverage init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_averageMeasurement, a3);
    v11->_sampleCount = a4;
    v11->_standardDeviation = a5;
    v12 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    averageMeasurementFormatter = v11->_averageMeasurementFormatter;
    v11->_averageMeasurementFormatter = v12;

    -[NSMeasurementFormatter setUnitOptions:](v11->_averageMeasurementFormatter, "setUnitOptions:", 1);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v11->_averageMeasurementFormatter, "setLocale:", v14);

    -[NSMeasurementFormatter setUnitStyle:](v11->_averageMeasurementFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v11->_averageMeasurementFormatter, "numberFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMaximumFractionDigits:", 0);

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("NSMeasurement cannot be encoded by non-keyed archivers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_averageMeasurement, CFSTR("averageValue"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_sampleCount, CFSTR("sampleCount"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("standardDeviation"), self->_standardDeviation);

}

- (MXAverage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  MXAverage *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sampleCount"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("standardDeviation"));
    if (v5)
    {
      v8 = v7;
      objc_msgSend(v5, "doubleValue");
      v10 = v9;
      objc_msgSend(v5, "unit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[MXAverage initWithDoubleValue:sampleCount:standardDeviation:unit:](self, "initWithDoubleValue:sampleCount:standardDeviation:unit:", v6, v11, v10, v8);

      v12 = self;
    }
    else
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BDD0B88];
      v18 = *MEMORY[0x24BDD0FC8];
      v19[0] = CFSTR("Measurement class object has been corrupted!");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 4864, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v16);

      v12 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("NSMeasurement cannot be decoded by non-keyed archivers"));
    v12 = 0;
  }

  return v12;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_averageMeasurement)
  {
    -[NSMeasurementFormatter stringFromMeasurement:](self->_averageMeasurementFormatter, "stringFromMeasurement:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("averageValue"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sampleCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sampleCount"));

  objc_msgSend(MEMORY[0x24BDD1518], "numberWithDouble:", self->_standardDeviation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("standardDeviation"));

  return v3;
}

- (NSMeasurement)averageMeasurement
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSInteger)sampleCount
{
  return self->_sampleCount;
}

- (double)standardDeviation
{
  return self->_standardDeviation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageMeasurement, 0);
  objc_storeStrong((id *)&self->_averageMeasurementFormatter, 0);
}

@end
