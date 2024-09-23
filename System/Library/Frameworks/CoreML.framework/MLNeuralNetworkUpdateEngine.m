@implementation MLNeuralNetworkUpdateEngine

- (id)createEspressoTaskFrom:(id)a3 updateParameters:(void *)a4 lossInputName:(id)a5 lossTargetName:(id)a6 lossOutputName:(id)a7 updatableLayerNames:(id)a8 configuration:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  uint64_t *v22;
  int v23;
  uint64_t *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  _QWORD v66[6];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v55 = a5;
  v56 = a6;
  v57 = a7;
  v54 = a8;
  v53 = a9;
  v52 = v16;
  v17 = objc_alloc(MEMORY[0x1E0D1F4B0]);
  v65 = 0;
  v18 = (void *)objc_msgSend(v17, "initWithInferenceNetworkPath:inferenceInputs:inferenceOutputs:error:", v16, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], &v65);
  v19 = v65;
  if (v18)
  {
    v20 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a4 + 4) + 8) + 36);
    if (v20 == 10)
    {
      objc_msgSend(MEMORY[0x1E0D1F4A0], "crossEntropyLossWithInputName:targetInputName:lossOutputName:", v55, v56, v57);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v20 != 11)
      {
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Loss layer type not recognized."));
        v21 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0D1F4A0], "L2LossWithInputName:targetInputName:lossOutputName:", v55, v56, v57);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v51)
    {
      v64 = v19;
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4D0]), "initForLayers:error:", v54, &v64);
      v50 = v64;

      if (v49)
      {
        v22 = (uint64_t *)*((_QWORD *)a4 + 5);
        if (!v22)
          v22 = &CoreML::Specification::_Optimizer_default_instance_;
        v23 = *((_DWORD *)v22 + 7);
        if (v23 == 10)
        {
          v47 = 0;
LABEL_21:
          v27 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          +[MLParameterKey learningRate](MLParameterKey, "learningRate");
          v66[0] = objc_claimAutoreleasedReturnValue();
          v48 = (void *)v66[0];
          +[MLParameterKey miniBatchSize](MLParameterKey, "miniBatchSize");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v66[1] = v28;
          +[MLParameterKey momentum](MLParameterKey, "momentum");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v66[2] = v29;
          +[MLParameterKey beta1](MLParameterKey, "beta1");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v66[3] = v30;
          +[MLParameterKey beta2](MLParameterKey, "beta2");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v66[4] = v31;
          +[MLParameterKey eps](MLParameterKey, "eps");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v66[5] = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 6);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v61;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v61 != v35)
                  objc_enumerationMutation(v33);
                v37 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
                -[MLNeuralNetworkUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLUpdateProgressHandlers objectForKeyedSubscript:](self->_progressHandlers, "objectForKeyedSubscript:", v37);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v38, v39);

              }
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
            }
            while (v34);
          }

          v59 = v50;
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4B8]), "initWithOptimizationAlgorithm:parameters:error:", v47, v27, &v59);
          v41 = v59;

          if (v40)
          {
            if ((unint64_t)objc_msgSend(v53, "computeUnits") < 4)
            {
              v42 = (void *)MEMORY[0x1A1AD6ED8]();
              v58 = v41;
              v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4C0]), "initWithModelDefinition:lossDefinition:variablesDefinition:optimizerDefinition:forPlatform:error:", v18, v51, v49, v40, 1, &v58);
              v43 = v58;

              objc_autoreleasePoolPop(v42);
              if (v25)
              {
                v44 = v25;
              }
              else
              {
                +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v43, CFSTR("Error initializing espresso task."));
                *a10 = (id)objc_claimAutoreleasedReturnValue();
              }

              v41 = v43;
              goto LABEL_41;
            }
            if (!a10)
            {
              v25 = 0;
              goto LABEL_41;
            }
            +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Invalid value for computeUnits in model configuration."));
            v45 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v41, CFSTR("Error initializing optimizer."));
            v45 = (id)objc_claimAutoreleasedReturnValue();
          }
          v25 = 0;
          *a10 = v45;
LABEL_41:

          v50 = v41;
          goto LABEL_42;
        }
        if (v23 == 11)
        {
          v47 = 1;
          goto LABEL_21;
        }
        +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Optimizer type not recognized."));
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v50, CFSTR("Error initializing training variables."));
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = 0;
      *a10 = v26;
