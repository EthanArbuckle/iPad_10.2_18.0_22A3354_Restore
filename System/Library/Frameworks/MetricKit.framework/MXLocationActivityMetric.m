@implementation MXLocationActivityMetric

- (MXLocationActivityMetric)initWithCumulativeBestAccuracyTimeMeasurement:(id)a3 cumulativeBestAccuracyForNavigationTimeMeasurement:(id)a4 nearestTenMetersAccuracyTimeMeasurement:(id)a5 hundredMetersAccuracyTimeMeasurement:(id)a6 kilometerAccuracyTimeMeasurement:(id)a7 threeKilometerAccuracyTimeMeasurement:(id)a8
{
  id v15;
  id v16;
  id v17;
  MXLocationActivityMetric *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  MXLocationActivityMetric *v25;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v15 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v16 = a7;
  v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)MXLocationActivityMetric;
  v18 = -[MXMetric init](&v30, sel_init);
  if (!v18)
    goto LABEL_10;
  objc_msgSend(v15, "doubleValue");
  if (v19 >= 0.0)
  {
    objc_msgSend(v29, "doubleValue");
    if (v20 >= 0.0)
    {
      objc_msgSend(v28, "doubleValue");
      if (v21 >= 0.0)
      {
        objc_msgSend(v27, "doubleValue");
        if (v22 >= 0.0)
        {
          objc_msgSend(v16, "doubleValue");
          if (v23 >= 0.0)
          {
            objc_msgSend(v17, "doubleValue");
            if (v24 >= 0.0)
            {
              objc_storeStrong((id *)&v18->_cumulativeBestAccuracyTime, a3);
              objc_storeStrong((id *)&v18->_cumulativeBestAccuracyForNavigationTime, a4);
              objc_storeStrong((id *)&v18->_cumulativeNearestTenMetersAccuracyTime, a5);
              objc_storeStrong((id *)&v18->_cumulativeHundredMetersAccuracyTime, a6);
              objc_storeStrong((id *)&v18->_cumulativeKilometerAccuracyTime, a7);
              objc_storeStrong((id *)&v18->_cumulativeThreeKilometersAccuracyTime, a8);
LABEL_10:
              v25 = v18;
              goto LABEL_11;
            }
          }
        }
      }
    }
  }
  v25 = 0;
LABEL_11:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMeasurement *cumulativeBestAccuracyTime;
  id v5;

  cumulativeBestAccuracyTime = self->_cumulativeBestAccuracyTime;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cumulativeBestAccuracyTime, CFSTR("cumulativeBestAccuracyTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeBestAccuracyForNavigationTime, CFSTR("cumulativeBestAccuracyForNavigationTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeNearestTenMetersAccuracyTime, CFSTR("cumulativeNearestTenMetersAccuracyTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeHundredMetersAccuracyTime, CFSTR("cumulativeHundredMetersAccuracyTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeKilometerAccuracyTime, CFSTR("cumulativeKilometerAccuracyTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeThreeKilometersAccuracyTime, CFSTR("cumulativeThreeKilometersAccuracyTime"));

}

- (MXLocationActivityMetric)initWithCoder:(id)a3
{
  id v4;
  MXLocationActivityMetric *v5;
  uint64_t v6;
  NSMeasurement *cumulativeBestAccuracyTime;
  uint64_t v8;
  NSMeasurement *cumulativeBestAccuracyForNavigationTime;
  uint64_t v10;
  NSMeasurement *cumulativeNearestTenMetersAccuracyTime;
  uint64_t v12;
  NSMeasurement *cumulativeHundredMetersAccuracyTime;
  uint64_t v14;
  NSMeasurement *cumulativeKilometerAccuracyTime;
  uint64_t v16;
  NSMeasurement *cumulativeThreeKilometersAccuracyTime;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MXLocationActivityMetric;
  v5 = -[MXMetric init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeBestAccuracyTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    cumulativeBestAccuracyTime = v5->_cumulativeBestAccuracyTime;
    v5->_cumulativeBestAccuracyTime = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeBestAccuracyForNavigationTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    cumulativeBestAccuracyForNavigationTime = v5->_cumulativeBestAccuracyForNavigationTime;
    v5->_cumulativeBestAccuracyForNavigationTime = (NSMeasurement *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeNearestTenMetersAccuracyTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    cumulativeNearestTenMetersAccuracyTime = v5->_cumulativeNearestTenMetersAccuracyTime;
    v5->_cumulativeNearestTenMetersAccuracyTime = (NSMeasurement *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeHundredMetersAccuracyTime"));
    v12 = objc_claimAutoreleasedReturnValue();
    cumulativeHundredMetersAccuracyTime = v5->_cumulativeHundredMetersAccuracyTime;
    v5->_cumulativeHundredMetersAccuracyTime = (NSMeasurement *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeKilometerAccuracyTime"));
    v14 = objc_claimAutoreleasedReturnValue();
    cumulativeKilometerAccuracyTime = v5->_cumulativeKilometerAccuracyTime;
    v5->_cumulativeKilometerAccuracyTime = (NSMeasurement *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeThreeKilometersAccuracyTime"));
    v16 = objc_claimAutoreleasedReturnValue();
    cumulativeThreeKilometersAccuracyTime = v5->_cumulativeThreeKilometersAccuracyTime;
    v5->_cumulativeThreeKilometersAccuracyTime = (NSMeasurement *)v16;

  }
  return v5;
}

- (id)toDictionary
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_cumulativeBestAccuracyTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromMeasurement:", self->_cumulativeBestAccuracyTime);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cumulativeBestAccuracyTime"));

  }
  if (self->_cumulativeBestAccuracyForNavigationTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromMeasurement:", self->_cumulativeBestAccuracyForNavigationTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cumulativeBestAccuracyForNavigationTime"));

  }
  if (self->_cumulativeNearestTenMetersAccuracyTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromMeasurement:", self->_cumulativeNearestTenMetersAccuracyTime);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cumulativeNearestTenMetersAccuracyTime"));

  }
  if (self->_cumulativeHundredMetersAccuracyTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromMeasurement:", self->_cumulativeHundredMetersAccuracyTime);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cumulativeHundredMetersAccuracyTime"));

  }
  if (self->_cumulativeKilometerAccuracyTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromMeasurement:", self->_cumulativeKilometerAccuracyTime);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cumulativeKilometerAccuracyTime"));

  }
  if (self->_cumulativeThreeKilometersAccuracyTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromMeasurement:", self->_cumulativeThreeKilometersAccuracyTime);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cumulativeThreeKilometersAccuracyTime"));

  }
  return v3;
}

- (NSMeasurement)cumulativeBestAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSMeasurement)cumulativeBestAccuracyForNavigationTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (NSMeasurement)cumulativeNearestTenMetersAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 32, 1);
}

- (NSMeasurement)cumulativeHundredMetersAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 40, 1);
}

- (NSMeasurement)cumulativeKilometerAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)cumulativeThreeKilometersAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cumulativeThreeKilometersAccuracyTime, 0);
  objc_storeStrong((id *)&self->_cumulativeKilometerAccuracyTime, 0);
  objc_storeStrong((id *)&self->_cumulativeHundredMetersAccuracyTime, 0);
  objc_storeStrong((id *)&self->_cumulativeNearestTenMetersAccuracyTime, 0);
  objc_storeStrong((id *)&self->_cumulativeBestAccuracyForNavigationTime, 0);
  objc_storeStrong((id *)&self->_cumulativeBestAccuracyTime, 0);
}

@end
