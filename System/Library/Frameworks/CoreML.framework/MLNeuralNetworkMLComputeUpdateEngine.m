@implementation MLNeuralNetworkMLComputeUpdateEngine

- (MLNeuralNetworkMLComputeUpdateEngine)initWithCompiledArchive:(void *)a3 nnContainer:(id)a4 configuration:(id)a5 error:(id *)a6
{
  MLNeuralNetworkMLComputeUpdateEngine *v8;
  void *v9;
  uint64_t v10;
  NSString *lossTargetName;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  OS_dispatch_queue *progressHandlersDispatchQueue;
  OS_dispatch_queue *v34;
  MLNeuralNetworkMLComputeUpdateEngine *v35;
  void *v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[80];
  objc_super v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v37 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)MLNeuralNetworkMLComputeUpdateEngine;
  v47 = 0;
  v38 = a4;
  v40 = a5;
  v8 = -[MLNeuralNetworkEngine initWithContainer:configuration:error:](&v46, sel_initWithContainer_configuration_error_, v38);
  v39 = v47;
  if (v8)
  {
    CoreML::Specification::NetworkUpdateParameters::NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v45);
    if (!+[MLNeuralNetworkUpdateUtils loadUpdateParameters:fromCompiledArchive:error:](MLNeuralNetworkUpdateUtils, "loadUpdateParameters:fromCompiledArchive:error:", v45, v37, a6))goto LABEL_16;
    -[MLModelEngine modelDescription](v8, "modelDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLNeuralNetworkUpdateUtils loadParameterDescriptionsAndContainerFromUpdateParameters:modelDescription:](MLNeuralNetworkUpdateUtils, "loadParameterDescriptionsAndContainerFromUpdateParameters:modelDescription:", v45, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    lossTargetName = v8->_lossTargetName;
    v8->_lossTargetName = (NSString *)v10;

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v40, "parameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v42;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v15);
          -[MLNeuralNetworkMLComputeUpdateEngine parameterContainer](v8, "parameterContainer", v37);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "parameters");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = objc_msgSend(v17, "setCurrentValue:forKey:error:", v19, v16, a6);

          if ((v16 & 1) == 0)
          {

            goto LABEL_16;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        if (v13)
          continue;
        break;
      }
    }

    -[MLNeuralNetworkEngine classLabels](v8, "classLabels");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLNeuralNetworkUpdateUtils createClassLabelToIndexMapWith:](MLNeuralNetworkUpdateUtils, "createClassLabelToIndexMapWith:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)&v8->super.super._network.network_index;
    *(_QWORD *)&v8->super.super._network.network_index = v21;

    -[MLNeuralNetworkMLComputeUpdateEngine parameterContainer](v8, "parameterContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currentParameterValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterKey miniBatchSize](MLParameterKey, "miniBatchSize");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_progressHandlers = (MLUpdateProgressHandlers *)objc_msgSend(v26, "unsignedIntegerValue");

    BYTE1(v8->super.super._network.plan) = 1;
    -[MLNeuralNetworkMLComputeUpdateEngine loadLossTargetName:](v8, "loadLossTargetName:", v45);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)&v8->_classifierOutputIsSigmoidOutput;
    *(_QWORD *)&v8->_classifierOutputIsSigmoidOutput = v27;

    -[MLModelEngine modelDescription](v8, "modelDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MLNeuralNetworkMLComputeUpdateEngine batchSize](v8, "batchSize");
    -[MLNeuralNetworkEngine classLabels](v8, "classLabels");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLNeuralNetworkMLComputeGraph graphFromCompiledArchive:modelDescription:batchSize:numberOfClasses:computeUnits:error:](MLNeuralNetworkMLComputeGraph, "graphFromCompiledArchive:modelDescription:batchSize:numberOfClasses:computeUnits:error:", v37, v29, v30, objc_msgSend(v31, "count"), objc_msgSend(v40, "computeUnits"), a6);
    v32 = objc_claimAutoreleasedReturnValue();
    progressHandlersDispatchQueue = v8->_progressHandlersDispatchQueue;
    v8->_progressHandlersDispatchQueue = (OS_dispatch_queue *)v32;

    v34 = v8->_progressHandlersDispatchQueue;
    if (v34)
    {
      LOBYTE(v8->super.super._network.plan) = -[OS_dispatch_queue classifierOutputIsSigmoidOutput](v34, "classifierOutputIsSigmoidOutput");
      v35 = v8;
    }
    else
    {
LABEL_16:
      v35 = 0;
    }
    CoreML::Specification::NetworkUpdateParameters::~NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v45);
  }
  else if (a6)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v39, CFSTR("Error in initalizing container."));
    v35 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (unint64_t)predictionTypeForKTrace
{
  return 0;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  +[MLDataConversionUtils mlComputeDataProviderFromBatchProvider:batchSize:forPrediction:neuralNetworkEngine:error:](MLDataConversionUtils, "mlComputeDataProviderFromBatchProvider:batchSize:forPrediction:neuralNetworkEngine:error:", v8, -[MLNeuralNetworkMLComputeUpdateEngine batchSize](self, "batchSize"), 1, self, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  if (v10)
  {
    v18 = v9;
    -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](self, "mlcGraph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "outputNameToLayerMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    -[MLNeuralNetworkMLComputeUpdateEngine performInferenceWith:outputNameToLayerMap:error:](self, "performInferenceWith:outputNameToLayerMap:error:", v10, v13, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;

    if (v14)
    {
      +[MLDataConversionUtils batchProviderFromMLComputeDataProvider:neuralNetworkEngine:options:error:](MLDataConversionUtils, "batchProviderFromMLComputeDataProvider:neuralNetworkEngine:options:error:", v14, self, v18, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a5)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v15, CFSTR("Failed to perform inference."));
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

    v9 = v18;
  }
  else
  {
    if (a5)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v11, CFSTR("Error creating data."));
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v15 = v11;
  }

  return v16;
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[MLNeuralNetworkMLComputeUpdateEngine setProgressHandlers:](self, "setProgressHandlers:", v7);
  -[MLNeuralNetworkMLComputeUpdateEngine setProgressHandlersDispatchQueue:](self, "setProgressHandlersDispatchQueue:", v6);

}

- (void)updateModelWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  MLShufflingBatchProvider *v13;
  void *v14;
  void *v15;
  MLShufflingBatchProvider *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  double v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[5];
  _QWORD aBlock[5];
  void *v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__MLNeuralNetworkMLComputeUpdateEngine_updateModelWithData___block_invoke;
  aBlock[3] = &unk_1E3D654F8;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v48[0] = v5;
  v48[1] = 3221225472;
  v48[2] = __60__MLNeuralNetworkMLComputeUpdateEngine_updateModelWithData___block_invoke_2;
  v48[3] = &unk_1E3D654F8;
  v48[4] = self;
  v44 = _Block_copy(v48);
  +[MLParameterKey epochs](MLParameterKey, "epochs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkMLComputeUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  +[MLParameterKey shuffle](MLParameterKey, "shuffle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkMLComputeUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (!v12)
  {
    v46 = 0;
    +[MLDataConversionUtils mlComputeDataProviderFromBatchProvider:batchSize:forPrediction:neuralNetworkEngine:error:](MLDataConversionUtils, "mlComputeDataProviderFromBatchProvider:batchSize:forPrediction:neuralNetworkEngine:error:", v4, -[MLNeuralNetworkMLComputeUpdateEngine batchSize](self, "batchSize"), 0, self, &v46);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v46;
    if (!v20)
      goto LABEL_3;
LABEL_5:
    -[MLNeuralNetworkMLComputeUpdateEngine progressHandlers](self, "progressHandlers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_msgSend(v24, "interestedEvents") & 1) == 0;

    if (!v25)
    {
      -[MLNeuralNetworkMLComputeUpdateEngine progressHandlers](self, "progressHandlers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkMLComputeUpdateEngine updateParameters](self, "updateParameters");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkMLComputeUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dispatchTrainingBeginProgressHandlerWithMetrics:parameters:onQueue:", MEMORY[0x1E0C9AA70], v27, v28);

      +[MLParameterKey learningRate](MLParameterKey, "learningRate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkMLComputeUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "floatValue");
      v32 = v31;

      LODWORD(v33) = v32;
      -[MLNeuralNetworkMLComputeUpdateEngine updateLearningRateWithValue:](self, "updateLearningRateWithValue:", v33);
    }
    if (-[MLNeuralNetworkMLComputeUpdateEngine continueWithUpdate](self, "continueWithUpdate"))
    {
      v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v34 = _Block_copy(v6);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, CFSTR("Epoch"));

      -[MLNeuralNetworkMLComputeUpdateEngine progressHandlers](self, "progressHandlers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (objc_msgSend(v35, "interestedEvents") & 4) == 0;

      if (!v36)
      {
        v37 = _Block_copy(v44);
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v37, CFSTR("Batch"));

      }
      v45 = v19;
      v38 = -[MLNeuralNetworkMLComputeUpdateEngine performTrainingWith:callBacks:numberOfEpochs:error:](self, "performTrainingWith:callBacks:numberOfEpochs:error:", v20, v21, v9, &v45);
      v23 = v45;

      if (!v38)
      {
        -[MLNeuralNetworkMLComputeUpdateEngine progressHandlers](self, "progressHandlers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkMLComputeUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dispatchTrainingCompletionHandlerWithError:onQueue:", v23, v42);
        goto LABEL_15;
      }

    }
    else
    {
      v23 = v19;
    }
    +[MLMetricKey lossValue](MLMetricKey, "lossValue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v39;
    v40 = (void *)MEMORY[0x1E0CB37E8];
    -[MLNeuralNetworkMLComputeUpdateEngine finalLossValue](self, "finalLossValue");
    objc_msgSend(v40, "numberWithFloat:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    -[MLNeuralNetworkMLComputeUpdateEngine progressHandlers](self, "progressHandlers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkMLComputeUpdateEngine updateParameters](self, "updateParameters");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkMLComputeUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dispatchTrainingCompletionHandlerWithMetrics:parameters:onQueue:", v21, v42, v43);

LABEL_15:
    goto LABEL_16;
  }
  v13 = [MLShufflingBatchProvider alloc];
  +[MLParameterKey seed](MLParameterKey, "seed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkMLComputeUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MLShufflingBatchProvider initWithBatchProvider:seed:](v13, "initWithBatchProvider:seed:", v4, v15);
  -[MLNeuralNetworkMLComputeUpdateEngine setShuffableTrainingData:](self, "setShuffableTrainingData:", v16);

  -[MLNeuralNetworkMLComputeUpdateEngine shuffableTrainingData](self, "shuffableTrainingData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  +[MLDataConversionUtils mlComputeDataProviderFromBatchProvider:batchSize:forPrediction:neuralNetworkEngine:error:](MLDataConversionUtils, "mlComputeDataProviderFromBatchProvider:batchSize:forPrediction:neuralNetworkEngine:error:", v17, -[MLNeuralNetworkMLComputeUpdateEngine batchSize](self, "batchSize"), 0, self, &v47);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v47;

  v20 = (void *)v18;
  if (v18)
    goto LABEL_5;
LABEL_3:
  -[MLNeuralNetworkMLComputeUpdateEngine progressHandlers](self, "progressHandlers");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkMLComputeUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dispatchTrainingCompletionHandlerWithError:onQueue:", v19, v22);
  v23 = v19;
LABEL_16:

}

- (id)updateParameters
{
  void *v2;
  void *v3;

  -[MLNeuralNetworkMLComputeUpdateEngine parameterContainer](self, "parameterContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentParameterValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resumeUpdate
{
  -[MLNeuralNetworkMLComputeUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
}

- (void)cancelUpdate
{
  -[MLNeuralNetworkMLComputeUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 0);
}

- (void)resumeUpdateWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[MLNeuralNetworkMLComputeUpdateEngine parameterContainer](self, "parameterContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterKey learningRate](MLParameterKey, "learningRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterKey learningRate](MLParameterKey, "learningRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v5, "setCurrentValue:forKey:error:", v7, v8, &v13);
  v10 = v13;

  if ((v9 & 1) != 0)
  {
    -[MLNeuralNetworkMLComputeUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
  }
  else
  {
    -[MLNeuralNetworkMLComputeUpdateEngine progressHandlers](self, "progressHandlers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkMLComputeUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dispatchTrainingCompletionHandlerWithError:onQueue:", v10, v12);

  }
}

- (void)updateLearningRateWithValue:(float)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](self, "mlcGraph");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trainingGraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optimizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v5, "setLearningRate:", v6);

}

- (BOOL)performTrainingWith:(id)a3 callBacks:(id)a4 numberOfEpochs:(unint64_t)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t (**v45)(_QWORD, _QWORD, float);
  int v46;
  void *v47;
  void *v48;
  uint64_t (**v49)(_QWORD, _QWORD, float);
  int v50;
  int v51;
  char v53;
  uint64_t v55;
  id v56;
  void *context;
  id v59;
  uint64_t v60;
  int v61;
  MLNeuralNetworkMLComputeUpdateEngine *v62;
  NSObject *dsema;
  _QWORD v64[4];
  NSObject *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id obj;
  uint64_t v80;
  float *v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v56 = a4;
  v62 = self;
  -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](self, "mlcGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trainingGraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__5634;
    v92 = __Block_byref_object_dispose__5635;
    v93 = 0;
    -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](v62, "mlcGraph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v10, "executionOptions");

    v60 = objc_msgSend(v59, "numberOfBatches");
    if (a5)
    {
      v55 = 0;
      v12 = 0;
      while (1)
      {
        dsema = dispatch_semaphore_create(0);
        v84 = 0;
        v85 = &v84;
        v86 = 0x2020000000;
        v87 = 0;
        if (v60)
        {
          v13 = 0;
          while (1)
          {
            v80 = 0;
            v81 = (float *)&v80;
            v82 = 0x2020000000;
            v83 = 0;
            v14 = (void *)MEMORY[0x1A1AD6ED8]();
            v15 = (id *)(v89 + 5);
            obj = (id)v89[5];
            objc_msgSend(v59, "batchAtIndex:error:", v13, &obj);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v15, obj);
            objc_autoreleasePoolPop(v14);
            if (!a6 || v16)
            {
              context = (void *)MEMORY[0x1A1AD6ED8]();
              v18 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
              v77 = 0u;
              v78 = 0u;
              v75 = 0u;
              v76 = 0u;
              -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](v62, "mlcGraph");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "mlcInputs");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "allKeys");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
              if (v22)
              {
                v23 = *(_QWORD *)v76;
                do
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v76 != v23)
                      objc_enumerationMutation(v21);
                    v25 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
                    objc_msgSend(v16, "objectForKeyedSubscript:", v25);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v25);

                  }
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
                }
                while (v22);
              }

              v27 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
              v73 = 0u;
              v74 = 0u;
              v71 = 0u;
              v72 = 0u;
              -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](v62, "mlcGraph");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "mlcLabels");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "allKeys");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
              if (v31)
              {
                v32 = *(_QWORD *)v72;
                do
                {
                  for (j = 0; j != v31; ++j)
                  {
                    if (*(_QWORD *)v72 != v32)
                      objc_enumerationMutation(v30);
                    v34 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
                    objc_msgSend(v16, "objectForKeyedSubscript:", v34);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "setObject:forKeyedSubscript:", v35, v34);

                  }
                  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
                }
                while (v31);
              }

              v36 = objc_msgSend(v59, "sizeOfBatchAtIndex:", v13);
              -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](v62, "mlcGraph");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "trainingGraph");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](v62, "mlcGraph");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "executionOptions");
              v64[0] = MEMORY[0x1E0C809B0];
              v64[1] = 3221225472;
              v64[2] = __91__MLNeuralNetworkMLComputeUpdateEngine_performTrainingWith_callBacks_numberOfEpochs_error___block_invoke;
              v64[3] = &unk_1E3D65520;
              v66 = &v88;
              v67 = &v80;
              v68 = &v84;
              v69 = v60;
              v70 = v13;
              v65 = dsema;
              objc_msgSend(v38, "executeWithInputsData:lossLabelsData:lossLabelWeightsData:batchSize:options:completionHandler:", v18, v27, 0, v36, v40, v64);

              if (v13 == v60 - 1 && v55 == a5 - 1)
              {
                v12 = *((_DWORD *)v85 + 6);
                -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](v62, "mlcGraph");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "trainingGraph");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "synchronizeUpdates");

              }
              objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Batch"));
              v44 = objc_claimAutoreleasedReturnValue();
              if (v44)
              {
                objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Batch"));
                v45 = (uint64_t (**)(_QWORD, _QWORD, float))objc_claimAutoreleasedReturnValue();
                v46 = v45[2](v45, v13, v81[6]);

                LODWORD(v44) = v46 ^ 1;
                v17 = v46 ^ 1;
              }
              else
              {
                v17 = 0;
              }

              objc_autoreleasePoolPop(context);
              v61 |= v44;
            }
            else
            {
              +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v89[5], CFSTR("Unable to get training input for batch index: %lu"), v13);
              v61 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
              v17 = 1;
            }

            _Block_object_dispose(&v80, 8);
            if (v17)
              break;
            if (++v13 == v60)
              goto LABEL_34;
          }
          LODWORD(v48) = 1;
        }
        else
        {
LABEL_34:
          if ((v53 & 2) == 0)
            dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
          v47 = (void *)MEMORY[0x1A1AD6ED8]();
          objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Epoch"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Epoch"));
            v49 = (uint64_t (**)(_QWORD, _QWORD, float))objc_claimAutoreleasedReturnValue();
            v50 = v49[2](v49, v55, *((float *)v85 + 6));

            v51 = v50 ^ 1;
            LODWORD(v48) = v50 ^ 1;
          }
          else
          {
            v51 = 0;
          }
          objc_autoreleasePoolPop(v47);
          v61 |= v51;
        }
        _Block_object_dispose(&v84, 8);

        if ((_DWORD)v48)
          break;
        if (++v55 == a5)
          goto LABEL_47;
      }
    }
    else
    {
      v12 = 0;
LABEL_47:
      if (v89[5])
      {
        if (a6)
        {
          +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
          LOBYTE(v61) = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          LOBYTE(v61) = 0;
        }
      }
      else
      {
        LODWORD(v11) = v12;
        -[MLNeuralNetworkMLComputeUpdateEngine setFinalLossValue:](v62, "setFinalLossValue:", v11);
        LOBYTE(v61) = 1;
      }
    }
    _Block_object_dispose(&v88, 8);

  }
  else if (a6)
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Unable to perform training due to an internal error in training graph creation."));
    LOBYTE(v61) = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v61) = 0;
  }

  return v61 & 1;
}

