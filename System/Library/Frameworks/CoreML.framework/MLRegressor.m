@implementation MLRegressor

- (id)regressorResultFromOutputFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MLModel modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictedFeatureName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModel modelDescription](self, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputDescriptionsByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");

  if (v8)
  {
    if (v12 == 2 || v12 == 5)
    {
      objc_msgSend(v6, "featureValueForName:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "type") == v12)
        {
          v15 = objc_msgSend(v14, "type");
          if (v15 == 5)
          {
            objc_msgSend(v14, "multiArrayValue");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLRegressorResult resultWithValue:additionalFeatures:](MLRegressorResult, "resultWithValue:additionalFeatures:", v24, v6);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_24;
          }
          if (v15 == 2)
          {
            v16 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v14, "doubleValue");
            objc_msgSend(v16, "numberWithDouble:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = v17;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLMultiArray doubleVectorWithValues:](MLMultiArray, "doubleVectorWithValues:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            +[MLRegressorResult resultWithValue:additionalFeatures:](MLRegressorResult, "resultWithValue:additionalFeatures:", v19, v6);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
            goto LABEL_25;
          }
          if (a4)
          {
            +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Regressed feature named '%@' is not a Double or MultiArray"), v8);
            goto LABEL_23;
          }
        }
        else if (a4)
        {
          +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v14, "type"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Predicted feature '%@' is of type %@ not the expected %@"), v8, v22, v23);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else if (a4)
      {
        +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Predicted feature named '%@' was not output by pipeline"), v8);
LABEL_23:
        v20 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      v20 = 0;
      goto LABEL_24;
    }
    if (a4)
    {
      v26 = v8;
      v21 = CFSTR("Invalid regressor: predicted feature '%@' is not described as double or MultiArray");
      goto LABEL_13;
    }
LABEL_14:
    v20 = 0;
    goto LABEL_25;
  }
  if (!a4)
    goto LABEL_14;
  v21 = CFSTR("Cannot determine predictedFeatureName for this regressor");
LABEL_13:
  +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v21, v26);
  v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v20;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[MLRegressor predictionFromFeatures:regressor:options:error:](MLRegressor, "predictionFromFeatures:regressor:options:error:", v8, self, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predictionFromFeatures:(id)a3 regressor:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a4;
  objc_msgSend(v9, "regress:options:error:", a3, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictedValueFeatureDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_2;
  objc_msgSend(v9, "modelDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_6;
  objc_msgSend(v9, "modelDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "outputDescriptionsByName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predictedFeatureName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
LABEL_2:
    objc_msgSend(v10, "asFeatureDictionaryWithPredictedValueDescription:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    if (a6)
    {
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Cannot determine valueDescription for this regressor"));
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)initDescriptionOnlyWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  MLRegressor *v12;
  objc_super v14;

  v8 = a4;
  v9 = -[MLModelAssetDescription initFromModelSpecification:]([MLModelAssetDescription alloc], "initFromModelSpecification:", a3);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "defaultModelDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "validateAsRegressorDescriptionAndReturnError:", a5) & 1) != 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)MLRegressor;
      self = -[MLModel initWithDescription:configuration:](&v14, sel_initWithDescription_configuration_, v11, v8);
      v12 = self;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MLRegressor)initWithDescription:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLRegressor *v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "validateAsRegressorDescriptionAndReturnError:", a5) & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)MLRegressor;
    self = -[MLModel initWithDescription:configuration:](&v12, sel_initWithDescription_configuration_, v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("regress:error must be implemented by derived class!"), a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end
