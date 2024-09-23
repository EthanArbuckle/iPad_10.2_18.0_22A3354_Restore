@implementation LCFELShadowEvaluationPrediction

- (id)init:(id)a3 predictedFeatureSet:(id)a4 outputLabelFeatureName:(id)a5
{
  id v8;
  id v9;
  id v10;
  LCFELShadowEvaluationPrediction *v11;
  uint64_t v12;
  NSDate *timestampOfInputFeatureSet;
  void *v14;
  void *v15;
  uint64_t v16;
  NSNumber *predictedClass;
  void *v18;
  void *v19;
  uint64_t v20;
  NSNumber *probability;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)LCFELShadowEvaluationPrediction;
  v11 = -[LCFELShadowEvaluationPrediction init](&v23, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "timestamp");
    v12 = objc_claimAutoreleasedReturnValue();
    timestampOfInputFeatureSet = v11->_timestampOfInputFeatureSet;
    v11->_timestampOfInputFeatureSet = (NSDate *)v12;

    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "featureValueForName:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "int64Value"));
    v16 = objc_claimAutoreleasedReturnValue();
    predictedClass = v11->_predictedClass;
    v11->_predictedClass = (NSNumber *)v16;

    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "featureValueForName:", CFSTR("classProbability"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(v18, "numberWithDouble:");
    v20 = objc_claimAutoreleasedReturnValue();
    probability = v11->_probability;
    v11->_probability = (NSNumber *)v20;

  }
  return v11;
}

- (NSDate)timestampOfInputFeatureSet
{
  return self->_timestampOfInputFeatureSet;
}

- (NSNumber)predictedClass
{
  return self->_predictedClass;
}

- (NSNumber)probability
{
  return self->_probability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_predictedClass, 0);
  objc_storeStrong((id *)&self->_timestampOfInputFeatureSet, 0);
}

@end
