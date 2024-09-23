@implementation MLModel

- (MLModel)initWithDescription:(id)a3
{
  id v4;
  void *v5;
  MLModel *v6;

  v4 = a3;
  +[MLModelConfiguration defaultConfiguration](MLModelConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLModel initWithDescription:configuration:](self, "initWithDescription:configuration:", v4, v5);

  return v6;
}

- (MLModel)initWithDescription:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  MLModel *v9;
  MLModel *v10;
  MLPredictionEvent *v11;
  MLPredictionEvent *predictionEvent;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *asyncPredictionQueue;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MLModel;
  v9 = -[MLModel init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelDescription, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v10->_signpostID = +[MLModel generateSignpostId](MLModel, "generateSignpostId");
    atomic_store(0, (unsigned __int8 *)&v10->_emittedDetailsToInstruments);
    atomic_store(1uLL, &v10->_nextPredictionRequestID.__a_.__a_value);
    v11 = objc_alloc_init(MLPredictionEvent);
    predictionEvent = v10->_predictionEvent;
    v10->_predictionEvent = v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.coreml.DefaultAsyncPredictionQueue", v13);
    asyncPredictionQueue = v10->_asyncPredictionQueue;
    v10->_asyncPredictionQueue = (OS_dispatch_queue *)v14;

  }
  return v10;
}

+ (unint64_t)generateSignpostId
{
  NSObject *v2;
  os_signpost_id_t v3;

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  return v3;
}

- (void)enableInstrumentsTracingIfNeeded
{
  _BOOL4 v3;
  unsigned __int8 v4;

  if (-[MLModelConfiguration allowsInstrumentation](self->_configuration, "allowsInstrumentation"))
  {
    if (MLLoggingGetInstrumentsActiveChannel_onceToken != -1)
      dispatch_once(&MLLoggingGetInstrumentsActiveChannel_onceToken, &__block_literal_global_14);
    v3 = os_signpost_enabled((os_log_t)MLLoggingGetInstrumentsActiveChannel_instrumentsActiveChannel);
    v4 = atomic_load((unsigned __int8 *)&self->_emittedDetailsToInstruments);
    if (v3)
    {
      if ((v4 & 1) != 0)
      {
        atomic_load((unsigned __int8 *)&self->_emittedDetailsToInstruments);
      }
      else
      {
        -[MLModel enableInstrumentsTracing](self, "enableInstrumentsTracing");
        atomic_store(1u, (unsigned __int8 *)&self->_emittedDetailsToInstruments);
      }
    }
    else if ((v4 & 1) != 0)
    {
      atomic_store(0, (unsigned __int8 *)&self->_emittedDetailsToInstruments);
    }
  }
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (MLPredictionEvent)predictionEvent
{
  return self->_predictionEvent;
}

- (void)setDecryptSession:(id)a3
{
  objc_storeStrong((id *)&self->_decryptSession, a3);
}

+ (MLModel)modelWithContentsOfURL:(NSURL *)url configuration:(MLModelConfiguration *)configuration error:(NSError *)error
{
  NSURL *v7;
  MLModelConfiguration *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSError *v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[8];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = url;
  v8 = configuration;
  if (!v7)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "nil value for URL", buf, 2u);
    }

    if (!error)
    {
      v19 = 0;
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nil value for URL"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v25[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v17);
    v18 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v19 = 0;
    *error = v18;
    goto LABEL_14;
  }
  v9 = (void *)MEMORY[0x1A1AD6ED8]();
  v22 = 0;
  +[MLModelAsset modelAssetWithURL:error:](MLModelAsset, "modelAssetWithURL:error:", v7, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  if (v10)
  {
    v12 = (void *)-[MLModelConfiguration copy](v8, "copy");
    v21 = v11;
    objc_msgSend(v10, "modelWithConfiguration:error:", v12, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;

    v11 = v14;
  }
  else
  {
    v13 = 0;
  }

  objc_autoreleasePoolPop(v9);
  if (!v13)
  {
    if (!error)
    {
      v17 = 0;
      v19 = 0;
      goto LABEL_14;
    }
    v18 = (NSError *)objc_retainAutorelease(v11);
    v11 = v18;
    v17 = 0;
    goto LABEL_13;
  }
  v17 = v13;
  v19 = v17;
LABEL_14:

LABEL_15:
  return (MLModel *)v19;
}

- (unint64_t)nextPredictionRequestID
{
  atomic<unsigned long long> *p_nextPredictionRequestID;
  unint64_t result;

  p_nextPredictionRequestID = &self->_nextPredictionRequestID;
  do
    result = __ldaxr(&p_nextPredictionRequestID->__a_.__a_value);
  while (__stlxr(result + 1, &p_nextPredictionRequestID->__a_.__a_value));
  return result;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_predictionEvent, 0);
  objc_storeStrong((id *)&self->_decryptSession, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_asyncPredictionQueue, 0);
}

