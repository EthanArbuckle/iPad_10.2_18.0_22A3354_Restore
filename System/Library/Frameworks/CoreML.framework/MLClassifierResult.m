@implementation MLClassifierResult

- (id)asFeatureDictionaryWithPredictedClassDescription:(id)a3 classProbabilityDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MLDictionaryFeatureProvider *v10;
  void *v11;
  uint64_t v12;
  MLDictionaryFeatureProvider *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLClassifierResult additionalFeatures](self, "additionalFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[MLDictionaryFeatureProvider initWithFeatureProvider:]([MLDictionaryFeatureProvider alloc], "initWithFeatureProvider:", v9);
    -[MLDictionaryFeatureProvider dictionary](v10, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");

    v8 = (void *)v12;
  }
  if (v6)
  {
    objc_msgSend(v6, "name");
    v13 = (MLDictionaryFeatureProvider *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_20;
    -[MLClassifierResult predictedClass](self, "predictedClass");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_12:

      v13 = 0;
      goto LABEL_20;
    }
    v15 = (void *)v14;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v13);

  }
  if (!v7)
  {
    v19 = 0;
LABEL_19:
    v24 = v19;
    v13 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v8, &v24);
    v22 = v24;

    goto LABEL_20;
  }
  objc_msgSend(v7, "name");
  v13 = (MLDictionaryFeatureProvider *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[MLClassifierResult classProbability](self, "classProbability");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      if (-[MLClassifierResult predictedClassFeatureType](self, "predictedClassFeatureType") == 3)
      {
        +[MLFeatureValue featureValueWithStringKeyDictionary:](MLFeatureValue, "featureValueWithStringKeyDictionary:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (-[MLClassifierResult predictedClassFeatureType](self, "predictedClassFeatureType") != 1)
        {
          v25 = 0;
          +[MLFeatureValue featureValueWithDictionary:error:](MLFeatureValue, "featureValueWithDictionary:error:", v17, &v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v25;
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v13);

          goto LABEL_18;
        }
        +[MLFeatureValue featureValueWithInt64KeyDictionary:](MLFeatureValue, "featureValueWithInt64KeyDictionary:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      v20 = (void *)v18;
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v13);

      v19 = 0;
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_12;
  }
LABEL_20:

  return v13;
}

- (MLClassifierResult)initWithStringClassProbability:(id)a3 classFeatureType:(int64_t)a4 additionalFeatures:(id)a5
{
  id v9;
  id v10;
  MLClassifierResult *v11;
  MLClassifierResult *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  MLFeatureValue *v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;
  MLFeatureValue *v26;
  uint64_t v27;
  MLFeatureValue *predictedClass;
  uint64_t v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)MLClassifierResult;
  v11 = -[MLClassifierResult init](&v37, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_predictedClassFeatureType = a4;
    objc_storeStrong((id *)&v11->_classProbability, a3);
    objc_storeStrong((id *)&v12->_additionalFeatures, a5);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v14)
    {
      v15 = v14;
      v31 = v10;
      v32 = v9;
      v16 = 0;
      v17 = *(_QWORD *)v34;
      v18 = &unk_1E3DA2B60;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v20, v31, v32, (_QWORD)v33);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          v23 = v22;
          objc_msgSend(v18, "doubleValue");
          if (v23 > v24)
          {
            v25 = v21;

            v26 = v20;
            v16 = v26;
            v18 = v25;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v15);

      if (v16)
      {
        +[MLFeatureValue featureValueWithString:](MLFeatureValue, "featureValueWithString:", v16);
        v27 = objc_claimAutoreleasedReturnValue();
        predictedClass = v12->_predictedClass;
        v12->_predictedClass = (MLFeatureValue *)v27;

        v10 = v31;
        v9 = v32;
LABEL_16:

        goto LABEL_17;
      }
      v10 = v31;
      v9 = v32;
    }
    else
    {

      v18 = &unk_1E3DA2B60;
    }
    +[MLFeatureValue undefinedFeatureValueWithType:](MLFeatureValue, "undefinedFeatureValueWithType:", 3);
    v29 = objc_claimAutoreleasedReturnValue();
    v16 = v12->_predictedClass;
    v12->_predictedClass = (MLFeatureValue *)v29;
    goto LABEL_16;
  }
