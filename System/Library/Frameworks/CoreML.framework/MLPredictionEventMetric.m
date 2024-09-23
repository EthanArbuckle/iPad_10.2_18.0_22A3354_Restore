@implementation MLPredictionEventMetric

- (MLPredictionEventMetric)initWithBundleIdentifier:(id)a3 modelName:(id)a4 firstPartyExecutable:(id)a5 modelType:(id)a6 featuresPredictionDuration:(double)a7 featuresPredictionCountSoFar:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  MLPredictionEventMetric *v18;
  uint64_t v19;
  NSString *bundleIdentifier;
  uint64_t v21;
  NSString *modelName;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MLPredictionEventMetric;
  v18 = -[MLPredictionEventMetric init](&v24, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    bundleIdentifier = v18->_bundleIdentifier;
    v18->_bundleIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    modelName = v18->_modelName;
    v18->_modelName = (NSString *)v21;

    objc_storeStrong((id *)&v18->_firstPartyExecutable, a5);
    objc_storeStrong((id *)&v18->_modelType, a6);
    v18->_featuresPredictionDuration = a7;
    v18->_featuresPredictionCountSoFar = a8;
  }

  return v18;
}

- (NSString)name
{
  __CFString *v2;

  v2 = CFSTR("com.apple.CoreML.MLPrediction");
  return (NSString *)CFSTR("com.apple.CoreML.MLPrediction");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_firstPartyExecutable, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLPredictionEventMetric bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("bundleIdentifier"));

  -[MLPredictionEventMetric modelName](self, "modelName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("modelName"));

  -[MLPredictionEventMetric firstPartyExecutable](self, "firstPartyExecutable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("firstPartyExecutable"));

  -[MLPredictionEventMetric modelType](self, "modelType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("modelType"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[MLPredictionEventMetric featuresPredictionDuration](self, "featuresPredictionDuration");
  objc_msgSend(v8, "numberWithDouble:", v9 * 1000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("featuresPredictionDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MLPredictionEventMetric featuresPredictionCountSoFar](self, "featuresPredictionCountSoFar"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("featuresPredictionCountSoFar"));

  return (NSDictionary *)v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSNumber)firstPartyExecutable
{
  return self->_firstPartyExecutable;
}

- (NSNumber)modelType
{
  return self->_modelType;
}

- (double)featuresPredictionDuration
{
  return self->_featuresPredictionDuration;
}

- (int64_t)featuresPredictionCountSoFar
{
  return self->_featuresPredictionCountSoFar;
}

@end