- (id)predictionFromFeatures:(id)input error:(NSError *)error
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v6 = input;
  v7 = (void *)MEMORY[0x1A1AD6ED8]();
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[MLModel predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v8, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;

  objc_autoreleasePoolPop(v7);
  if (error && !v9)
    *error = (NSError *)objc_retainAutorelease(v10);

  return v9;
}

+ (int64_t)maxPredictionsInFlight
{
  return 2;
}

void __61__MLModel_loadContentsOfURL_configuration_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a1[4];
  v3 = a1[5];
  v6 = 0;
  +[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", v2, v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)vectorizeInput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[MLModel modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputFeatureNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:featureNames:error:](MLFeatureProviderUtils, "vectorizeFeaturesProvidedBy:featureNames:error:", v6, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;

  return v10;
}

+ (void)loadContentsOfURL:(NSURL *)url configuration:(MLModelConfiguration *)configuration completionHandler:(void *)handler
{
  NSURL *v7;
  MLModelConfiguration *v8;
  void *v9;
  NSObject *v10;
  id v11;
  MLModelConfiguration *v12;
  NSURL *v13;
  _QWORD block[4];
  NSURL *v15;
  MLModelConfiguration *v16;
  id v17;

  v7 = url;
  v8 = configuration;
  v9 = handler;
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MLModel_loadContentsOfURL_configuration_completionHandler___block_invoke;
  block[3] = &unk_1E3D669A0;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, block);

}

- (id)initDescriptionOnlyWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  MLModel *v9;

  v7 = a4;
  v8 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v9 = -[MLModel initWithDescription:configuration:](self, "initWithDescription:configuration:", v8, v7);

  return v9;
}

- (id)objectBoundingBoxOutputDescription
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  -[MLModel internalEngine](self, "internalEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    -[MLModel pipeline](self, "pipeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "models");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "internalEngine");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v11, "internalEngine");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

    if (v5)
      goto LABEL_3;
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  -[MLModel internalEngine](self, "internalEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
LABEL_3:
  objc_msgSend(v5, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectBoundingBoxOutputDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v7;
}

+ (NSArray)availableComputeDevices
{
  void *v2;
  void *v3;

  +[MLAllComputeDeviceRegistry sharedRegistry](MLAllComputeDeviceRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registeredAndAccessibleComputeDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)initInterfaceAndMetadataWithCompiledArchive:(void *)a3 error:(id *)a4
{
  id v7;
  void *v8;
  MLModelConfiguration *v9;
  MLModel *v10;
  MLModel *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  CoreML::Specification::ModelDescription *v16;
  std::__shared_weak_count *v17;

  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v16);
  if (+[MLModelIOUtils deserializeInterfaceFormat:archive:error:](MLModelIOUtils, "deserializeInterfaceFormat:archive:error:", &v16, a3, a4))
  {
    v7 = -[MLModelAssetDescription initFromModelDescriptionSpecification:]([MLModelAssetDescription alloc], "initFromModelDescriptionSpecification:", &v16);
    objc_msgSend(v7, "defaultModelDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MLModelConfiguration);
    v10 = -[MLModel initWithDescription:configuration:](self, "initWithDescription:configuration:", v8, v9);

    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }
  v12 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  return v11;
}

+ (BOOL)serializeInterfaceAndMetadata:(void *)a3 toArchive:(void *)a4 error:(id *)a5
{
  const CoreML::Specification::ModelDescription *v7;
  BOOL v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
    v7 = *(const CoreML::Specification::ModelDescription **)(*(_QWORD *)a3 + 16);
  else
    v7 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)&v13, v7);
  v8 = +[MLModelIOUtils serializeInterfaceFormat:archive:error:](MLModelIOUtils, "serializeInterfaceFormat:archive:error:", &v13, a4, a5);
  v9 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v8;
}