LABEL_42:

      v19 = v50;
      goto LABEL_43;
    }
    v24 = *(uint64_t **)(*(_QWORD *)(*((_QWORD *)a4 + 4) + 8) + 16);
    if (*((char *)v24 + 23) < 0)
      v24 = (uint64_t *)*v24;
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Error initializing loss layer %s."), v24);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v19, CFSTR("Error initializing model."));
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  v25 = 0;
  *a10 = v21;
LABEL_43:

  return v25;
}

- (void)loadLossInputName:(id *)a3 updatableLayerNames:(id *)a4 fromCompiledArchive:(void *)a5
{
  char *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  id v12;
  std::string *p_p;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  char *v19[3];
  std::string __p;

  std::string::basic_string[abi:ne180100]<0>(&__p, "updateParameters");
  v8 = IArchive::nestedArchive(a5, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = (std::__shared_weak_count *)*((_QWORD *)v8 + 1);
  v17 = *(_QWORD *)v8;
  v18 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v19, (_QWORD *)v8 + 2);
  operator>>((uint64_t)&v17);
  v12 = objc_retainAutorelease((id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy"));
  *a4 = v12;
  memset(&__p, 0, sizeof(__p));
  operator>>((uint64_t)&v17, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v19[1]);
  v14 = v18;
  if (v18)
  {
    v15 = (unint64_t *)&v18->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (void)loadLossTargetName:(id *)a3 lossOutputName:(id *)a4 fromUpdateParameters:(void *)a5
{
  void *v7;
  char *v8;
  size_t v9;
  void **v10;
  char *v11;
  void **v12;
  uint64_t *v13;
  void *__p[2];
  char v15;
  _BYTE v16[16];
  uint64_t v17;
  uint64_t v18;
  int v19;

  CoreML::Specification::LossLayer::LossLayer((CoreML::Specification::LossLayer *)v16, *(const CoreML::Specification::LossLayer **)(*((_QWORD *)a5 + 4) + 8));
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (char *)v17;
  if (*(char *)(v17 + 23) >= 0)
    v9 = *(unsigned __int8 *)(v17 + 23);
  else
    v9 = *(_QWORD *)(v17 + 8);
  v10 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v9 + 10);
  if (v15 < 0)
    v10 = (void **)__p[0];
  if (v9)
  {
    if (v8[23] >= 0)
      v11 = v8;
    else
      v11 = *(char **)v8;
    memmove(v10, v11, v9);
  }
  strcpy((char *)v10 + v9, "_lossValue");
  if (v15 >= 0)
    v12 = __p;
  else
    v12 = (void **)__p[0];
  objc_msgSend(v7, "stringWithUTF8String:", v12);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 < 0)
    operator delete(__p[0]);
  if (v19 == 10 || v19 == 11)
  {
    v13 = *(uint64_t **)(v18 + 24);
    if (*((char *)v13 + 23) < 0)
      v13 = (uint64_t *)*v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  CoreML::Specification::LossLayer::~LossLayer((CoreML::Specification::LossLayer *)v16);
}

- (MLNeuralNetworkUpdateEngine)initWithCompiledArchive:(void *)a3 nnContainer:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  MLNeuralNetworkUpdateEngine *v40;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[80];
  objc_super v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v46 = a5;
  v44 = v9;
  objc_msgSend(v46, "setComputeUnits:", 0);
  v57 = 0;
  v56.receiver = self;
  v56.super_class = (Class)MLNeuralNetworkUpdateEngine;
  v10 = -[MLNeuralNetworkEngine initWithContainer:configuration:error:](&v56, sel_initWithContainer_configuration_error_, v9, v46, &v57);
  v11 = v57;
  if (v10)
  {
    v45 = v11;
    +[MLNeuralNetworkUpdateEngine createCoreMLToEspressoParamsMap](MLNeuralNetworkUpdateEngine, "createCoreMLToEspressoParamsMap");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v10 + 70);
    *((_QWORD *)v10 + 70) = v12;

    CoreML::Specification::NetworkUpdateParameters::NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v55);
    if (+[MLNeuralNetworkUpdateUtils loadUpdateParameters:fromCompiledArchive:error:](MLNeuralNetworkUpdateUtils, "loadUpdateParameters:fromCompiledArchive:error:", v55, a3, a6))
    {
      objc_msgSend(v10, "modelDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLNeuralNetworkUpdateUtils loadParameterDescriptionsAndContainerFromUpdateParameters:modelDescription:](MLNeuralNetworkUpdateUtils, "loadParameterDescriptionsAndContainerFromUpdateParameters:modelDescription:", v55, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setParameterContainer:", v15);

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v46, "parameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v52 != v18)
              objc_enumerationMutation(v16);
            v20 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v10, "parameterContainer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "parameters");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v20) = objc_msgSend(v21, "setCurrentValue:forKey:error:", v23, v20, a6);

            if ((v20 & 1) == 0)
            {

              goto LABEL_17;
            }
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
          if (v17)
            continue;
          break;
        }
      }

      v49 = 0;
      v50 = 0;
      objc_msgSend(v10, "loadLossInputName:updatableLayerNames:fromCompiledArchive:", &v50, &v49, a3);
      v24 = v50;
      v43 = v49;
      v47 = 0;
      v48 = 0;
      objc_msgSend(v10, "loadLossTargetName:lossOutputName:fromUpdateParameters:", &v48, &v47, v55);
      v25 = v48;
      v26 = v48;
      v27 = v47;
      v28 = v47;
      objc_storeStrong((id *)v10 + 66, v25);
      objc_storeStrong((id *)v10 + 71, v27);
      v29 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v44, "modelFilePath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fileURLWithPath:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "createEspressoTaskFrom:updateParameters:lossInputName:lossTargetName:lossOutputName:updatableLayerNames:configuration:error:", v31, v55, v24, v26, v28, v43, v46, a6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        objc_storeStrong((id *)v10 + 65, v32);
        objc_msgSend(v32, "taskState");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)*((_QWORD *)v10 + 64);
        *((_QWORD *)v10 + 64) = v33;

        objc_msgSend(v10, "classLabels");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLNeuralNetworkUpdateUtils createClassLabelToIndexMapWith:](MLNeuralNetworkUpdateUtils, "createClassLabelToIndexMapWith:", v35);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)*((_QWORD *)v10 + 67);
        *((_QWORD *)v10 + 67) = v36;

        *((_BYTE *)v10 + 504) = 1;
        objc_msgSend(v46, "parameters");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v10, "updateWeightsAndBiasesFromConfigParams:error:", v38, a6);

        CoreML::Specification::NetworkUpdateParameters::~NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v55);
        if ((v39 & 1) != 0)
        {
          v40 = (MLNeuralNetworkUpdateEngine *)v10;
          goto LABEL_19;
        }
