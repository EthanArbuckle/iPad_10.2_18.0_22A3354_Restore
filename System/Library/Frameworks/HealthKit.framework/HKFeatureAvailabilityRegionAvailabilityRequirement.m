@implementation HKFeatureAvailabilityRegionAvailabilityRequirement

- (HKFeatureAvailabilityRegionAvailabilityRequirement)initWithFeatureIdentifier:(id)a3
{
  id v4;
  HKFeatureAvailabilityRegionAvailabilityRequirement *v5;
  uint64_t v6;
  NSString *featureIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRegionAvailabilityRequirement;
  v5 = -[HKFeatureAvailabilityRegionAvailabilityRequirement init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(v6, "regionAvailabilityForFeatureWithIdentifier:error:", self->_featureIdentifier, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HKFeatureAvailabilityRegionAvailabilityRequirement isSatisfiedWithRegionAvailability:dataSource:error:](self, "isSatisfiedWithRegionAvailability:dataSource:error:", v7, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)isSatisfiedWithRegionAvailability:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFeatureAvailabilityRegionAvailabilityRequirement.m"), 40, CFSTR("Subclasses must override this method"));

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSString isEqual:](self->_featureIdentifier, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = -[NSString hash](self->_featureIdentifier, "hash") ^ v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_featureIdentifier, CFSTR("featureIdentifier"));
}

- (HKFeatureAvailabilityRegionAvailabilityRequirement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKFeatureAvailabilityRegionAvailabilityRequirement *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKFeatureAvailabilityRegionAvailabilityRequirement initWithFeatureIdentifier:](self, "initWithFeatureIdentifier:", v5);
  return v6;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