- (id)pipelineOfPostVisionFeaturePrintModelsFromPipeline:(id)a3
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  MLModelDescription *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MLModelDescription *v16;
  MLPipeline *v17;
  void *v18;
  MLPipeline *v19;
  MLDelegateModel *v20;
  void *v22;
  id v23;
  id v24;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v23 = a3;
  v24 = objc_alloc_init(v3);
  objc_msgSend(v23, "models");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "models");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [MLModelDescription alloc];
  objc_msgSend(v22, "modelDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDescriptionsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "outputDescriptionsByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predictedFeatureName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predictedProbabilitiesName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:trainingInputDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:](v7, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:trainingInputDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:", v9, v11, v13, v15, 0, 0, 0, 0);

  objc_msgSend(v24, "addObject:", v22);
  objc_msgSend(v24, "addObject:", v6);
  v17 = [MLPipeline alloc];
  objc_msgSend(v23, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[MLPipeline initWithModels:modelNames:description:configuration:](v17, "initWithModels:modelNames:description:configuration:", v24, &unk_1E3DA2960, v16, v18);
  v20 = -[MLDelegateModel initWithEngine:error:]([MLDelegateModel alloc], "initWithEngine:error:", v19, 0);

  return v20;
}

- (id)visionFeaturePrintInfo
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MLModelVisionFeaturePrintInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[MLModel pipeline](self, "pipeline");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MLModel internalEngine](self, "internalEngine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v4 = 0;
      goto LABEL_13;
    }
    -[MLModel internalEngine](self, "internalEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "models");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 >= 2)
    {
      objc_msgSend(v4, "models");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = 0;
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(v8, "parameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "featureExtractorParameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_alloc_init(MLModelVisionFeaturePrintInfo);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MLModelVisionFeaturePrintInfo setVersion:](v11, "setVersion:", objc_msgSend(v10, "scenePrintVersion"));
        objc_msgSend(v4, "models");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLModelVisionFeaturePrintInfo setPostVisionFeaturePrintModel:](v11, "setPostVisionFeaturePrintModel:", v13);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_17:
          -[MLModelVisionFeaturePrintInfo setFeatureExtractorParameters:](v11, "setFeatureExtractorParameters:", v10);

          goto LABEL_18;
        }
        -[MLModelVisionFeaturePrintInfo setVersion:](v11, "setVersion:", objc_msgSend(v10, "objectPrintVersion"));
        -[MLModel pipelineOfPostVisionFeaturePrintModelsFromPipeline:](self, "pipelineOfPostVisionFeaturePrintModelsFromPipeline:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLModelVisionFeaturePrintInfo setPostVisionFeaturePrintModel:](v11, "setPostVisionFeaturePrintModel:", v12);
      }

      goto LABEL_17;
    }
  }
LABEL_13:
  v11 = 0;
LABEL_19:

  return v11;
}