LABEL_18:
        v40 = 0;
        goto LABEL_19;
      }

    }
LABEL_17:
    CoreML::Specification::NetworkUpdateParameters::~NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v55);
    goto LABEL_18;
  }
  if (!a6)
  {
    v40 = 0;
    goto LABEL_20;
  }
  v45 = v11;
  +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
  v40 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
  v11 = v45;
LABEL_20:

  return v40;
}

- (unint64_t)predictionTypeForKTrace
{
  return 0;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  +[MLDataConversionUtils espressoDataProviderFromFeatureProvider:forPrediction:neuralNetworkEngine:error:](MLDataConversionUtils, "espressoDataProviderFromFeatureProvider:forPrediction:neuralNetworkEngine:error:", a3, 1, self, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MLNeuralNetworkUpdateEngine task](self, "task");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doInferenceOnData:error:", v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[MLDataConversionUtils featureProviderFromEspressoDataProvider:neuralNetworkEngine:options:error:](MLDataConversionUtils, "featureProviderFromEspressoDataProvider:neuralNetworkEngine:options:error:", v11, self, v8, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
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

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkUpdateEngine predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  +[MLDataConversionUtils espressoDataProviderFromBatchProvider:forPrediction:neuralNetworkEngine:error:](MLDataConversionUtils, "espressoDataProviderFromBatchProvider:forPrediction:neuralNetworkEngine:error:", a3, 1, self, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MLNeuralNetworkUpdateEngine task](self, "task");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doInferenceOnData:error:", v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[MLDataConversionUtils batchProviderFromEspressoDataProvider:neuralNetworkEngine:options:error:](MLDataConversionUtils, "batchProviderFromEspressoDataProvider:neuralNetworkEngine:options:error:", v11, self, v8, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
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

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkUpdateEngine predictionsFromBatch:options:error:](self, "predictionsFromBatch:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)stringForDataType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("None");
  else
    return off_1E3D65720[a3 - 1];
}

