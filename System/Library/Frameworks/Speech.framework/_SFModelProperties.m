@implementation _SFModelProperties

- (_SFModelProperties)initWithModelRoot:(id)a3 modelVersion:(id)a4 modelTaskNames:(id)a5 modelQualityType:(id)a6 modelSamplingRates:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _SFModelProperties *v17;
  uint64_t v18;
  NSURL *modelRoot;
  uint64_t v20;
  NSString *modelVersion;
  uint64_t v22;
  NSArray *modelTaskNames;
  uint64_t v24;
  NSString *modelQualityType;
  uint64_t v26;
  NSArray *modelSamplingRates;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_SFModelProperties;
  v17 = -[_SFModelProperties init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    modelRoot = v17->_modelRoot;
    v17->_modelRoot = (NSURL *)v18;

    v20 = objc_msgSend(v13, "copy");
    modelVersion = v17->_modelVersion;
    v17->_modelVersion = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    modelTaskNames = v17->_modelTaskNames;
    v17->_modelTaskNames = (NSArray *)v22;

    v24 = objc_msgSend(v15, "copy");
    modelQualityType = v17->_modelQualityType;
    v17->_modelQualityType = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    modelSamplingRates = v17->_modelSamplingRates;
    v17->_modelSamplingRates = (NSArray *)v26;

  }
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *modelRoot;
  id v5;

  modelRoot = self->_modelRoot;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modelRoot, CFSTR("_modelRoot"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelVersion, CFSTR("_modelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelTaskNames, CFSTR("_modelTaskNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelQualityType, CFSTR("_modelQualityType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelSamplingRates, CFSTR("_modelSamplingRates"));

}

- (_SFModelProperties)initWithCoder:(id)a3
{
  id v4;
  _SFModelProperties *v5;
  uint64_t v6;
  NSURL *modelRoot;
  uint64_t v8;
  NSString *modelVersion;
  uint64_t v10;
  NSArray *modelTaskNames;
  uint64_t v12;
  NSString *modelQualityType;
  uint64_t v14;
  NSArray *modelSamplingRates;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SFModelProperties;
  v5 = -[_SFModelProperties init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modelRoot"));
    v6 = objc_claimAutoreleasedReturnValue();
    modelRoot = v5->_modelRoot;
    v5->_modelRoot = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modelVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    modelVersion = v5->_modelVersion;
    v5->_modelVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_modelTaskNames"));
    v10 = objc_claimAutoreleasedReturnValue();
    modelTaskNames = v5->_modelTaskNames;
    v5->_modelTaskNames = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modelQualityType"));
    v12 = objc_claimAutoreleasedReturnValue();
    modelQualityType = v5->_modelQualityType;
    v5->_modelQualityType = (NSString *)v12;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_modelSamplingRates"));
    v14 = objc_claimAutoreleasedReturnValue();
    modelSamplingRates = v5->_modelSamplingRates;
    v5->_modelSamplingRates = (NSArray *)v14;

  }
  return v5;
}

- (NSURL)modelRoot
{
  return self->_modelRoot;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSArray)modelTaskNames
{
  return self->_modelTaskNames;
}

- (NSString)modelQualityType
{
  return self->_modelQualityType;
}

- (NSArray)modelSamplingRates
{
  return self->_modelSamplingRates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelSamplingRates, 0);
  objc_storeStrong((id *)&self->_modelQualityType, 0);
  objc_storeStrong((id *)&self->_modelTaskNames, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelRoot, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
