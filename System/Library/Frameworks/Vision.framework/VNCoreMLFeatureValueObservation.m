@implementation VNCoreMLFeatureValueObservation

- (VNCoreMLFeatureValueObservation)initWithOriginatingRequestSpecifier:(id)a3 featureName:(id)a4 featureValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  VNCoreMLFeatureValueObservation *v11;
  uint64_t v12;
  MLFeatureValue *featureValue;
  uint64_t v14;
  NSString *featureName;
  double v16;
  VNCoreMLFeatureValueObservation *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VNCoreMLFeatureValueObservation;
  v11 = -[VNObservation initWithOriginatingRequestSpecifier:](&v19, sel_initWithOriginatingRequestSpecifier_, v8);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    featureValue = v11->_featureValue;
    v11->_featureValue = (MLFeatureValue *)v12;

    v14 = objc_msgSend(v9, "copy");
    featureName = v11->_featureName;
    v11->_featureName = (NSString *)v14;

    LODWORD(v16) = 1.0;
    -[VNObservation setConfidence:](v11, "setConfidence:", v16);
    v17 = v11;
  }

  return v11;
}

- (VNCoreMLFeatureValueObservation)initWithCoder:(id)a3
{
  id v4;
  VNCoreMLFeatureValueObservation *v5;
  void *v6;
  uint64_t v7;
  MLFeatureValue *featureValue;
  void *v9;
  uint64_t v10;
  NSString *featureName;
  VNCoreMLFeatureValueObservation *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNCoreMLFeatureValueObservation;
  v5 = -[VNObservation initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    featureValue = v5->_featureValue;
    v5->_featureValue = (MLFeatureValue *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNCoreMLFeatureValueObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureValue, CFSTR("featureValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureName, CFSTR("featureName"));

}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNCoreMLFeatureValueObservation;
  -[VNObservation vn_cloneObject](&v9, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[MLFeatureValue copy](self->_featureValue, "copy");
    v5 = (void *)v3[12];
    v3[12] = v4;

    v6 = -[NSString copy](self->_featureName, "copy");
    v7 = (void *)v3[13];
    v3[13] = v6;

  }
  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)VNCoreMLFeatureValueObservation;
  -[VNObservation description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNCoreMLFeatureValueObservation featureName](self, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNCoreMLFeatureValueObservation featureValue](self, "featureValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNObservation confidence](self, "confidence");
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ \"%@\" - \"%@\" (%f)"), v4, v5, v6, v7);

  return v8;
}

- (MLFeatureValue)featureValue
{
  return self->_featureValue;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_featureValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