- (BOOL)updateWeightsAndBiasesFromConfigParams:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  BOOL v19;
  BOOL v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        +[MLParameterKey weights](MLParameterKey, "weights");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "hasSameNameAsKey:", v10);

        if (v11)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "scope");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[MLNeuralNetworkUpdateEngine setWeightsOrBiasesForLayer:layerType:value:error:](self, "setWeightsOrBiasesForLayer:layerType:value:error:", v13, 1, v12, a4);

          if (!v14)
            goto LABEL_13;
        }
        +[MLParameterKey biases](MLParameterKey, "biases");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v9, "hasSameNameAsKey:", v15);

        if (v16)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "scope");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[MLNeuralNetworkUpdateEngine setWeightsOrBiasesForLayer:layerType:value:error:](self, "setWeightsOrBiasesForLayer:layerType:value:error:", v18, 2, v17, a4);

          if (!v19)
          {
LABEL_13:
            v20 = 0;
            goto LABEL_14;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v6)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_14:

  return v20;
}

- (BOOL)setWeightsOrBiasesForLayer:(id)a3 layerType:(unint64_t)a4 value:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  MLMultiArray *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  MLMultiArray *v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  char v24;
  void *v26;
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a5;
  -[MLNeuralNetworkUpdateEngine task](self, "task");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v12, "getParameterOfType:forLayerNamed:error:", a4, v10, &v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v29;

  if (v13)
  {
    v26 = v11;
    v15 = [MLMultiArray alloc];
    v16 = objc_msgSend(v13, "dataPointer");
    objc_msgSend(v13, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "strides");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v14;
    v19 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v15, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v16, v17, 65568, v18, 0, &v28);
    v20 = v28;

    if (v19)
    {
      v27 = v20;
      v21 = objc_msgSend(v26, "copyIntoMultiArray:error:", v19, &v27);
      v22 = v27;

      if ((v21 & 1) != 0)
      {
        -[MLNeuralNetworkUpdateEngine task](self, "task");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "setParameterOfType:forLayerNamed:withValue:error:", a4, v10, v13, a6);

      }
      else if (a6)
      {
        +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", v22, CFSTR("Failed to set weights or biases for layer name: %@"), v10);
        v24 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
      v20 = v22;
    }
    else if (a6)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", v20, CFSTR("Failed to set weights or biases for layer name: %@"), v10);
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }

    v14 = v20;
    v11 = v26;
  }
  else if (a6)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", v14, CFSTR("Cannot get current weights or biases for layer %@."), v10);
    v24 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[MLNeuralNetworkUpdateEngine setProgressHandlers:](self, "setProgressHandlers:", v7);
  -[MLNeuralNetworkUpdateEngine setProgressHandlersDispatchQueue:](self, "setProgressHandlersDispatchQueue:", v6);

}

- (void)updateModelWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  MLShufflingBatchProvider *v11;
  void *v12;
  void *v13;
  MLShufflingBatchProvider *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__MLNeuralNetworkUpdateEngine_updateModelWithData___block_invoke;
  aBlock[3] = &unk_1E3D65700;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v44[0] = v5;
  v44[1] = 3221225472;
  v44[2] = __51__MLNeuralNetworkUpdateEngine_updateModelWithData___block_invoke_2;
  v44[3] = &unk_1E3D65700;
  v44[4] = self;
  v7 = _Block_copy(v44);
  +[MLParameterKey shuffle](MLParameterKey, "shuffle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (!v10)
  {
    v42 = 0;
    +[MLDataConversionUtils espressoDataProviderFromBatchProvider:forPrediction:neuralNetworkEngine:error:](MLDataConversionUtils, "espressoDataProviderFromBatchProvider:forPrediction:neuralNetworkEngine:error:", v4, 0, self, &v42);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v42;
    if (!v16)
      goto LABEL_3;
LABEL_5:
    +[MLParameterKey epochs](MLParameterKey, "epochs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend((id)v22, "longValue");

    -[MLNeuralNetworkUpdateEngine progressHandlers](self, "progressHandlers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = objc_msgSend(v24, "interestedEvents");

    if ((v22 & 1) != 0)
    {
      -[MLNeuralNetworkUpdateEngine progressHandlers](self, "progressHandlers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkUpdateEngine updateParameters](self, "updateParameters");
      v26 = objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "dispatchTrainingBeginProgressHandlerWithMetrics:parameters:onQueue:", MEMORY[0x1E0C9AA70], v26, v27);

      v41 = v17;
      LOBYTE(v26) = -[MLNeuralNetworkUpdateEngine updateLearningRateWithTaskContext:isInCallBack:error:](self, "updateLearningRateWithTaskContext:isInCallBack:error:", 0, 0, &v41);
      v20 = v41;

      if ((v26 & 1) == 0)
      {
        -[MLNeuralNetworkUpdateEngine progressHandlers](self, "progressHandlers");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dispatchTrainingCompletionHandlerWithError:onQueue:", v20, v19);
        goto LABEL_20;
      }
      v17 = v20;
    }
    if (-[MLNeuralNetworkUpdateEngine continueWithUpdate](self, "continueWithUpdate"))
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[MLNeuralNetworkUpdateEngine progressHandlers](self, "progressHandlers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "interestedEvents");

      if ((v29 & 2) != 0)
      {
        v30 = _Block_copy(v6);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D1F488]);

      }
      -[MLNeuralNetworkUpdateEngine progressHandlers](self, "progressHandlers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "interestedEvents");

      if ((v32 & 4) != 0)
      {
        v33 = _Block_copy(v7);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D1F478]);

      }
      -[MLNeuralNetworkUpdateEngine task](self, "task");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v17;
      v35 = objc_msgSend(v34, "doTrainingOnData:forNumberOfEpochs:withCallback:error:", v16, v23, v18, &v40);
      v20 = v40;

      if ((v35 & 1) == 0)
      {
        -[MLNeuralNetworkUpdateEngine progressHandlers](self, "progressHandlers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dispatchTrainingCompletionHandlerWithError:onQueue:", v20, v38);
        goto LABEL_19;
      }
      -[MLNeuralNetworkUpdateEngine task](self, "task");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "taskState");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkUpdateEngine setSnapshot:](self, "setSnapshot:", v37);

    }
    else
    {
      v20 = v17;
    }
    -[MLNeuralNetworkUpdateEngine collectMetricsFromTaskContext:isInCallBack:](self, "collectMetricsFromTaskContext:isInCallBack:", 0, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine progressHandlers](self, "progressHandlers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine updateParameters](self, "updateParameters");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dispatchTrainingCompletionHandlerWithMetrics:parameters:onQueue:", v18, v38, v39);

