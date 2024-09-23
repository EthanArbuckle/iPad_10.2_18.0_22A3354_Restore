@implementation MLClassifier

- (MLClassifier)initWithDescription:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLClassifier *v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "validateAsClassifierDescriptionAndReturnError:", a5) & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)MLClassifier;
    self = -[MLModel initWithDescription:configuration:](&v12, sel_initWithDescription_configuration_, v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_needsToEmulateAsyncClassificationUsingQueue:(id *)a3
{
  os_unfair_lock_s *p_asyncClassifierQueueLock;
  _BOOL4 supportsAsyncClassification;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *asyncClassifierQueue;
  OS_dispatch_queue *v9;

  p_asyncClassifierQueueLock = &self->_asyncClassifierQueueLock;
  os_unfair_lock_lock(&self->_asyncClassifierQueueLock);
  supportsAsyncClassification = self->_supportsAsyncClassification;
  if (!self->_supportsAsyncClassification)
  {
    if (self->_asyncClassifierQueue)
    {
      supportsAsyncClassification = 0;
    }
    else
    {
      if (-[MLClassifier conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE43CA10))
      {
        v7 = 0;
        self->_supportsAsyncClassification = 1;
      }
      else
      {
        self->_supportsAsyncClassification = 0;
        v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreml.AsyncClassifierQueue", 0);
      }
      asyncClassifierQueue = self->_asyncClassifierQueue;
      self->_asyncClassifierQueue = v7;

      supportsAsyncClassification = self->_supportsAsyncClassification;
    }
  }
  v9 = self->_asyncClassifierQueue;
  os_unfair_lock_unlock(p_asyncClassifierQueueLock);
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return !supportsAsyncClassification;
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
  +[MLClassifier predictionFromFeatures:classifier:options:error:](MLClassifier, "predictionFromFeatures:classifier:options:error:", v8, self, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  MLClassifier *v15;
  MLClassifier *v16;
  _QWORD v17[4];
  MLClassifier *v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "The input feature provider cannot be nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The input feature provider cannot be nil."));
  }
  if (v9)
  {
    if (v10)
      goto LABEL_12;
  }
  else
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_12;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "The completion handler cannot be nil.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completion handler cannot be nil."));
LABEL_12:
  v24 = 0;
  v13 = -[MLClassifier _needsToEmulateAsyncClassificationUsingQueue:](self, "_needsToEmulateAsyncClassificationUsingQueue:", &v24);
  v14 = v24;
  if (v13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MLClassifier_predictionFromFeatures_options_completionHandler___block_invoke;
    block[3] = &unk_1E3D64B90;
    block[4] = self;
    v21 = v8;
    v22 = v9;
    v23 = v10;
    dispatch_async(v14, block);

  }
  else
  {
    v15 = self;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__MLClassifier_predictionFromFeatures_options_completionHandler___block_invoke_2;
    v17[3] = &unk_1E3D64BB8;
    v18 = v15;
    v19 = v10;
    v16 = v15;
    -[MLClassifier classify:options:completionHandler:](v16, "classify:options:completionHandler:", v8, v9, v17);

  }
}

- (id)classLabels
{
  return 0;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("classify:topK:error be implemented by derived class!"), a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncClassifierQueue, 0);
}

void __65__MLClassifier_predictionFromFeatures_options_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v2 = (void *)objc_opt_class();
  v4 = a1[4];
  v3 = a1[5];
  v5 = a1[6];
  v8 = 0;
  objc_msgSend(v2, "predictionFromFeatures:classifier:options:error:", v3, v4, v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  (*(void (**)(void))(a1[7] + 16))();

}

void __65__MLClassifier_predictionFromFeatures_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "modelDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predictedClassFeatureDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modelDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "classProbabilityFeatureDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asFeatureDictionaryWithPredictedClassDescription:classProbabilityDescription:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)classifierResultFromOutputFeatures:(id)a3 error:(id *)a4
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
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
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
    if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      -[MLModel modelDescription](self, "modelDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predictedProbabilitiesName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[MLModel modelDescription](self, "modelDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "outputDescriptionsByName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "type");

      if (v14 && v18 != 6)
      {
        if (a4)
        {
          +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Invalid classifier: predicted probs '%@' is not described as dictionary"), v14);
          v19 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }
        goto LABEL_37;
      }
      if (v14)
      {
        objc_msgSend(v6, "featureValueForName:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = v21;
          if (objc_msgSend(v21, "type") == v18)
          {
            objc_msgSend(v22, "dictionaryValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12 == 1)
              +[MLClassifierResult resultWithIntClassProbability:additionalFeatures:](MLClassifierResult, "resultWithIntClassProbability:additionalFeatures:", v23, v6);
            else
              +[MLClassifierResult resultWithStringClassProbability:additionalFeatures:](MLClassifierResult, "resultWithStringClassProbability:additionalFeatures:", v23, v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
          if (a4)
          {
            +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v22, "type"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Predicted probabilities '%@' is of type %@ not the expected %@"), v8, v23, v28);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            v19 = 0;
LABEL_35:

            goto LABEL_36;
          }
          goto LABEL_30;
        }
      }
      objc_msgSend(v6, "featureValueForName:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v24;
      if (v24)
      {
        if (objc_msgSend(v24, "type") == v12)
        {
          v25 = objc_msgSend(v22, "type");
          if (v25 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v22, "int64Value"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v23;
            v34 = &unk_1E3DA2410;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v26);
            v27 = objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
          }
          if (v25 == 3)
          {
            objc_msgSend(v22, "stringValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v23;
            v36[0] = &unk_1E3DA2410;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v26);
            v27 = objc_claimAutoreleasedReturnValue();
LABEL_34:
            v19 = (void *)v27;

            goto LABEL_35;
          }
        }
        else if (a4)
        {
          +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v22, "type"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", v12);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Predicted feature '%@' is of type %@ not the expected %@"), v8, v29, v30);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else if (a4)
      {
        +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Predicted feature named '%@' was not output by pipeline"), v8);
        v19 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
LABEL_30:
      v19 = 0;
      goto LABEL_36;
    }
    if (a4)
    {
      v32 = v8;
      v20 = CFSTR("Invalid classifier: predicted feature '%@' is not described as int or string");
      goto LABEL_11;
    }
LABEL_12:
    v19 = 0;
    goto LABEL_38;
  }
  if (!a4)
    goto LABEL_12;
  v20 = CFSTR("Cannot determine predictedFeatureName for this classifier");
LABEL_11:
  +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v20, v32);
  v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v19;
}

+ (id)predictionFromFeatures:(id)a3 classifier:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a4;
  objc_msgSend(v9, "classify:options:error:", a3, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictedClassFeatureDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "classProbabilityFeatureDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asFeatureDictionaryWithPredictedClassDescription:classProbabilityDescription:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)initDescriptionOnlyWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MLClassifier;
  v9 = -[MLModel initDescriptionOnlyWithSpecification:configuration:error:](&v15, sel_initDescriptionOnlyWithSpecification_configuration_error_, a3, v8, a5);
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "modelDescription"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "validateAsClassifierDescriptionAndReturnError:", a5),
        v11,
        (v12 & 1) == 0))
  {
    v13 = 0;
  }
  else
  {
    v13 = v10;
  }

  return v13;
}

@end
