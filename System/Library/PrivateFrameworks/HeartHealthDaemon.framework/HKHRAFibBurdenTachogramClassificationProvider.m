@implementation HKHRAFibBurdenTachogramClassificationProvider

- (HKHRAFibBurdenTachogramClassificationProvider)initWithSampleClassification:(id)a3
{
  id v5;
  HKHRAFibBurdenTachogramClassificationProvider *v6;
  HKHRAFibBurdenTachogramClassificationProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenTachogramClassificationProvider;
  v6 = -[HKHRAFibBurdenTachogramClassificationProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sampleClassification, a3);

  return v7;
}

- (HKHRAFibBurdenTachogramClassificationProvider)initWithSampleClassification:(id)a3 tachogramClassification:(id)a4
{
  id v7;
  id v8;
  HKHRAFibBurdenTachogramClassificationProvider *v9;
  HKHRAFibBurdenTachogramClassificationProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRAFibBurdenTachogramClassificationProvider;
  v9 = -[HKHRAFibBurdenTachogramClassificationProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sampleClassification, a3);
    objc_storeStrong((id *)&v10->_computedTachogramClassification, a4);
  }

  return v10;
}

- (ABTachogramClassification)tachogramClassification
{
  ABTachogramClassification *computedTachogramClassification;
  ABTachogramClassification *v4;
  ABTachogramClassification *v5;
  void *v6;
  void *v7;
  void *v8;

  computedTachogramClassification = self->_computedTachogramClassification;
  if (!computedTachogramClassification)
  {
    v4 = (ABTachogramClassification *)objc_opt_new();
    v5 = self->_computedTachogramClassification;
    self->_computedTachogramClassification = v4;

    -[HKHRSampleClassification sampleUUID](self->_sampleClassification, "sampleUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABTachogramClassification setUuid:](self->_computedTachogramClassification, "setUuid:", v6);

    -[HKHRSampleClassification sampleDateInterval](self->_sampleClassification, "sampleDateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABTachogramClassification setDate:](self->_computedTachogramClassification, "setDate:", v8);

    -[ABTachogramClassification setAFibDetected:](self->_computedTachogramClassification, "setAFibDetected:", -[HKHRSampleClassification classification](self->_sampleClassification, "classification") == 1);
    computedTachogramClassification = self->_computedTachogramClassification;
  }
  return computedTachogramClassification;
}

- (BOOL)isEqual:(id)a3
{
  HKHRAFibBurdenTachogramClassificationProvider *v4;
  HKHRSampleClassification *sampleClassification;
  void *v6;
  char v7;

  v4 = (HKHRAFibBurdenTachogramClassificationProvider *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sampleClassification = self->_sampleClassification;
      -[HKHRAFibBurdenTachogramClassificationProvider sampleClassification](v4, "sampleClassification");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HKHRSampleClassification isEqual:](sampleClassification, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[HKHRSampleClassification hash](self->_sampleClassification, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sampleClassification, CFSTR("SampleClassification"));
}

- (HKHRAFibBurdenTachogramClassificationProvider)initWithCoder:(id)a3
{
  id v4;
  HKHRAFibBurdenTachogramClassificationProvider *v5;
  uint64_t v6;
  HKHRSampleClassification *sampleClassification;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenTachogramClassificationProvider;
  v5 = -[HKHRAFibBurdenTachogramClassificationProvider init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SampleClassification"));
    v6 = objc_claimAutoreleasedReturnValue();
    sampleClassification = v5->_sampleClassification;
    v5->_sampleClassification = (HKHRSampleClassification *)v6;

  }
  return v5;
}

- (HKHRSampleClassification)sampleClassification
{
  return self->_sampleClassification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleClassification, 0);
  objc_storeStrong((id *)&self->_computedTachogramClassification, 0);
}

@end