- (id)performInferenceWith:(id)a3 outputNameToLayerMap:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  MLStreamingInputDataSource *v32;
  MLStreamingInputDataSource *v33;
  id *v35;
  MLStreamingInputDataSource *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  MLNeuralNetworkMLComputeUpdateEngine *v41;
  _QWORD v42[4];
  id v43;
  MLNeuralNetworkMLComputeUpdateEngine *v44;
  MLStreamingInputDataSource *v45;
  uint64_t *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id obj;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v37 = a4;
  v40 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Unable to perform inference. Input is nil."));
      v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
LABEL_31:
    v32 = 0;
    goto LABEL_32;
  }
  v35 = a5;
  -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](self, "mlcGraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inferenceGraph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (a5)
    {
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Unable to perform inference due to an internal error in inference graph creation."));
      v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__5634;
  v57 = __Block_byref_object_dispose__5635;
  v58 = 0;
  v38 = objc_msgSend(v40, "numberOfBatches");
  v36 = -[MLStreamingInputDataSource initWithBatchSize:]([MLStreamingInputDataSource alloc], "initWithBatchSize:", -[MLNeuralNetworkMLComputeUpdateEngine batchSize](self, "batchSize"));
  if (!v38)
    goto LABEL_29;
  v41 = self;
  v11 = 0;
  v39 = 0;
  do
  {
    v12 = (void *)MEMORY[0x1A1AD6ED8]();
    v13 = (id *)(v54 + 5);
    obj = (id)v54[5];
    objc_msgSend(v40, "batchAtIndex:error:", v11, &obj);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13, obj);
    if (v14)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](v41, "mlcGraph");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mlcInputs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v49 != v20)
              objc_enumerationMutation(v18);
            v22 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v14, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v22);

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
        }
        while (v19);
      }

      v24 = objc_msgSend(v40, "sizeOfBatchAtIndex:", v11);
      -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](v41, "mlcGraph");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "inferenceGraph");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v15, "copy");
      -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](v41, "mlcGraph");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "executionOptions");
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __88__MLNeuralNetworkMLComputeUpdateEngine_performInferenceWith_outputNameToLayerMap_error___block_invoke;
      v42[3] = &unk_1E3D65548;
      v46 = &v53;
      v43 = v37;
      v44 = v41;
      v45 = v36;
      v47 = v24;
      LODWORD(v24) = objc_msgSend(v26, "executeWithInputsData:batchSize:options:completionHandler:", v27, v24, v29, v42);

      if ((_DWORD)v24 && !v54[5])
      {
        v31 = 0;
      }
      else
      {
        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error when performing inference"));

        v31 = 2;
        v39 = (void *)v30;
      }

    }
    else
    {
      v31 = 2;
      v15 = v39;
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to get inference input for batch index: %lu"), v11);
    }

    objc_autoreleasePoolPop(v12);
    if (v31)
      break;
    ++v11;
  }
  while (v11 != v38);
  if (v39)
  {
    if (v35)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v54[5], CFSTR("%@"), v39);
      v32 = 0;
      v33 = v36;
      *v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
      v33 = v36;
    }
  }
  else
  {
LABEL_29:
    v33 = v36;
    v32 = v36;
    v39 = 0;
  }

  _Block_object_dispose(&v53, 8);
