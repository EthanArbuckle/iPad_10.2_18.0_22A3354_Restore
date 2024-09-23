@implementation HKDiscreteQuantitySample

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSDateInterval *mostRecentQuantityDateInterval;
  uint64_t v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)HKDiscreteQuantitySample;
  -[HKQuantitySample _validateWithConfiguration:](&v36, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if (-[HKQuantitySample count](self, "count") >= 2)
    {
      -[HKQuantitySample quantityType](self, "quantityType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 128;
      -[HKQuantity _unit](self->_minimumQuantity, "_unit");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isCompatibleWithUnit:", v10);

      if ((v11 & 1) == 0)
        goto LABEL_11;
      v9 = 136;
      -[HKQuantity _unit](self->_maximumQuantity, "_unit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v8, "isCompatibleWithUnit:", v12);

      if ((v13 & 1) == 0)
        goto LABEL_11;
      v9 = 144;
      -[HKQuantity _unit](self->_mostRecentQuantity, "_unit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "isCompatibleWithUnit:", v14);

      if ((v15 & 1) != 0)
      {
        -[NSDateInterval startDate](self->_mostRecentQuantityDateInterval, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        v18 = v17;
        -[HKSample _startTimestamp](self, "_startTimestamp");
        if (v18 < v19)
        {

        }
        else
        {
          -[NSDateInterval endDate](self->_mostRecentQuantityDateInterval, "endDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSinceReferenceDate");
          v22 = v21;
          -[HKSample _endTimestamp](self, "_endTimestamp");
          v24 = v23;

          if (v22 <= v24)
          {

            goto LABEL_10;
          }
        }
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v32 = objc_opt_class();
        v33 = objc_opt_class();
        mostRecentQuantityDateInterval = self->_mostRecentQuantityDateInterval;
        -[HKSample startDate](self, "startDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSample endDate](self, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v32, a2, CFSTR("%@ %@ most recent quantity interval %@ falls outside the range of the sample: %@ - %@"), v33, self, mostRecentQuantityDateInterval, v28, v29);
      }
      else
      {
LABEL_11:
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = objc_opt_class();
        v27 = objc_opt_class();
        objc_msgSend(v8, "dimension");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9), "_unit");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v26, a2, CFSTR("%@ %@ requires unit of type %@. Incompatible unit: %@"), v27, self, v28, v29, v35);
      }
      v7 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
LABEL_10:
    v7 = 0;
    goto LABEL_13;
  }
  v7 = v5;
LABEL_13:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKDiscreteQuantitySample;
  v4 = a3;
  -[HKQuantitySample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_minimumQuantity, CFSTR("Min"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_maximumQuantity, CFSTR("Max"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mostRecentQuantity, CFSTR("Recent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mostRecentQuantityDateInterval, CFSTR("RecentDate"));

}

- (HKDiscreteQuantitySample)initWithCoder:(id)a3
{
  id v4;
  HKDiscreteQuantitySample *v5;
  HKDiscreteQuantitySample *v6;
  uint64_t v7;
  HKQuantity *minimumQuantity;
  uint64_t v9;
  HKQuantity *maximumQuantity;
  uint64_t v11;
  HKQuantity *mostRecentQuantity;
  uint64_t v13;
  NSDateInterval *mostRecentQuantityDateInterval;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKDiscreteQuantitySample;
  v5 = -[HKQuantitySample initWithCoder:](&v16, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5 && -[HKQuantitySample count](v5, "count") >= 2)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Min"));
    v7 = objc_claimAutoreleasedReturnValue();
    minimumQuantity = v6->_minimumQuantity;
    v6->_minimumQuantity = (HKQuantity *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Max"));
    v9 = objc_claimAutoreleasedReturnValue();
    maximumQuantity = v6->_maximumQuantity;
    v6->_maximumQuantity = (HKQuantity *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Recent"));
    v11 = objc_claimAutoreleasedReturnValue();
    mostRecentQuantity = v6->_mostRecentQuantity;
    v6->_mostRecentQuantity = (HKQuantity *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecentDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    mostRecentQuantityDateInterval = v6->_mostRecentQuantityDateInterval;
    v6->_mostRecentQuantityDateInterval = (NSDateInterval *)v13;

  }
  return v6;
}

- (HKQuantity)minimumQuantity
{
  HKQuantity *minimumQuantity;

  minimumQuantity = self->_minimumQuantity;
  if (minimumQuantity)
    return minimumQuantity;
  -[HKQuantitySample quantity](self, "quantity");
  return (HKQuantity *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_hasMinimumQuantity
{
  return self->_minimumQuantity != 0;
}

- (HKQuantity)maximumQuantity
{
  HKQuantity *maximumQuantity;

  maximumQuantity = self->_maximumQuantity;
  if (maximumQuantity)
    return maximumQuantity;
  -[HKQuantitySample quantity](self, "quantity");
  return (HKQuantity *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_hasMaximumQuantity
{
  return self->_maximumQuantity != 0;
}

- (HKQuantity)mostRecentQuantity
{
  HKQuantity *mostRecentQuantity;

  mostRecentQuantity = self->_mostRecentQuantity;
  if (mostRecentQuantity)
    return mostRecentQuantity;
  -[HKQuantitySample quantity](self, "quantity");
  return (HKQuantity *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_hasMostRecentQuantity
{
  return self->_mostRecentQuantity != 0;
}

- (NSDateInterval)mostRecentQuantityDateInterval
{
  NSDateInterval *mostRecentQuantityDateInterval;
  NSDateInterval *v3;
  id v5;
  void *v6;
  void *v7;

  mostRecentQuantityDateInterval = self->_mostRecentQuantityDateInterval;
  if (mostRecentQuantityDateInterval)
  {
    v3 = mostRecentQuantityDateInterval;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[HKSample startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSample endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (NSDateInterval *)objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);

  }
  return v3;
}

- (BOOL)_hasMostRecentQuantityDateInterval
{
  return self->_mostRecentQuantityDateInterval != 0;
}

- (void)_setMinimumQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)_setMaximumQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)_setMostRecentQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)_setMostRecentQuantityDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)set_hasMinimumQuantity:(BOOL)a3
{
  self->__hasMinimumQuantity = a3;
}

- (void)set_hasMaximumQuantity:(BOOL)a3
{
  self->__hasMaximumQuantity = a3;
}

- (void)set_hasMostRecentQuantity:(BOOL)a3
{
  self->__hasMostRecentQuantity = a3;
}

- (void)set_hasMostRecentQuantityDateInterval:(BOOL)a3
{
  self->__hasMostRecentQuantityDateInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentQuantityDateInterval, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantity, 0);
  objc_storeStrong((id *)&self->_maximumQuantity, 0);
  objc_storeStrong((id *)&self->_minimumQuantity, 0);
}

- (id)asJSONObject
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKDiscreteQuantitySample;
  -[HKQuantitySample asJSONObject](&v3, sel_asJSONObject);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