- (MLModel)initWithConfiguration:(id)a3
{
  id v5;
  MLModel *v6;
  MLModel *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *asyncPredictionQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLModel;
  v6 = -[MLModel init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_signpostID = +[MLModel generateSignpostId](MLModel, "generateSignpostId");
    atomic_store(0, (unsigned __int8 *)&v7->_emittedDetailsToInstruments);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.coreml.DefaultAsyncPredictionQueue", v8);
    asyncPredictionQueue = v7->_asyncPredictionQueue;
    v7->_asyncPredictionQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (MLModel)initWithName:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7 configuration:(id)a8
{
  id v11;
  id v12;
  id v13;
  MLModelDescription *v14;
  MLModelDescription *v15;
  MLModel *v16;

  v11 = a4;
  v12 = a5;
  v13 = a8;
  v14 = [MLModelDescription alloc];
  v15 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:trainingInputDescriptions:metadata:](v14, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:trainingInputDescriptions:metadata:", v11, v12, 0, 0, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
  v16 = -[MLModel initWithDescription:configuration:](self, "initWithDescription:configuration:", v15, v13);

  return v16;
}

- (BOOL)supportsConcurrentSubmissions
{
  NSObject *v2;
  uint8_t v4[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19C486000, v2, OS_LOG_TYPE_ERROR, "MLModel will not conform to MLModeling and therefore you should not call this method.", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("MLModel will not conform to MLModeling and therefore you should not call this method."));
  return 0;
}

- (unint64_t)predictionTypeForKTrace
{
  return 0;
}

- (BOOL)recordsPredictionEvent
{
  NSObject *v2;
  uint8_t v4[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19C486000, v2, OS_LOG_TYPE_ERROR, "MLModel will not conform to MLModeling and therefore you should not call this method.", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("MLModel will not conform to MLModeling and therefore you should not call this method."));
  return 0;
}

- (id)newRequestForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5 error:(id *)a6
{
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't implement %@.", buf, 0x16u);

  }
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This model engine (%@) doesn't implement %@."), v10, v11);

  return 0;
}

- (void)prepareWithConcurrencyHint:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_error_impl(&dword_19C486000, v4, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't implement %@.", buf, 0x16u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This model engine (%@) doesn't implement %@."), v7, v8);

}

- (id)newState
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1A1AD6ED8](self, a2);
  v4 = -[MLModel newStateWithClientBuffers:](self, "newStateWithClientBuffers:", MEMORY[0x1E0C9AA70]);
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)newStateWithClientBuffers:(id)a3
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_class *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_error_impl(&dword_19C486000, v4, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't implement %@.", buf, 0x16u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This model engine (%@) doesn't implement %@."), v7, v8);

  return 0;
}

- (id)executionSchedule
{
  MLModelExecutionSchedule *v3;
  MLLayerExecutionSchedule *v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MLModelExecutionSchedule);
  v4 = -[MLLayerExecutionSchedule initWithLayerError:]([MLLayerExecutionSchedule alloc], "initWithLayerError:", 2);
  -[MLModel modelPath](self, "modelPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModelExecutionSchedule setModelExecutionSchedule:](v3, "setModelExecutionSchedule:", v6);
  return v3;
}

- (void)setModelPath:(id)a3 modelName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v9, "copy");
  -[MLModelDescription setModelPath:](self->_modelDescription, "setModelPath:", v7);

  -[MLModelDescription modelPath](self->_modelDescription, "modelPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPathComponent:", v6);

}

- (id)modelPath
{
  void *v2;
  void *v3;
  void *v4;

  -[MLModel modelDescription](self, "modelDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)predictionFromFeatures:(id)input options:(MLPredictionOptions *)options error:(NSError *)error
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel", input, options);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "Missing predictionFromFeatures:options:error: implementation", v11, 2u);
  }

  if (error)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing predictionFromFeatures:options:error: implementation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v9);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  +[MLState emptyState](MLState, "emptyState");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v12)
  {
    -[MLModel predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v11, v13, a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v23;
      v27 = 2112;
      v28 = v24;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't implement %@.", buf, 0x16u);

    }
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This model engine (%@) doesn't implement %@."), v18, v19);

    v20 = 0;
  }

  return v20;
}

- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1AD6ED8]();
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  -[MLModel predictionFromFeatures:usingState:options:error:](self, "predictionFromFeatures:usingState:options:error:", v8, v9, v11, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;

  objc_autoreleasePoolPop(v10);
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "The prediction request cannot be nil.", v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The prediction request cannot be nil."));
  }
  objc_msgSend(v6, "inputFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictionOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel predictionFromFeatures:options:completionHandler:](self, "predictionFromFeatures:options:completionHandler:", v9, v10, v7);

}

- (void)predictionFromFeatures:(id)input completionHandler:(void *)completionHandler
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = input;
  v6 = completionHandler;
  v7 = (void *)MEMORY[0x1A1AD6ED8]();
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel predictionFromFeatures:options:completionHandler:](self, "predictionFromFeatures:options:completionHandler:", v9, v8, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)predictionFromFeatures:(id)input options:(MLPredictionOptions *)options completionHandler:(void *)completionHandler
{
  MLPredictionOptions *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = input;
  v8 = options;
  v9 = completionHandler;
  +[MLState emptyState](MLState, "emptyState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel predictionFromFeatures:usingState:options:completionHandler:](self, "predictionFromFeatures:usingState:options:completionHandler:", v11, v10, v8, v9);

}

- (void)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *asyncPredictionQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "The input feature provider cannot be nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The input feature provider cannot be nil."));
  }
  if (v12)
  {
    if (v13)
      goto LABEL_12;
  }
  else
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_12;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "The completion handler cannot be nil.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completion handler cannot be nil."));
LABEL_12:
  asyncPredictionQueue = self->_asyncPredictionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MLModel_predictionFromFeatures_usingState_options_completionHandler___block_invoke;
  block[3] = &unk_1E3D66480;
  block[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  dispatch_async(asyncPredictionQueue, block);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MLModel modelDescription](self, "modelDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\nmodelDescription: %@, \nconfiguration: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)predictionsFromBatch:(id)inputBatch error:(NSError *)error
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = inputBatch;
  v7 = (void *)MEMORY[0x1A1AD6ED8]();
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel predictionsFromBatch:options:error:](self, "predictionsFromBatch:options:error:", v6, v8, error);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  if (error && !v9)
    *error = 0;

  return v9;
}

- (id)predictionsFromBatch:(id)inputBatch options:(MLPredictionOptions *)options error:(NSError *)error
{
  id v8;
  MLPredictionOptions *v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  _QWORD v15[6];

  v8 = inputBatch;
  v9 = options;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  v10 = -[MLModel signpostID](self, "signpostID");
  v11 = -[MLPredictionOptions parentSignpostID](v9, "parentSignpostID");
  kdebug_trace();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__MLModel_predictionsFromBatch_options_error___block_invoke;
  v15[3] = &__block_descriptor_48_e5_v8__0l;
  v15[4] = v10;
  v15[5] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(v15);
  if (!v9)
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v9 = (MLPredictionOptions *)objc_claimAutoreleasedReturnValue();
  }
  +[MLModel predictionsFromLoopingOverBatch:model:options:error:](MLModel, "predictionsFromLoopingOverBatch:model:options:error:", v8, self, v9, error);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12);

  return v13;
}

