@implementation MLClassConfidenceThresholding

- (MLClassConfidenceThresholding)initWithDescription:(id)a3 configuration:(id)a4 precisionRecallCurves:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  MLClassConfidenceThresholding *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MLParameterContainer *parameterContainer;
  MLParameterContainer *v19;
  void *v20;
  MLFeatureProviderConformer *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  MLFeatureProviderConformer *inputFeatureConformer;
  MLClassConfidenceThresholding *v26;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MLClassConfidenceThresholding;
  v13 = -[MLModel initWithDescription:configuration:](&v28, sel_initWithDescription_configuration_, v10, v11);
  +[MLParameterKey precisionRecallCurves](MLParameterKey, "precisionRecallCurves");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parameterDescriptionsByKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterContainer parameterContainerFor:descriptions:](MLParameterContainer, "parameterContainerFor:descriptions:", v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  parameterContainer = v13->_parameterContainer;
  v13->_parameterContainer = (MLParameterContainer *)v17;

  v19 = v13->_parameterContainer;
  +[MLParameterKey precisionRecallCurves](MLParameterKey, "precisionRecallCurves");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[MLParameterContainer setCurrentValue:forKey:error:](v19, "setCurrentValue:forKey:error:", v12, v20, a6);

  if ((a6 & 1) != 0)
  {
    v21 = [MLFeatureProviderConformer alloc];
    objc_msgSend(v10, "inputDescriptionsByName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MLFeatureProviderConformer initWithFeatureDescriptions:defaultValues:usingRank5Mapping:optionalInputTypes:passthroughStateFeatures:](v21, "initWithFeatureDescriptions:defaultValues:usingRank5Mapping:optionalInputTypes:passthroughStateFeatures:", v23, MEMORY[0x1E0C9AA70], 0, MEMORY[0x1E0C9AA70], 0);
    inputFeatureConformer = v13->_inputFeatureConformer;
    v13->_inputFeatureConformer = (MLFeatureProviderConformer *)v24;

    v26 = v13;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (!objc_msgSend(v6, "hasGlobalScope")
    || (-[MLParameterContainer currentParameterValues](self->_parameterContainer, "currentParameterValues"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (a4)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Class Confidence Thresholding Model does not have a parameter for requested key %@."), v6);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  MLPredictionEvent *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  MLDictionaryFeatureProvider *v16;
  void *v17;
  void *v18;
  MLMultiArray *v19;
  void *v20;
  void *v21;
  MLMultiArray *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MLDictionaryFeatureProvider *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(_QWORD);
  void *v38;
  id v39;
  void *v40;
  _QWORD aBlock[6];
  id v42[7];
  void *v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v39 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v8 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v42, v8, 40, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v39, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v9 = -[MLModel signpostID](self, "signpostID");
  v10 = objc_msgSend(v39, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__MLClassConfidenceThresholding_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  v36 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLClassConfidenceThresholding inputFeatureConformer](self, "inputFeatureConformer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "conformFeatures:error:", v7, a5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[MLModel modelDescription](self, "modelDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputFeatureNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "featureValueForName:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "multiArrayValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v40, "count");
    v15 = objc_msgSend(v40, "dataType");
    if (v15 == 131104)
    {
      if (a5)
      {
        +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Data type of input MLMultiArray is Int32, expected a floating point type."));
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      -[MLModel modelDescription](self, "modelDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "outputFeatureNames");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = [MLMultiArray alloc];
      v47[0] = &unk_1E3DA2350;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[MLMultiArray initWithShape:dataType:error:](v19, "initWithShape:dataType:error:", v21, v15, a5);

      if (v14)
      {
        for (i = 0; i != v14; ++i)
        {
          objc_msgSend(v40, "objectAtIndexedSubscript:", i);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v46[0] = &unk_1E3DA2368;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", i);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v46[1] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLMultiArray setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v24, v26);

          v45[0] = &unk_1E3DA2380;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", i);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v45[1] = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLMultiArray setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", &unk_1E3DA1D58, v28);

        }
      }
      v29 = [MLDictionaryFeatureProvider alloc];
      v43 = v33;
      +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v29, "initWithDictionary:error:", v31, a5);

    }
  }
  else
  {
    v16 = 0;
  }
  v36[2](v36);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v42);
  return v16;
}

- (MLParameterContainer)parameterContainer
{
  return self->_parameterContainer;
}

- (void)setParameterContainer:(id)a3
{
  objc_storeStrong((id *)&self->_parameterContainer, a3);
}

- (MLFeatureProviderConformer)inputFeatureConformer
{
  return self->_inputFeatureConformer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFeatureConformer, 0);
  objc_storeStrong((id *)&self->_parameterContainer, 0);
}

uint64_t __70__MLClassConfidenceThresholding_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  CoreML::Specification::protobuf_ClassConfidenceThresholding_2eproto *v11;
  CoreML::Specification::protobuf_ClassConfidenceThresholding_2eproto *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  const CoreML::Specification::FloatVector *v19;
  void *v20;
  const CoreML::Specification::FloatVector *v21;
  void *v22;
  const CoreML::Specification::FloatVector *v23;
  void *v24;
  const CoreML::Specification::FloatVector *v25;
  void *v26;
  MLPrecisionRecallCurve *v27;
  void *v28;
  void *v29;
  id *v31;
  id v32;

  v8 = a4;
  v9 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v10 = objc_alloc((Class)a1);
  v11 = (CoreML::Specification::protobuf_ClassConfidenceThresholding_2eproto *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v12 = v11;
  v32 = v8;
  v31 = a5;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 560)
  {
    v13 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_ClassConfidenceThresholding_2eproto::InitDefaults(v11);
    v13 = &CoreML::Specification::_ClassConfidenceThresholding_default_instance_;
  }
  v14 = v13[4];
  if (v14)
    v15 = v14 + 8;
  else
    v15 = 0;
  v16 = *((int *)v13 + 6);
  if ((_DWORD)v16)
  {
    v17 = 8 * v16;
    do
    {
      v18 = *(_QWORD **)v15;
      if (*(_QWORD *)(*(_QWORD *)v15 + 16))
        v19 = *(const CoreML::Specification::FloatVector **)(*(_QWORD *)v15 + 16);
      else
        v19 = (const CoreML::Specification::FloatVector *)&CoreML::Specification::_FloatVector_default_instance_;
      NSArrayFromFloatVector(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18[3])
        v21 = (const CoreML::Specification::FloatVector *)v18[3];
      else
        v21 = (const CoreML::Specification::FloatVector *)&CoreML::Specification::_FloatVector_default_instance_;
      NSArrayFromFloatVector(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18[4])
        v23 = (const CoreML::Specification::FloatVector *)v18[4];
      else
        v23 = (const CoreML::Specification::FloatVector *)&CoreML::Specification::_FloatVector_default_instance_;
      NSArrayFromFloatVector(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18[5])
        v25 = (const CoreML::Specification::FloatVector *)v18[5];
      else
        v25 = (const CoreML::Specification::FloatVector *)&CoreML::Specification::_FloatVector_default_instance_;
      NSArrayFromFloatVector(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[MLPrecisionRecallCurve initWithPrecisionValues:precisionConfidenceThresholds:recallValues:recallConfidenceThresholds:]([MLPrecisionRecallCurve alloc], "initWithPrecisionValues:precisionConfidenceThresholds:recallValues:recallConfidenceThresholds:", v20, v22, v24, v26);
      -[CoreML::Specification::protobuf_ClassConfidenceThresholding_2eproto addObject:](v12, "addObject:", v27);

      v15 += 8;
      v17 -= 8;
    }
    while (v17);
  }
  v28 = v32;
  v29 = (void *)objc_msgSend(v10, "initWithDescription:configuration:precisionRecallCurves:error:", v9, v32, v12, v31, v10, v31, v9, v32);

  return v29;
}

@end
