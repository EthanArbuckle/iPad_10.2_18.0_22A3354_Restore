@implementation MXCPUMetric

- (MXCPUMetric)initWithCumulativeCPUTimeMeasurement:(id)a3
{
  id v5;
  MXCPUMetric *v6;
  double v7;
  MXCPUMetric *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXCPUMetric;
  v6 = -[MXMetric init](&v10, sel_init);
  if (!v6)
    goto LABEL_5;
  objc_msgSend(v5, "doubleValue");
  if (v7 >= 0.0)
  {
    objc_storeStrong((id *)&v6->_cumulativeCPUTime, a3);
LABEL_5:
    v8 = v6;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (MXCPUMetric)initWithCumulativeCPUTimeMeasurement:(id)a3 withCumulativeCPUInstructions:(id)a4 withCumulativeForegroundCPUTimeMeasurement:(id)a5 withCumulativeBackgroundCPUTimeMeasurement:(id)a6
{
  id v9;
  id v10;
  MXCPUMetric *v11;
  double v12;
  double v13;
  MXCPUMetric *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MXCPUMetric;
  v11 = -[MXMetric init](&v16, sel_init);
  if (!v11)
    goto LABEL_6;
  objc_msgSend(v9, "doubleValue");
  if (v12 >= 0.0)
  {
    objc_msgSend(v10, "doubleValue");
    if (v13 >= 0.0)
    {
      objc_storeStrong((id *)&v11->_cumulativeCPUTime, a3);
      objc_storeStrong((id *)&v11->_cumulativeCPUInstructions, a4);
LABEL_6:
      v14 = v11;
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (MXCPUMetric)initWithCumulativeCPUTimeMeasurement:(id)a3 withCumulativeCPUInstructions:(id)a4
{
  id v7;
  id v8;
  MXCPUMetric *v9;
  double v10;
  double v11;
  MXCPUMetric *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MXCPUMetric;
  v9 = -[MXMetric init](&v14, sel_init);
  if (!v9)
    goto LABEL_6;
  objc_msgSend(v7, "doubleValue");
  if (v10 >= 0.0)
  {
    objc_msgSend(v8, "doubleValue");
    if (v11 >= 0.0)
    {
      objc_storeStrong((id *)&v9->_cumulativeCPUTime, a3);
      objc_storeStrong((id *)&v9->_cumulativeCPUInstructions, a4);
LABEL_6:
      v12 = v9;
      goto LABEL_7;
    }
  }
  v12 = 0;
LABEL_7:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMeasurement *cumulativeCPUTime;
  id v5;

  cumulativeCPUTime = self->_cumulativeCPUTime;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cumulativeCPUTime, CFSTR("cumulativeCPUTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeCPUInstructions, CFSTR("cumulativeCPUInstructions"));

}

- (MXCPUMetric)initWithCoder:(id)a3
{
  id v4;
  MXCPUMetric *v5;
  uint64_t v6;
  NSMeasurement *cumulativeCPUTime;
  uint64_t v8;
  NSMeasurement *cumulativeCPUInstructions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXCPUMetric;
  v5 = -[MXMetric init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeCPUTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    cumulativeCPUTime = v5->_cumulativeCPUTime;
    v5->_cumulativeCPUTime = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeCPUInstructions"));
    v8 = objc_claimAutoreleasedReturnValue();
    cumulativeCPUInstructions = v5->_cumulativeCPUInstructions;
    v5->_cumulativeCPUInstructions = (NSMeasurement *)v8;

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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_cumulativeCPUTime)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromMeasurement:", self->_cumulativeCPUTime);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cumulativeCPUTime"));

  }
  if (self->_cumulativeCPUInstructions)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromMeasurement:", self->_cumulativeCPUInstructions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cumulativeCPUInstructions"));

  }
  return v3;
}

- (NSMeasurement)cumulativeCPUTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSMeasurement)cumulativeCPUInstructions
{
  return (NSMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cumulativeCPUInstructions, 0);
  objc_storeStrong((id *)&self->_cumulativeCPUTime, 0);
}

@end
