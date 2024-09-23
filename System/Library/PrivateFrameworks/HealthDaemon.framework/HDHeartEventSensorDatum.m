@implementation HDHeartEventSensorDatum

- (HDHeartEventSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 heartRateThreshold:(id)a5 associatedSampleUUIDs:(id)a6 resumeContext:(id)a7
{
  id v13;
  id v14;
  HDHeartEventSensorDatum *v15;
  HDHeartEventSensorDatum *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDHeartEventSensorDatum;
  v15 = -[HDDataCollectorSensorDatum initWithIdentifier:dateInterval:resumeContext:](&v18, sel_initWithIdentifier_dateInterval_resumeContext_, a3, a4, a7);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_heartRateThreshold, a5);
    objc_storeStrong((id *)&v16->_associatedSampleUUIDs, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDHeartEventSensorDatum)initWithCoder:(id)a3
{
  id v4;
  HDHeartEventSensorDatum *v5;
  uint64_t v6;
  HKQuantity *heartRateThreshold;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *associatedSampleUUIDs;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDHeartEventSensorDatum;
  v5 = -[HDDataCollectorSensorDatum initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_HeartRateThresholdKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    heartRateThreshold = v5->_heartRateThreshold;
    v5->_heartRateThreshold = (HKQuantity *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_AssociatedSampleUUIDsKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    associatedSampleUUIDs = v5->_associatedSampleUUIDs;
    v5->_associatedSampleUUIDs = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDHeartEventSensorDatum;
  v4 = a3;
  -[HDDataCollectorSensorDatum encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_heartRateThreshold, CFSTR("_HeartRateThresholdKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedSampleUUIDs, CFSTR("_AssociatedSampleUUIDsKey"));

}

- (NSArray)associatedSampleUUIDs
{
  return self->_associatedSampleUUIDs;
}

- (HKQuantity)heartRateThreshold
{
  return self->_heartRateThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateThreshold, 0);
  objc_storeStrong((id *)&self->_associatedSampleUUIDs, 0);
}

@end