LABEL_19:
    goto LABEL_20;
  }
  v11 = [MLShufflingBatchProvider alloc];
  +[MLParameterKey seed](MLParameterKey, "seed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MLShufflingBatchProvider initWithBatchProvider:seed:](v11, "initWithBatchProvider:seed:", v4, v13);
  -[MLNeuralNetworkUpdateEngine setShuffableTrainingData:](self, "setShuffableTrainingData:", v14);

  -[MLNeuralNetworkUpdateEngine shuffableTrainingData](self, "shuffableTrainingData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  +[MLDataConversionUtils espressoDataProviderFromBatchProvider:forPrediction:neuralNetworkEngine:error:](MLDataConversionUtils, "espressoDataProviderFromBatchProvider:forPrediction:neuralNetworkEngine:error:", v15, 0, self, &v43);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v43;

  if (v16)
    goto LABEL_5;
LABEL_3:
  -[MLNeuralNetworkUpdateEngine progressHandlers](self, "progressHandlers");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dispatchTrainingCompletionHandlerWithError:onQueue:", v17, v19);
  v20 = v17;
LABEL_20:

}

- (id)updateParameters
{
  void *v2;
  void *v3;

  -[MLNeuralNetworkUpdateEngine parameterContainer](self, "parameterContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentParameterValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resumeUpdate
{
  -[MLNeuralNetworkUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
}

- (void)cancelUpdate
{
  -[MLNeuralNetworkUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 0);
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
  -[MLNeuralNetworkUpdateEngine parameterContainer](self, "parameterContainer");
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
    -[MLNeuralNetworkUpdateEngine setContinueWithUpdate:](self, "setContinueWithUpdate:", 1);
  }
  else
  {
    -[MLNeuralNetworkUpdateEngine progressHandlers](self, "progressHandlers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine progressHandlersDispatchQueue](self, "progressHandlersDispatchQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dispatchTrainingCompletionHandlerWithError:onQueue:", v10, v12);

  }
}

- (BOOL)updateLearningRateWithTaskContext:(id)a3 isInCallBack:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  BOOL v24;
  id v26;
  id v27;

  v6 = a4;
  v8 = a3;
  +[MLParameterKey learningRate](MLParameterKey, "learningRate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkUpdateEngine parameterValueForKey:](self, "parameterValueForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  if (v6)
  {
    -[MLNeuralNetworkUpdateEngine coreMLToEspressoParamsMap](self, "coreMLToEspressoParamsMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterKey learningRate](MLParameterKey, "learningRate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getTensorNamed:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MLNeuralNetworkUpdateEngine task](self, "task");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine coreMLToEspressoParamsMap](self, "coreMLToEspressoParamsMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterKey learningRate](MLParameterKey, "learningRate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getTensorNamed:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v16)
  {
    *(_DWORD *)objc_msgSend(v16, "dataPointer") = v12;
    if (v6)
    {
      -[MLNeuralNetworkUpdateEngine coreMLToEspressoParamsMap](self, "coreMLToEspressoParamsMap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLParameterKey learningRate](MLParameterKey, "learningRate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend(v8, "setTensorNamed:withValue:error:", v20, v16, &v27);
      v21 = v27;
    }
    else
    {
      -[MLNeuralNetworkUpdateEngine task](self, "task");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkUpdateEngine coreMLToEspressoParamsMap](self, "coreMLToEspressoParamsMap");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLParameterKey learningRate](MLParameterKey, "learningRate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v18, "setTensorNamed:withValue:error:", v23, v16, &v26);
      v21 = v26;

    }
    if (!v21)
    {
      v24 = 1;
      goto LABEL_17;
    }
    if (!a5)
    {
      v24 = 0;
      goto LABEL_17;
    }
    v22 = objc_retainAutorelease(v21);
    v21 = v22;
  }
  else
  {
    if (!a5)
    {
      v24 = 0;
      v21 = 0;
      goto LABEL_17;
    }
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Cannot get current learning rate."));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
  }
  v24 = 0;
  *a5 = v22;
LABEL_17:

  return v24;
}

- (id)collectMetricsFromTaskContext:(id)a3 isInCallBack:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MLNeuralNetworkUpdateEngine lossOutputName](self, "lossOutputName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getTensorNamed:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MLNeuralNetworkUpdateEngine task](self, "task");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine lossOutputName](self, "lossOutputName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getTensorNamed:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    LODWORD(v11) = *(_DWORD *)objc_msgSend(v9, "dataPointer");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLMetricKey lossValue](MLMetricKey, "lossValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

  }
  return v7;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  _QWORD v27[2];
  id v28;
  id v29;

  v6 = a3;
  -[MLModelEngine modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v9 = +[MLSaver copyModelAtURL:toURL:error:](MLSaver, "copyModelAtURL:toURL:error:", v8, v6, &v29);
  v10 = v29;

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine task](self, "task");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("model.espresso.net"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v10;
    v15 = objc_msgSend(v12, "saveNetwork:inplace:error:", v14, 1, &v28);
    v16 = v28;

    if ((v15 & 1) != 0)
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("model_updatable.espresso.net"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v16;
      objc_msgSend(v11, "removeItemAtURL:error:", v17, &v26);
      v18 = v26;

      objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("model_updatable.espresso.weights"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v18;
      objc_msgSend(v11, "removeItemAtURL:error:", v19, &v25);
      v16 = v25;

      objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("model_updatable.espresso.shape"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v16;
      v21 = &v24;
      objc_msgSend(v11, "removeItemAtURL:error:", v20, &v24);
    }
    else
    {
      if (a4)
      {
        objc_msgSend(v6, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v16, CFSTR("Failed to copy updated model to %@"), v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v16;
      v21 = (id *)v27;
      objc_msgSend(v11, "removeItemAtPath:error:", v20, v27);
    }
    v10 = *v21;

  }
  else
  {
    if (!a4)
    {
      v15 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v6, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v10, CFSTR("Failed to copy original model files to the new destionation: %@"), v11);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  return v15;
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
  uint64_t v13;
  void *v14;
  int v15;

  v6 = a3;
  if (objc_msgSend(v6, "hasGlobalScope"))
  {
    -[MLNeuralNetworkUpdateEngine parameterContainer](self, "parameterContainer");
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
    objc_msgSend(v6, "scope");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine paramsForLayer:parameterType:error:](self, "paramsForLayer:parameterType:error:", v12, 1, a4);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (void *)v13;

    goto LABEL_12;
  }
  +[MLParameterKey biases](MLParameterKey, "biases");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "hasSameNameAsKey:", v14);

  if (v15)
  {
    objc_msgSend(v6, "scope");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkUpdateEngine paramsForLayer:parameterType:error:](self, "paramsForLayer:parameterType:error:", v12, 2, a4);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  if (a4)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Updated neural network model does not have a parameter for requested key %@."), v6);
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

- (id)parameterValueForKey:(id)a3
{
  -[MLNeuralNetworkUpdateEngine parameterValueForKey:error:](self, "parameterValueForKey:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)paramsForLayer:(id)a3 parameterType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  MLMultiArray *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MLMultiArray *v16;
  id v17;
  MLMultiArray *v18;
  void *v19;
  MLMultiArray *v20;
  id v21;
  BOOL v22;
  id v23;
  MLMultiArray *v24;
  id v26;
  id v27;
  id v28;
  id v29;

  v8 = a3;
  -[MLNeuralNetworkUpdateEngine task](self, "task");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v9, "getParameterOfType:forLayerNamed:error:", a4, v8, &v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;

  if (v10)
  {
    v12 = [MLMultiArray alloc];
    v13 = objc_msgSend(v10, "dataPointer");
    objc_msgSend(v10, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strides");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v11;
    v16 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v12, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v13, v14, 65568, v15, 0, &v28);
    v17 = v28;

    if (v16)
    {
      v18 = [MLMultiArray alloc];
      objc_msgSend(v10, "shape");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v17;
      v20 = -[MLMultiArray initWithShape:dataType:storageOrder:error:](v18, "initWithShape:dataType:storageOrder:error:", v19, 65568, 0, &v27);
      v21 = v27;

      if (v20)
      {
        v26 = v21;
        v22 = -[MLMultiArray copyIntoMultiArray:error:](v16, "copyIntoMultiArray:error:", v20, &v26);
        v23 = v26;

        if (v22)
        {
          v24 = v20;
        }
        else if (a5)
        {
          +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", v23, CFSTR("Updatable neural network failed to retrive parameter for layer %@."), v8);
          v24 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        v21 = v23;
      }
      else if (a5)
      {
        +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", v21, CFSTR("Updatable neural network failed to retrive parameter for layer %@."), v8);
        v24 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }

      v17 = v21;
    }
    else if (a5)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", v17, CFSTR("Updatable neural network failed to retrive parameter for layer %@."), v8);
      v24 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }

    v11 = v17;
  }
  else if (a5)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", v11, CFSTR("Updatable neural network failed to retrive parameter for layer %@."), v8);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)weightsForLayer:(id)a3 error:(id *)a4
{
  -[MLNeuralNetworkUpdateEngine paramsForLayer:parameterType:error:](self, "paramsForLayer:parameterType:error:", a3, 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)biasForLayer:(id)a3 error:(id *)a4
{
  -[MLNeuralNetworkUpdateEngine paramsForLayer:parameterType:error:](self, "paramsForLayer:parameterType:error:", a3, 2, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MLNeuralNetworkUpdateEngine)initWithCoder:(id)a3
{

  return 0;
}

- (ETTaskState)snapshot
{
  return *(ETTaskState **)&self->super.super._network.network_index;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->super.super._network.network_index, a3);
}

- (ETTaskDefinition)task
{
  return *(ETTaskDefinition **)&self->_continueWithUpdate;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_continueWithUpdate, a3);
}

- (NSString)lossTargetName
{
  return (NSString *)self->_snapshot;
}

- (void)setLossTargetName:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (NSDictionary)classLabelToIndexMap
{
  return (NSDictionary *)self->_task;
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return (MLUpdateProgressHandlers *)self->_lossTargetName;
}

- (void)setProgressHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_lossTargetName, a3);
}

- (OS_dispatch_queue)progressHandlersDispatchQueue
{
  return (OS_dispatch_queue *)self->_classLabelToIndexMap;
}

- (void)setProgressHandlersDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_classLabelToIndexMap, a3);
}

- (NSDictionary)coreMLToEspressoParamsMap
{
  return (NSDictionary *)self->_progressHandlers;
}

- (void)setCoreMLToEspressoParamsMap:(id)a3
{
  objc_storeStrong((id *)&self->_progressHandlers, a3);
}

- (NSString)lossOutputName
{
  return (NSString *)self->_progressHandlersDispatchQueue;
}

- (void)setLossOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, a3);
}

- (BOOL)continueWithUpdate
{
  return (BOOL)self->super.super._network.plan;
}

- (void)setContinueWithUpdate:(BOOL)a3
{
  LOBYTE(self->super.super._network.plan) = a3;
}

- (MLShufflingBatchProvider)shuffableTrainingData
{
  return (MLShufflingBatchProvider *)self->_coreMLToEspressoParamsMap;
}

- (void)setShuffableTrainingData:(id)a3
{
  objc_storeStrong((id *)&self->_coreMLToEspressoParamsMap, a3);
}

- (MLParameterContainer)parameterContainer
{
  return (MLParameterContainer *)self->_lossOutputName;
}

- (void)setParameterContainer:(id)a3
{
  objc_storeStrong((id *)&self->_lossOutputName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lossOutputName, 0);
  objc_storeStrong((id *)&self->_coreMLToEspressoParamsMap, 0);
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_classLabelToIndexMap, 0);
  objc_storeStrong((id *)&self->_lossTargetName, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_continueWithUpdate, 0);
  objc_storeStrong((id *)&self->super.super._network.network_index, 0);
}

uint64_t __51__MLNeuralNetworkUpdateEngine_updateModelWithData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
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
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLMetricKey epochIndex](MLMetricKey, "epochIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "collectMetricsFromTaskContext:isInCallBack:", v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLMetricKey lossValue](MLMetricKey, "lossValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[MLMetricKey lossValue](MLMetricKey, "lossValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLMetricKey lossValue](MLMetricKey, "lossValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

  }
  objc_msgSend(*(id *)(a1 + 32), "progressHandlers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateParameters");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "progressHandlersDispatchQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dispatchEpochEndProgressHandlerWithMetrics:parameters:onQueue:", v7, v17, v18);

  v19 = *(void **)(a1 + 32);
  v32 = 0;
  LOBYTE(v17) = objc_msgSend(v19, "updateLearningRateWithTaskContext:isInCallBack:error:", v6, 1, &v32);
  v20 = v32;
  v21 = *(void **)(a1 + 32);
  if ((v17 & 1) != 0)
  {
    objc_msgSend(v21, "shuffableTrainingData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = *(void **)(a1 + 32);
      +[MLParameterKey shuffle](MLParameterKey, "shuffle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "parameterValueForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "BOOLValue");

      if (v26)
      {
        objc_msgSend(*(id *)(a1 + 32), "shuffableTrainingData");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shuffle");

      }
    }
    v28 = objc_msgSend(*(id *)(a1 + 32), "continueWithUpdate");
  }
  else
  {
    objc_msgSend(v21, "progressHandlers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "progressHandlersDispatchQueue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dispatchTrainingCompletionHandlerWithError:onQueue:", v20, v30);

    v28 = 0;
  }

  return v28;
}

