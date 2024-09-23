@implementation HKQueryServerConfiguration

- (HKQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKQueryServerConfiguration *v5;
  uint64_t v6;
  HKObjectType *objectType;
  uint64_t v8;
  NSString *debugIdentifier;
  uint64_t v10;
  _HKFilter *filter;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKQueryServerConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    objectType = v5->_objectType;
    v5->_objectType = (HKObjectType *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("debugID"));
    v8 = objc_claimAutoreleasedReturnValue();
    debugIdentifier = v5->_debugIdentifier;
    v5->_debugIdentifier = (NSString *)v8;

    v5->_shouldDeactivateAfterInitialResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deactivate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filter"));
    v10 = objc_claimAutoreleasedReturnValue();
    filter = v5->_filter;
    v5->_filter = (_HKFilter *)v10;

    v5->_qualityOfService = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("qos"));
    v5->_shouldSuppressDataCollection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppress"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("activationDate"));
    v5->_activationTime = v12;
  }

  return v5;
}

- (HKObjectType)objectType
{
  return self->_objectType;
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (BOOL)shouldSuppressDataCollection
{
  return self->_shouldSuppressDataCollection;
}

- (BOOL)shouldDeactivateAfterInitialResults
{
  return self->_shouldDeactivateAfterInitialResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_objectType, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQueryServerConfiguration)init
{
  HKQueryServerConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKQueryServerConfiguration;
  result = -[HKQueryServerConfiguration init](&v3, sel_init);
  if (result)
    result->_qualityOfService = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKQueryServerConfiguration;
  v4 = -[HKTaskConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setObjectType:", self->_objectType);
  objc_msgSend(v4, "setDebugIdentifier:", self->_debugIdentifier);
  objc_msgSend(v4, "setFilter:", self->_filter);
  objc_msgSend(v4, "setQualityOfService:", self->_qualityOfService);
  objc_msgSend(v4, "setShouldDeactivateAfterInitialResults:", self->_shouldDeactivateAfterInitialResults);
  objc_msgSend(v4, "setShouldSuppressDataCollection:", self->_shouldSuppressDataCollection);
  objc_msgSend(v4, "setActivationTime:", self->_activationTime);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKQueryServerConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectType, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugIdentifier, CFSTR("debugID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldDeactivateAfterInitialResults, CFSTR("deactivate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_filter, CFSTR("filter"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_qualityOfService, CFSTR("qos"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldSuppressDataCollection, CFSTR("suppress"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("activationDate"), self->_activationTime);

}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setShouldDeactivateAfterInitialResults:(BOOL)a3
{
  self->_shouldDeactivateAfterInitialResults = a3;
}

- (void)setObjectType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setShouldSuppressDataCollection:(BOOL)a3
{
  self->_shouldSuppressDataCollection = a3;
}

- (double)activationTime
{
  return self->_activationTime;
}

- (void)setActivationTime:(double)a3
{
  self->_activationTime = a3;
}

@end