LABEL_32:

  return v32;
}

- (id)loadLossTargetName:(void *)a3
{
  uint64_t *v3;
  void *v4;
  _BYTE v6[24];
  uint64_t v7;
  int v8;

  CoreML::Specification::LossLayer::LossLayer((CoreML::Specification::LossLayer *)v6, *(const CoreML::Specification::LossLayer **)(*((_QWORD *)a3 + 4) + 8));
  if (v8 == 10 || v8 == 11)
  {
    v3 = *(uint64_t **)(v7 + 24);
    if (*((char *)v3 + 23) < 0)
      v3 = (uint64_t *)*v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  CoreML::Specification::LossLayer::~LossLayer((CoreML::Specification::LossLayer *)v6);
  return v4;
}

- (id)parameterValueForKey:(id)a3
{
  -[MLNeuralNetworkMLComputeUpdateEngine parameterValueForKey:error:](self, "parameterValueForKey:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;

  v6 = a3;
  if (objc_msgSend(v6, "hasGlobalScope"))
  {
    -[MLNeuralNetworkMLComputeUpdateEngine parameterContainer](self, "parameterContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentParameterValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_12;
    goto LABEL_9;
  }
  +[MLParameterKey weights](MLParameterKey, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "hasSameNameAsKey:", v10);

  if (v11)
  {
    -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](self, "mlcGraph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scope");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getWeightsForLayerNamed:error:", v13, a4);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (void *)v14;

    goto LABEL_12;
  }
  +[MLParameterKey biases](MLParameterKey, "biases");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "hasSameNameAsKey:", v15);

  if (v16)
  {
    -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](self, "mlcGraph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scope");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getBiasesForLayerNamed:error:", v13, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  if (a4)
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 7, CFSTR("Neural network model does not have a parameter for requested key %@."), v6);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  char hasNestedArchive;
  char v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  id v31;
  _QWORD v32[3];
  char v33;
  _BYTE v34[48];
  uint64_t v35;
  std::__shared_weak_count *v36;
  char *v37;
  void *__p;
  std::__shared_weak_count *v39;
  char v40;
  void *v41;
  uint64_t v42;
  void (***v43)(google::protobuf::io::IstreamInputStream *__hidden);
  int v44[4];
  uint64_t v45;
  uint64_t v46;
  int v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  void (**v51)(google::protobuf::io::IstreamInputStream *__hidden);
  void (**v52)(google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *__hidden);
  std::__shared_weak_count *v53;
  void (**v54)(google::protobuf::io::CopyingInputStreamAdaptor *__hidden);
  char *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;

  v6 = a3;
  -[MLModelEngine modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelURL");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v51, (char *)objc_msgSend(v8, "fileSystemRepresentation"));
  IArchive::IArchive(&v35, (uint64_t)&v51, 0);
  if (SHIBYTE(v53) < 0)
    operator delete(v51);

  std::string::basic_string[abi:ne180100]<0>(&v51, "entireSpec");
  hasNestedArchive = IArchive::hasNestedArchive(&v35, &v51);
  v10 = hasNestedArchive;
  if ((SHIBYTE(v53) & 0x80000000) == 0)
  {
    if ((hasNestedArchive & 1) != 0)
      goto LABEL_5;
LABEL_10:
    if (a4)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Internal error: failed to look up the archive."));
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_41;
  }
  operator delete(v51);
  if ((v10 & 1) == 0)
    goto LABEL_10;
LABEL_5:
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)v34);
  std::string::basic_string[abi:ne180100]<0>(&v51, "entireSpec");
  v11 = IArchive::nestedArchive(&v35, (uint64_t)&v51);
  if (SHIBYTE(v53) < 0)
    operator delete(v51);
  v12 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)v11 + 32) + 16))(*(_QWORD *)(*(_QWORD *)v11 + 32));
  v51 = &off_1E3D598A0;
  v52 = &off_1E3D59870;
  v53 = (std::__shared_weak_count *)v12;
  v54 = &off_1E3D59950;
  v55 = (char *)&v52;
  v56 = 0;
  v57 = 0;
  v58 = 0;
  v60 = 0;
  v59 = 0x2000;
  v41 = 0;
  v42 = 0;
  v43 = &v51;
  *(_QWORD *)v44 = 0;
  *(_QWORD *)((char *)&v44[1] + 2) = 0;
  v45 = 0x7FFFFFFFLL;
  v46 = 0x647FFFFFFFLL;
  v47 = 100;
  v48 = 1;
  v49 = 0;
  v50 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v41);
  LODWORD(v46) = 0x7FFFFFFF;
  v13 = v42 + SHIDWORD(v45);
  v42 = v13;
  v14 = v44[0] - v45;
  if (v44[0] <= (int)v45)
    v14 = 0;
  else
    v42 = v13 - v14;
  HIDWORD(v45) = v14;
  if ((google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)v34, (google::protobuf::io::CodedInputStream *)&v41) & 1) != 0)
  {
    CoreML::Result::Result((CoreML::Result *)v32);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    v32[0] = 5;
    std::operator+<char>();
    if (v40 < 0)
      operator delete(__p);
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v41);
  v51 = &off_1E3D598A0;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)&v54);
  if ((v32[0] & 0xFFFFFFEF) == 0)
  {
    -[MLNeuralNetworkMLComputeUpdateEngine mlcGraph](self, "mlcGraph");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "saveUpdatedWeightsTo:error:", v34, a4);

    if ((v17 & 1) != 0)
    {
      std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>((CoreML::Specification::Model **)&__p, (const CoreML::Specification::Model *)v34);
      std::string::basic_string[abi:ne180100]<0>(&v41, (char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"));
      OArchive::OArchive((uint64_t)&v51, (uint64_t)&v41, 0);
      if (SHIBYTE(v43) < 0)
        operator delete(v41);
      +[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTrainWithMLCompute:", 1);
      v31 = 0;
      +[MLCompiler compileSpecification:toArchive:options:error:](MLCompiler, "compileSpecification:toArchive:options:error:", &__p, &v51, v18, &v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v31;
      v15 = v19 != 0;
      if (a4 && !v19)
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 3, v20, CFSTR("Internal error: failed to re-compile updated model."));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v55);
      v21 = v53;
      if (v53)
      {
        p_shared_owners = (unint64_t *)&v53->__shared_owners_;
        do
          v23 = __ldaxr(p_shared_owners);
        while (__stlxr(v23 - 1, p_shared_owners));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      v24 = v39;
      if (v39)
      {
        v25 = (unint64_t *)&v39->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  if (!a4)
  {
LABEL_37:
    v15 = 0;
    goto LABEL_38;
  }
  +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Internal error: failed to unarchive the model."));
  v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
  if (v33 < 0)
    operator delete((void *)v32[1]);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)v34);
LABEL_41:
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v37);
  v27 = v36;
  if (v36)
  {
    v28 = (unint64_t *)&v36->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

  return v15;
}

- (NSDictionary)classLabelToIndexMap
{
  return *(NSDictionary **)&self->super.super._network.network_index;
}

- (BOOL)classifierOutputIsSigmoidOutput
{
  return (BOOL)self->super.super._network.plan;
}

- (void)setClassifierOutputIsSigmoidOutput:(BOOL)a3
{
  LOBYTE(self->super.super._network.plan) = a3;
}

- (NSString)lossTargetName
{
  return *(NSString **)&self->_classifierOutputIsSigmoidOutput;
}

- (BOOL)continueWithUpdate
{
  return BYTE1(self->super.super._network.plan);
}

- (void)setContinueWithUpdate:(BOOL)a3
{
  BYTE1(self->super.super._network.plan) = a3;
}

- (MLShufflingBatchProvider)shuffableTrainingData
{
  return (MLShufflingBatchProvider *)self->_classLabelToIndexMap;
}

- (void)setShuffableTrainingData:(id)a3
{
  objc_storeStrong((id *)&self->_classLabelToIndexMap, a3);
}

- (MLParameterContainer)parameterContainer
{
  return (MLParameterContainer *)self->_lossTargetName;
}

- (void)setParameterContainer:(id)a3
{
  objc_storeStrong((id *)&self->_lossTargetName, a3);
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return (MLUpdateProgressHandlers *)self->_shuffableTrainingData;
}

- (void)setProgressHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_shuffableTrainingData, a3);
}