- (id)parameterValueForKey:(MLParameterKey *)key error:(NSError *)error
{
  MLParameterKey *v5;

  v5 = key;
  if (error)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Model does not have a parameter for requested key %@."), v5);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (MLModelConfiguration)configuration
{
  return (MLModelConfiguration *)(id)-[MLModelConfiguration copy](self->_configuration, "copy");
}

- (MLProgram)program
{
  return 0;
}

- (MLNeuralNetwork)neuralNetwork
{
  MLModel *v3;

  if (-[MLModel conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE438E48))
    v3 = self;
  else
    v3 = 0;
  return (MLNeuralNetwork *)v3;
}

- (MLWritable)writable
{
  MLModel *v3;

  if (-[MLModel conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE43B688))
    v3 = self;
  else
    v3 = 0;
  return (MLWritable *)v3;
}

- (id)updatable
{
  MLModel *v3;

  if (-[MLModel conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE43B770))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (MLClassifier)classifier
{
  MLModel *v3;

  if (-[MLModel conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE433B68))
    v3 = self;
  else
    v3 = 0;
  return (MLClassifier *)v3;
}

- (MLRegressor)regressor
{
  MLModel *v3;

  if (-[MLModel conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE438EC0))
    v3 = self;
  else
    v3 = 0;
  return (MLRegressor *)v3;
}

- (MLPipeline)pipeline
{
  MLModel *v3;

  if (-[MLModel conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE442268))
    v3 = self;
  else
    v3 = 0;
  return (MLPipeline *)v3;
}

- (void)enableInstrumentsTracing
{
  void *v3;
  __CFString *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  unint64_t signpostID;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  MLModel *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MLModelConfiguration modelDisplayName](self->_configuration, "modelDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MLModelConfiguration modelDisplayName](self->_configuration, "modelDisplayName");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E3D68DC8;
  }

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    signpostID = self->_signpostID;
    v9 = 134218498;
    v10 = signpostID;
    v11 = 2082;
    v12 = -[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
    v13 = 2048;
    v14 = self;
    _os_signpost_emit_with_name_impl(&dword_19C486000, v5, OS_SIGNPOST_EVENT, v7, "MLModel_Generic_Discover", "Model-signpost-id:%lluModel-name:%{public}sModel-address:%llu", (uint8_t *)&v9, 0x20u);
  }

}

- (id)newRequestWithInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = -[MLGenericPredictionRequest initForModel:inputFeatures:options:]([MLGenericPredictionRequest alloc], "initForModel:inputFeatures:options:", self, v7, v8);

  return v9;
}

- (id)newRequestWithInputFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  objc_class *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[MLState emptyState](MLState, "emptyState");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v10)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v20;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support a stateful prediction.", buf, 0xCu);

    }
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This model engine (%@) doesn't support a stateful prediction."), v16);

  }
  v17 = -[MLGenericPredictionRequest initForModel:inputFeatures:options:]([MLGenericPredictionRequest alloc], "initForModel:inputFeatures:options:", self, v9, v11);

  return v17;
}

