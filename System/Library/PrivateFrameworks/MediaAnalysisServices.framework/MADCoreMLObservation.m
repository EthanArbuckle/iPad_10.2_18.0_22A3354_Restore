@implementation MADCoreMLObservation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADCoreMLObservation)initWithFeatureName:(id)a3 featureValue:(id)a4
{
  id v7;
  id v8;
  MADCoreMLObservation *v9;
  MADCoreMLObservation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADCoreMLObservation;
  v9 = -[MADCoreMLObservation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureName, a3);
    objc_storeStrong((id *)&v10->_featureValue, a4);
  }

  return v10;
}

+ (id)entryWithFeatureName:(id)a3 featureValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFeatureName:featureValue:", v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureName, CFSTR("CoreMLFeatureName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureValue, CFSTR("CoreMLFeatureValue"));

}

- (MADCoreMLObservation)initWithCoder:(id)a3
{
  id v4;
  MADCoreMLObservation *v5;
  uint64_t v6;
  NSString *featureName;
  uint64_t v8;
  MLFeatureValue *featureValue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADCoreMLObservation;
  v5 = -[MADCoreMLObservation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CoreMLFeatureName"));
    v6 = objc_claimAutoreleasedReturnValue();
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CoreMLFeatureValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    featureValue = v5->_featureValue;
    v5->_featureValue = (MLFeatureValue *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("CoreMLFeatureName"), self->_featureName);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@>"), CFSTR("CoreMLFeatureValue"), self->_featureValue);
  return v3;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (MLFeatureValue)featureValue
{
  return self->_featureValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValue, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
