@implementation HKFeatureAvailabilityStoreServerConfiguration

- (HKFeatureAvailabilityStoreServerConfiguration)initWithFeatureIdentifier:(id)a3
{
  id v4;
  HKFeatureAvailabilityStoreServerConfiguration *v5;
  uint64_t v6;
  NSString *featureIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityStoreServerConfiguration;
  v5 = -[HKFeatureAvailabilityStoreServerConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_featureIdentifier);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureAvailabilityStoreServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKFeatureAvailabilityStoreServerConfiguration *v5;
  uint64_t v6;
  NSString *featureIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityStoreServerConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FeatureIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityStoreServerConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureIdentifier, CFSTR("FeatureIdentifier"), v5.receiver, v5.super_class);

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
