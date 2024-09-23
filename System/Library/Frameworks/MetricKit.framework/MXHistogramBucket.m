@implementation MXHistogramBucket

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXHistogramBucket)initWithBucketStart:(id)a3 bucketEnd:(id)a4 bucketCount:(unint64_t)a5
{
  id v8;
  id v9;
  MXHistogramBucket *v10;
  MXHistogramBucket *v11;
  uint64_t v12;
  NSMeasurement *bucketStart;
  uint64_t v14;
  NSMeasurement *bucketEnd;
  NSMeasurementFormatter *v16;
  NSMeasurementFormatter *histogramBucketFormatter;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MXHistogramBucket;
  v10 = -[MXHistogramBucket init](&v21, sel_init);
  if (!v10)
    goto LABEL_6;
  v11 = 0;
  if (v8 && v9 && a5)
  {
    v12 = objc_msgSend(v8, "copy");
    bucketStart = v10->_bucketStart;
    v10->_bucketStart = (NSMeasurement *)v12;

    v14 = objc_msgSend(v9, "copy");
    bucketEnd = v10->_bucketEnd;
    v10->_bucketEnd = (NSMeasurement *)v14;

    v10->_bucketCount = a5;
    v16 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    histogramBucketFormatter = v10->_histogramBucketFormatter;
    v10->_histogramBucketFormatter = v16;

    -[NSMeasurementFormatter setUnitOptions:](v10->_histogramBucketFormatter, "setUnitOptions:", 1);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v10->_histogramBucketFormatter, "setLocale:", v18);

    -[NSMeasurementFormatter setUnitStyle:](v10->_histogramBucketFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v10->_histogramBucketFormatter, "numberFormatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMaximumFractionDigits:", 0);

LABEL_6:
    v11 = v10;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSMeasurement *bucketStart;
  id v5;
  id v6;

  bucketStart = self->_bucketStart;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bucketStart, CFSTR("bucketStart"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bucketEnd, CFSTR("bucketEnd"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_bucketCount);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("bucketCount"));

}

- (MXHistogramBucket)initWithCoder:(id)a3
{
  id v4;
  MXHistogramBucket *v5;
  uint64_t v6;
  NSMeasurement *bucketStart;
  uint64_t v8;
  NSMeasurement *bucketEnd;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXHistogramBucket;
  v5 = -[MXHistogramBucket init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bucketStart"));
    v6 = objc_claimAutoreleasedReturnValue();
    bucketStart = v5->_bucketStart;
    v5->_bucketStart = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bucketEnd"));
    v8 = objc_claimAutoreleasedReturnValue();
    bucketEnd = v5->_bucketEnd;
    v5->_bucketEnd = (NSMeasurement *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bucketCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bucketCount = objc_msgSend(v10, "unsignedIntegerValue");

    v5 = -[MXHistogramBucket initWithBucketStart:bucketEnd:bucketCount:](v5, "initWithBucketStart:bucketEnd:bucketCount:", v5->_bucketStart, v5->_bucketEnd, v5->_bucketCount);
  }

  return v5;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  if (!self->_bucketStart || !self->_bucketEnd || !self->_bucketCount)
    return MEMORY[0x24BDBD1B8];
  v8[0] = CFSTR("bucketStart");
  -[NSMeasurementFormatter stringFromMeasurement:](self->_histogramBucketFormatter, "stringFromMeasurement:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("bucketEnd");
  -[NSMeasurementFormatter stringFromMeasurement:](self->_histogramBucketFormatter, "stringFromMeasurement:", self->_bucketEnd);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("bucketCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_bucketCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMeasurement)bucketStart
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSMeasurement)bucketEnd
{
  return (NSMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (NSUInteger)bucketCount
{
  return self->_bucketCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketEnd, 0);
  objc_storeStrong((id *)&self->_bucketStart, 0);
  objc_storeStrong((id *)&self->_histogramBucketFormatter, 0);
}

@end
