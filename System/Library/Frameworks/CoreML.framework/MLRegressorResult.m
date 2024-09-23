@implementation MLRegressorResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalFeatures, 0);
  objc_storeStrong((id *)&self->_predictedValue, 0);
}

- (id)asFeatureDictionaryWithPredictedValueDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MLDictionaryFeatureProvider *v7;
  void *v8;
  MLDictionaryFeatureProvider *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  MLDictionaryFeatureProvider *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLRegressorResult additionalFeatures](self, "additionalFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [MLDictionaryFeatureProvider alloc];
    -[MLRegressorResult additionalFeatures](self, "additionalFeatures");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MLDictionaryFeatureProvider initWithFeatureProvider:](v7, "initWithFeatureProvider:", v8);
    -[MLDictionaryFeatureProvider dictionary](v9, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");

    v5 = (void *)v11;
  }
  v12 = objc_msgSend(v4, "type");
  if (v12 > 8)
    goto LABEL_10;
  if (((1 << v12) & 0x1DB) == 0)
  {
    if (v12 == 2)
    {
      -[MLRegressorResult predictedValue](self, "predictedValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v17);

    }
    else
    {
      -[MLRegressorResult predictedValue](self, "predictedValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v16);
    }

LABEL_10:
    v19 = 0;
    v13 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v5, &v19);

    goto LABEL_11;
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (MLFeatureProvider)additionalFeatures
{
  return (MLFeatureProvider *)objc_getProperty(self, a2, 16, 1);
}

- (MLMultiArray)predictedValue
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

+ (id)resultWithValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:additionalFeatures:", v4, 0);

  return v5;
}

+ (id)resultWithValue:(id)a3 additionalFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:additionalFeatures:", v7, v6);

  return v8;
}

- (MLRegressorResult)initWithValue:(id)a3 additionalFeatures:(id)a4
{
  id v7;
  id v8;
  MLRegressorResult *v9;
  MLRegressorResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLRegressorResult;
  v9 = -[MLRegressorResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predictedValue, a3);
    objc_storeStrong((id *)&v10->_additionalFeatures, a4);
  }

  return v10;
}

@end