uint64_t __51__MLNeuralNetworkUpdateEngine_updateModelWithData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
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
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLMetricKey miniBatchIndex](MLMetricKey, "miniBatchIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "collectMetricsFromTaskContext:isInCallBack:", v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLMetricKey lossValue](MLMetricKey, "lossValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[MLMetricKey lossValue](MLMetricKey, "lossValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLMetricKey lossValue](MLMetricKey, "lossValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

  }
  objc_msgSend(*(id *)(a1 + 32), "progressHandlers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateParameters");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "progressHandlersDispatchQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dispatchMiniBatchEndProgressHandlerWithMetrics:parameters:onQueue:", v7, v17, v18);

  v19 = *(void **)(a1 + 32);
  v26 = 0;
  LOBYTE(v17) = objc_msgSend(v19, "updateLearningRateWithTaskContext:isInCallBack:error:", v6, 1, &v26);
  v20 = v26;
  v21 = *(void **)(a1 + 32);
  if ((v17 & 1) != 0)
  {
    v22 = objc_msgSend(v21, "continueWithUpdate");
  }
  else
  {
    objc_msgSend(v21, "progressHandlers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "progressHandlersDispatchQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dispatchTrainingCompletionHandlerWithError:onQueue:", v20, v24);

    v22 = 0;
  }

  return v22;
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

+ (id)createCoreMLToEspressoParamsMap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  +[MLParameterKey miniBatchSize](MLParameterKey, "miniBatchSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v11[0] = *MEMORY[0x1E0D20190];
  +[MLParameterKey learningRate](MLParameterKey, "learningRate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v11[1] = *MEMORY[0x1E0D201B0];
  +[MLParameterKey beta1](MLParameterKey, "beta1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v11[2] = *MEMORY[0x1E0D20198];
  +[MLParameterKey beta2](MLParameterKey, "beta2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v11[3] = *MEMORY[0x1E0D201A0];
  +[MLParameterKey eps](MLParameterKey, "eps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  v11[4] = *MEMORY[0x1E0D201A8];
  +[MLParameterKey momentum](MLParameterKey, "momentum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  v11[5] = *MEMORY[0x1E0D201B8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end