- (OS_dispatch_queue)progressHandlersDispatchQueue
{
  return (OS_dispatch_queue *)self->_parameterContainer;
}

- (void)setProgressHandlersDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_parameterContainer, a3);
}

- (unint64_t)batchSize
{
  return (unint64_t)self->_progressHandlers;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_progressHandlers = (MLUpdateProgressHandlers *)a3;
}

- (float)finalLossValue
{
  return *((float *)&self->super.super._network.plan + 1);
}

- (void)setFinalLossValue:(float)a3
{
  *((float *)&self->super.super._network.plan + 1) = a3;
}

- (MLNeuralNetworkMLComputeGraph)mlcGraph
{
  return (MLNeuralNetworkMLComputeGraph *)self->_progressHandlersDispatchQueue;
}

- (void)setMlcGraph:(id)a3
{
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, 0);
  objc_storeStrong((id *)&self->_parameterContainer, 0);
  objc_storeStrong((id *)&self->_shuffableTrainingData, 0);
  objc_storeStrong((id *)&self->_lossTargetName, 0);
  objc_storeStrong((id *)&self->_classLabelToIndexMap, 0);
  objc_storeStrong((id *)&self->_classifierOutputIsSigmoidOutput, 0);
  objc_storeStrong((id *)&self->super.super._network.network_index, 0);
}