LABEL_17:

  return v12;
}

- (MLClassifierResult)initWithIntClassProbability:(id)a3 classFeatureType:(int64_t)a4 additionalFeatures:(id)a5
{
  id v9;
  id v10;
  MLClassifierResult *v11;
  MLClassifierResult *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  uint64_t v27;
  MLFeatureValue *predictedClass;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)MLClassifierResult;
  v11 = -[MLClassifierResult init](&v36, sel_init);
  v12 = v11;
  if (v11)
  {
    v30 = v10;
    v11->_predictedClassFeatureType = a4;
    objc_storeStrong((id *)&v11->_classProbability, a3);
    objc_storeStrong((id *)&v12->_additionalFeatures, a5);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v31 = v9;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v33;
      v18 = &unk_1E3DA2B60;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v20, v30);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          v23 = v22;
          objc_msgSend(v18, "doubleValue");
          if (v23 > v24)
          {
            v25 = v21;

            v26 = v20;
            v16 = v26;
            v18 = v25;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
      v18 = &unk_1E3DA2B60;
    }

    +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", (int)objc_msgSend(v16, "intValue"));
    v27 = objc_claimAutoreleasedReturnValue();
    predictedClass = v12->_predictedClass;
    v12->_predictedClass = (MLFeatureValue *)v27;

    v10 = v30;
    v9 = v31;
  }

  return v12;
}

- (MLClassifierResult)initWithClassProbability:(id)a3 additionalFeatures:(id)a4 classLabelOfMaxProbability:(id)a5
{
  id v9;
  id v10;
  id v11;
  MLClassifierResult *v12;
  MLClassifierResult *v13;
  uint64_t v14;
  MLFeatureValue *predictedClass;
  MLClassifierResult *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MLClassifierResult;
  v12 = -[MLClassifierResult init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_classProbability, a3);
    objc_storeStrong((id *)&v13->_additionalFeatures, a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13->_predictedClassFeatureType = 1;
      +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", (int)objc_msgSend(v11, "intValue"));
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = 0;
        goto LABEL_8;
      }
      v13->_predictedClassFeatureType = 3;
      +[MLFeatureValue featureValueWithString:](MLFeatureValue, "featureValueWithString:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    predictedClass = v13->_predictedClass;
    v13->_predictedClass = (MLFeatureValue *)v14;

  }
  v16 = v13;
LABEL_8:

  return v16;
}

- (MLFeatureValue)predictedClass
{
  return (MLFeatureValue *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)classProbability
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)predictedClassFeatureType
{
  return self->_predictedClassFeatureType;
}

- (MLFeatureProvider)additionalFeatures
{
  return (MLFeatureProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalFeatures, 0);
  objc_storeStrong((id *)&self->_classProbability, 0);
  objc_storeStrong((id *)&self->_predictedClass, 0);
}

+ (id)resultWithStringClassProbability:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStringClassProbability:classFeatureType:additionalFeatures:", v4, 3, 0);

  return v5;
}

+ (id)resultWithIntClassProbability:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIntClassProbability:classFeatureType:additionalFeatures:", v4, 1, 0);

  return v5;
}

+ (id)resultWithStringClassProbability:(id)a3 additionalFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStringClassProbability:classFeatureType:additionalFeatures:", v7, 3, v6);

  return v8;
}

+ (id)resultWithIntClassProbability:(id)a3 additionalFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIntClassProbability:classFeatureType:additionalFeatures:", v7, 1, v6);

  return v8;
}

+ (id)resultWithClassProbability:(id)a3 additionalFeatures:(id)a4 classLabelOfMaxProbability:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClassProbability:additionalFeatures:classLabelOfMaxProbability:", v10, v9, v8);

  return v11;
}

@end
