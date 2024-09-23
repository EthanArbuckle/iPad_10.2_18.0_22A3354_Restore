@implementation _ATXScoreInterpreterCoreMLModelFeature

- (_ATXScoreInterpreterCoreMLModelFeature)initWithFeatureName:(id)a3 multiArraySize:(unint64_t)a4
{
  id v6;
  _ATXScoreInterpreterCoreMLModelFeature *v7;
  _ATXScoreInterpreterCoreMLModelFeature *v8;
  uint64_t v9;
  NSString *featureName;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ATXScoreInterpreterCoreMLModelFeature;
  v7 = -[_ATXScoreInterpreterCoreMLModelFeature init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_multiArraySize = a4;
    v9 = objc_msgSend(v6, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v9;

    v11 = 5;
    if (!v8->_multiArraySize)
      v11 = 2;
    v8->_featureType = v11;
  }

  return v8;
}

- (_ATXScoreInterpreterCoreMLModelFeature)initWithFeatureName:(id)a3
{
  return -[_ATXScoreInterpreterCoreMLModelFeature initWithFeatureName:multiArraySize:](self, "initWithFeatureName:multiArraySize:", a3, 0);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (int64_t)featureType
{
  return self->_featureType;
}

- (unint64_t)multiArraySize
{
  return self->_multiArraySize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