void __88__MLNeuralNetworkMLComputeUpdateEngine_performInferenceWith_outputNameToLayerMap_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t j;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v25 = a1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = *(id *)(v25 + 32);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v6)
    {
      v24 = *(_QWORD *)v28;
      do
      {
        v26 = v6;
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(*(id *)(v25 + 32), "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v25 + 40), "mlcGraph");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "inferenceGraph");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "resultTensorsForLayer:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          for (j = 0; j < objc_msgSend(v12, "count"); ++j)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", j);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "label");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v8);

            if (v16)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", j);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "synchronizeData");

              objc_msgSend(v12, "objectAtIndexedSubscript:", j);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "data");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectAtIndexedSubscript:", j);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "label");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v21);

            }
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(v25 + 48), "appendBatchedTensors:numberOfTensors:", v5, *(_QWORD *)(v25 + 64));
  }

}

void __91__MLNeuralNetworkMLComputeUpdateEngine_performTrainingWith_callBacks_numberOfEpochs_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  _DWORD *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(a2, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (_DWORD *)objc_msgSend(v6, "bytes");

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *v7;
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 72);
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (float)(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                              + 8)
                                                                                  + 24)
                                                                       / (float)v8)
                                                               + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
    if (v9 == v8 - 1)
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

uint64_t __60__MLNeuralNetworkMLComputeUpdateEngine_updateModelWithData___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;

  objc_msgSend(*(id *)(a1 + 32), "progressHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interestedEvents");

  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLMetricKey epochIndex](MLMetricKey, "epochIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

    *(float *)&v11 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLMetricKey lossValue](MLMetricKey, "lossValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v13);

    objc_msgSend(*(id *)(a1 + 32), "progressHandlers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "updateParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "progressHandlersDispatchQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dispatchEpochEndProgressHandlerWithMetrics:parameters:onQueue:", v8, v15, v16);

    v17 = *(void **)(a1 + 32);
    +[MLParameterKey learningRate](MLParameterKey, "learningRate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "parameterValueForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v21 = v20;

    LODWORD(v22) = v21;
    objc_msgSend(*(id *)(a1 + 32), "updateLearningRateWithValue:", v22);

  }
  objc_msgSend(*(id *)(a1 + 32), "shuffableTrainingData");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    v25 = *(void **)(a1 + 32);
    +[MLParameterKey shuffle](MLParameterKey, "shuffle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "parameterValueForKey:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    if (v28)
    {
      objc_msgSend(*(id *)(a1 + 32), "shuffableTrainingData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shuffle");

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "continueWithUpdate");
}

uint64_t __60__MLNeuralNetworkMLComputeUpdateEngine_updateModelWithData___block_invoke_2(uint64_t a1, uint64_t a2, float a3)
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  double v20;
  uint64_t v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLMetricKey miniBatchIndex](MLMetricKey, "miniBatchIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);

  *(float *)&v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLMetricKey lossValue](MLMetricKey, "lossValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v11);

  objc_msgSend(*(id *)(a1 + 32), "progressHandlers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "progressHandlersDispatchQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dispatchMiniBatchEndProgressHandlerWithMetrics:parameters:onQueue:", v6, v13, v14);

  v15 = *(void **)(a1 + 32);
  +[MLParameterKey learningRate](MLParameterKey, "learningRate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "parameterValueForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  LODWORD(v20) = v19;
  objc_msgSend(*(id *)(a1 + 32), "updateLearningRateWithValue:", v20);
  v21 = objc_msgSend(*(id *)(a1 + 32), "continueWithUpdate");

  return v21;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;

  v12 = a6;
  +[MLNeuralNetworkV1Container containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:](MLNeuralNetworkV1Container, "containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, a4, a5, v12, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCompiledArchive:nnContainer:configuration:error:", a3, v13, v12, a7);
  else
    v14 = 0;

  return v14;
}

@end
