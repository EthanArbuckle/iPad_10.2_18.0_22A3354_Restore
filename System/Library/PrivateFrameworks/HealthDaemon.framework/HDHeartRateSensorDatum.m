@implementation HDHeartRateSensorDatum

- (HDHeartRateSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 heartRate:(id)a5 heartRateContext:(int64_t)a6 resumeContext:(id)a7
{
  HDHeartRateSensorDatum *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDHeartRateSensorDatum;
  result = -[HDQuantityDatum initWithIdentifier:dateInterval:resumeContext:quantity:](&v9, sel_initWithIdentifier_dateInterval_resumeContext_quantity_, a3, a4, a7, a5);
  if (result)
    result->_heartRateContext = a6;
  return result;
}

- (int64_t)heartRateContext
{
  return self->_heartRateContext;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDHeartRateSensorDatum;
  v4 = a3;
  -[HDQuantityDatum encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_heartRateContext, CFSTR("hrsd_hrctx"), v5.receiver, v5.super_class);

}

- (HDHeartRateSensorDatum)initWithCoder:(id)a3
{
  id v4;
  HDHeartRateSensorDatum *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDHeartRateSensorDatum;
  v5 = -[HDQuantityDatum initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_heartRateContext = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hrsd_hrctx"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)quantityDatumWithHKQuantityDatum:(id)a3
{
  id v3;
  HDHeartRateSensorDatum *v4;
  void *v5;
  void *v6;
  void *v7;
  HDHeartRateSensorDatum *v8;

  v3 = a3;
  v4 = [HDHeartRateSensorDatum alloc];
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HDHeartRateSensorDatum initWithIdentifier:dateInterval:heartRate:heartRateContext:resumeContext:](v4, "initWithIdentifier:dateInterval:heartRate:heartRateContext:resumeContext:", v5, v6, v7, 0, 0);
  return v8;
}

@end
