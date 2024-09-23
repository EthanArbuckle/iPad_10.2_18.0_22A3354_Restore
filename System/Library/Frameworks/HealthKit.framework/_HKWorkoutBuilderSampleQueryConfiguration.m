@implementation _HKWorkoutBuilderSampleQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKWorkoutBuilderSampleQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setNeedsHistoricalData:", self->_needsHistoricalData);
  objc_msgSend(v4, "setWorkoutBuilderIdentifier:", self->_workoutBuilderIdentifier);
  objc_msgSend(v4, "setDeliverQuantities:", self->_deliverQuantities);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutBuilderSampleQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKWorkoutBuilderSampleQueryConfiguration *v5;
  uint64_t v6;
  NSUUID *workoutBuilderIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKWorkoutBuilderSampleQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_needsHistoricalData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needs_historical"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("builder_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    workoutBuilderIdentifier = v5->_workoutBuilderIdentifier;
    v5->_workoutBuilderIdentifier = (NSUUID *)v6;

    v5->_deliverQuantities = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deliver_quantities"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKWorkoutBuilderSampleQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_needsHistoricalData, CFSTR("needs_historical"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutBuilderIdentifier, CFSTR("builder_identifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_deliverQuantities, CFSTR("deliver_quantities"));

}

- (BOOL)needsHistoricalData
{
  return self->_needsHistoricalData;
}

- (void)setNeedsHistoricalData:(BOOL)a3
{
  self->_needsHistoricalData = a3;
}

- (NSUUID)workoutBuilderIdentifier
{
  return self->_workoutBuilderIdentifier;
}

- (void)setWorkoutBuilderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)deliverQuantities
{
  return self->_deliverQuantities;
}

- (void)setDeliverQuantities:(BOOL)a3
{
  self->_deliverQuantities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutBuilderIdentifier, 0);
}

@end