- (id)newStateForFeatureNamed:(id)a3 initializerBlock:(id)a4
{
  NSObject *v4;
  uint8_t v6[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_19C486000, v4, OS_LOG_TYPE_ERROR, "This model type does not currently support states.", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This model type does not currently support states."));
  return 0;
}

- (MLModelMetadata)metadata
{
  return (MLModelMetadata *)objc_getProperty(self, a2, 40, 1);
}

- (MLFairPlayDecryptSession)decryptSession
{
  return self->_decryptSession;
}

- (void)setPredictionEvent:(id)a3
{
  objc_storeStrong((id *)&self->_predictionEvent, a3);
}

- (void)setModelDescription:(id)a3
{
  objc_storeStrong((id *)&self->_modelDescription, a3);
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

uint64_t __46__MLModel_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

void __71__MLModel_predictionFromFeatures_usingState_options_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v8 = 0;
  objc_msgSend(v2, "predictionFromFeatures:usingState:options:error:", v3, v4, v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  (*(void (**)(void))(a1[8] + 16))();

}

+ (MLModel)modelWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v5;
  void *v6;
  MLModelConfiguration *v7;
  void *v8;
  id v9;
  id v11;

  v5 = url;
  v6 = (void *)MEMORY[0x1A1AD6ED8]();
  v7 = objc_alloc_init(MLModelConfiguration);
  v11 = 0;
  +[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", v5, v7, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;

  objc_autoreleasePoolPop(v6);
  if (error && !v8)
    *error = (NSError *)objc_retainAutorelease(v9);

  return (MLModel *)v8;
}

+ (void)loadModelAsset:(MLModelAsset *)asset configuration:(MLModelConfiguration *)configuration completionHandler:(void *)handler
{
  MLModelAsset *v7;
  MLModelConfiguration *v8;
  void *v9;
  NSObject *v10;
  id v11;
  MLModelConfiguration *v12;
  MLModelAsset *v13;
  _QWORD block[4];
  MLModelAsset *v15;
  MLModelConfiguration *v16;
  id v17;

  v7 = asset;
  v8 = configuration;
  v9 = handler;
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MLModel_loadModelAsset_configuration_completionHandler___block_invoke;
  block[3] = &unk_1E3D669A0;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, block);

}

void __58__MLModel_loadModelAsset_configuration_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v6 = 0;
  objc_msgSend(v2, "modelWithConfiguration:error:", v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();

}

+ (id)predictionsFromLoopingOverBatch:(id)a3 model:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  MLArrayBatchProvider *v28;
  id *v30;
  void *v31;
  uint64_t v32;
  id v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v9, "count");
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
  v14 = (void *)v13;
  v32 = v12;
  if (v12 < 1)
    goto LABEL_14;
  v30 = a6;
  v31 = (void *)v13;
  v15 = 0;
  v16 = 0;
  while (1)
  {
    v17 = (void *)MEMORY[0x1A1AD6ED8]();
    objc_msgSend(v9, "featuresAtIndex:", v15);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      break;
    v19 = (void *)v18;
    v33 = v16;
    objc_msgSend(v10, "predictionFromFeatures:options:error:", v18, v11, &v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v33;

    if (v20)
    {
      objc_msgSend(v14, "addObject:", v20);
      v16 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v22 = v9;
      v23 = v11;
      v24 = v10;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v21, CFSTR("Failed to obtain prediction for sample %@"), v25);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v24;
      v11 = v23;
      v9 = v22;
      v14 = v31;
    }

    objc_autoreleasePoolPop(v17);
    if (v20)
    {
      if (++v15 < v32)
        continue;
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Batch produced nil feature provider for index %@"), v26);
  v27 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v17);
  v16 = (id)v27;
LABEL_11:
  if (v16)
  {
    if (v30)
    {
      v16 = objc_retainAutorelease(v16);
      v28 = 0;
      *v30 = v16;
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
LABEL_14:
    v28 = -[MLArrayBatchProvider initWithFeatureProviderArray:]([MLArrayBatchProvider alloc], "initWithFeatureProviderArray:", v14);
    v16 = 0;
  }

  return v28;
}

+ (id)predictionsFromSubbatchingBatch:(id)a3 maxSubbatchLength:(int64_t)a4 predictionBlock:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  void (**v12)(id, void *, id, id *);
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  id v17;
  int64_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;

  v11 = a3;
  v12 = (void (**)(id, void *, id, id *))a5;
  v29 = a6;
  v30 = v11;
  v13 = objc_msgSend(v11, "count");
  v14 = v13;
  if (a4 <= 1)
    v15 = 1;
  else
    v15 = a4;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13 / v15 + 1);
  if (v14 < 1)
  {
    v17 = 0;
LABEL_14:
    v24 = v28;
    +[MLBatchProviderUtils batchFromConcatinatingBatches:](MLBatchProviderUtils, "batchFromConcatinatingBatches:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = a7;
    v16 = 0;
    v17 = 0;
    v18 = v14;
    while (1)
    {
      v19 = (void *)MEMORY[0x1A1AD6ED8]();
      if (v15 >= v18)
        v20 = v18;
      else
        v20 = v15;
      v32 = v17;
      +[MLBatchProviderUtils lazyBatchWindowIntoBatch:startIndex:windowLength:error:](MLBatchProviderUtils, "lazyBatchWindowIntoBatch:startIndex:windowLength:error:", v30, v16, v20, &v32, v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v32;

      if (!v21)
      {
        v17 = v22;
        goto LABEL_17;
      }
      v31 = v22;
      v12[2](v12, v21, v29, &v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v31;

      if (!v23)
        break;
      objc_msgSend(v28, "addObject:", v23);

      objc_autoreleasePoolPop(v19);
      v16 += v15;
      v18 -= v15;
      if (v16 >= v14)
        goto LABEL_14;
    }

LABEL_17:
    v24 = v28;
    objc_autoreleasePoolPop(v19);
    if (v27)
    {
      v17 = objc_retainAutorelease(v17);
      v25 = 0;
      *v27 = v17;
    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

+ (id)compileModelWithoutAutoreleaseAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v7 = a3;
  v8 = a4;
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v9, 1);
    if (!v10)
    {
      if (a5)
      {
        +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Failed to create NSURL object for path: %@"), v9);
        v20 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v10, 1, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[MLCompiler compileModelAtURL:toURL:options:error:](MLCompiler, "compileModelAtURL:toURL:options:error:", v7, v12, v8, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v7, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByDeletingPathExtension");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingPathExtension:", CFSTR("mlmodelc"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "URLByAppendingPathComponent:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLByAppendingPathComponent:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)v17;
        if (objc_msgSend(v11, "moveItemAtURL:toURL:error:", v17, v18, a5))
        {
          objc_msgSend(v11, "removeItemAtURL:error:", v12, 0);
          v19 = v18;
          v20 = v19;
        }
        else
        {
          v28 = v18;
          if (a5)
            *a5 = 0;
          v29 = v16;
          objc_msgSend(v16, "stringByDeletingPathExtension");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("_%@.mlmodelc"), v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v23;
          objc_msgSend(v10, "URLByAppendingPathComponent:", v23);
          v19 = (id)objc_claimAutoreleasedReturnValue();

          v25 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v30, v19, a5);
          objc_msgSend(v11, "removeItemAtURL:error:", v12, 0);
          v20 = 0;
          if (v25)
            v20 = v19;

          v16 = v29;
        }

        goto LABEL_23;
      }
      objc_msgSend(v11, "removeItemAtURL:error:", v12, 0);
    }
    else if (a5)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 3, *a5, CFSTR("Failed to create a working directory appropriate for URL: %@"), v10);
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
    v20 = 0;
    goto LABEL_23;
  }
  if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Failed to get the temporary directory for the current user."));
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_25:

  return v20;
}

+ (id)_compileModelAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  if (_compileModelAtURL_options_error__once_token[0] != -1)
    dispatch_once(_compileModelAtURL_options_error__once_token, &__block_literal_global_24203);
  if (pthread_main_np() == 1)
  {
    objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isApplication");

    if (v11)
    {
      v12 = _compileModelAtURL_options_error__logging_system;
      if (os_log_type_enabled((os_log_t)_compileModelAtURL_options_error__logging_system, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19C486000, v12, OS_LOG_TYPE_FAULT, "This method should not be called on the main thread as it may lead to UI unresponsiveness.", buf, 2u);
      }
    }
  }
  v13 = (void *)MEMORY[0x1A1AD6ED8]();
  v17 = 0;
  objc_msgSend(a1, "compileModelWithoutAutoreleaseAtURL:options:error:", v8, v9, &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v17;
  objc_autoreleasePoolPop(v13);
  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v14;
}

+ (NSURL)compileModelAtURL:(NSURL *)modelURL error:(NSError *)error
{
  NSURL *v6;
  void *v7;
  void *v8;

  v6 = modelURL;
  +[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_compileModelAtURL:options:error:", v6, v7, error);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

+ (void)compileModelAtURL:(NSURL *)modelURL completionHandler:(void *)handler
{
  NSURL *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSURL *v10;
  _QWORD block[4];
  NSURL *v12;
  id v13;
  id v14;

  v6 = modelURL;
  v7 = handler;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MLModel_MLModelCompilation__compileModelAtURL_completionHandler___block_invoke;
  block[3] = &unk_1E3D66DD0;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __67__MLModel_MLModelCompilation__compileModelAtURL_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)a1[6];
  v3 = a1[4];
  +[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "_compileModelAtURL:options:error:", v3, v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;

  (*(void (**)(void))(a1[5] + 16))();
}

void __64__MLModel_MLModelCompilation___compileModelAtURL_options_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runtime-issues", "CoreML");
  v1 = (void *)_compileModelAtURL_options_error__logging_system;
  _compileModelAtURL_options_error__logging_system = (uint64_t)v0;

}

@end
