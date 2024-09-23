@implementation MXAppRunTimeMetric

- (MXAppRunTimeMetric)initWithCumulativeForegroundTimeMeasurement:(id)a3 cumulativeBackgroundTimeMeasurement:(id)a4 cumulativeBackgroundAudioTimeMeasurement:(id)a5 cumulativeBackgroundLocationTimeMeasurement:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MXAppRunTimeMetric *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  MXAppRunTimeMetric *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MXAppRunTimeMetric;
  v15 = -[MXMetric init](&v22, sel_init);
  if (!v15)
    goto LABEL_8;
  objc_msgSend(v11, "doubleValue");
  if (v16 >= 0.0)
  {
    objc_msgSend(v12, "doubleValue");
    if (v17 >= 0.0)
    {
      objc_msgSend(v13, "doubleValue");
      if (v18 >= 0.0)
      {
        objc_msgSend(v14, "doubleValue");
        if (v19 >= 0.0)
        {
          objc_storeStrong((id *)&v15->_cumulativeForegroundTime, a3);
          objc_storeStrong((id *)&v15->_cumulativeBackgroundTime, a4);
          objc_storeStrong((id *)&v15->_cumulativeBackgroundAudioTime, a5);
          objc_storeStrong((id *)&v15->_cumulativeBackgroundLocationTime, a6);
LABEL_8:
          v20 = v15;
          goto LABEL_9;
        }
      }
    }
  }
  v20 = 0;
LABEL_9:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMeasurement *cumulativeForegroundTime;
  id v5;

  cumulativeForegroundTime = self->_cumulativeForegroundTime;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cumulativeForegroundTime, CFSTR("cumulativeForegroundTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeBackgroundTime, CFSTR("cumulativeBackgroundTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeBackgroundAudioTime, CFSTR("cumulativeBackgroundAudioTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeBackgroundLocationTime, CFSTR("cumulativeBackgroundLocationTime"));

}

- (MXAppRunTimeMetric)initWithCoder:(id)a3
{
  id v4;
  MXAppRunTimeMetric *v5;
  uint64_t v6;
  NSMeasurement *cumulativeForegroundTime;
  uint64_t v8;
  NSMeasurement *cumulativeBackgroundTime;
  uint64_t v10;
  NSMeasurement *cumulativeBackgroundAudioTime;
  uint64_t v12;
  NSMeasurement *cumulativeBackgroundLocationTime;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MXAppRunTimeMetric;
  v5 = -[MXMetric init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeForegroundTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    cumulativeForegroundTime = v5->_cumulativeForegroundTime;
    v5->_cumulativeForegroundTime = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeBackgroundTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    cumulativeBackgroundTime = v5->_cumulativeBackgroundTime;
    v5->_cumulativeBackgroundTime = (NSMeasurement *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeBackgroundAudioTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    cumulativeBackgroundAudioTime = v5->_cumulativeBackgroundAudioTime;
    v5->_cumulativeBackgroundAudioTime = (NSMeasurement *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeBackgroundLocationTime"));
    v12 = objc_claimAutoreleasedReturnValue();
    cumulativeBackgroundLocationTime = v5->_cumulativeBackgroundLocationTime;
    v5->_cumulativeBackgroundLocationTime = (NSMeasurement *)v12;

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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_cumulativeForegroundTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromMeasurement:", self->_cumulativeForegroundTime);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cumulativeForegroundTime"));

  }
  if (self->_cumulativeBackgroundTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromMeasurement:", self->_cumulativeBackgroundTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cumulativeBackgroundTime"));

  }
  if (self->_cumulativeBackgroundAudioTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromMeasurement:", self->_cumulativeBackgroundAudioTime);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cumulativeBackgroundAudioTime"));

  }
  if (self->_cumulativeBackgroundLocationTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromMeasurement:", self->_cumulativeBackgroundLocationTime);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cumulativeBackgroundLocationTime"));

  }
  return v3;
}

- (NSMeasurement)cumulativeForegroundTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSMeasurement)cumulativeBackgroundTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (NSMeasurement)cumulativeBackgroundAudioTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 32, 1);
}

- (NSMeasurement)cumulativeBackgroundLocationTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cumulativeBackgroundLocationTime, 0);
  objc_storeStrong((id *)&self->_cumulativeBackgroundAudioTime, 0);
  objc_storeStrong((id *)&self->_cumulativeBackgroundTime, 0);
  objc_storeStrong((id *)&self->_cumulativeForegroundTime, 0);
}

@end
