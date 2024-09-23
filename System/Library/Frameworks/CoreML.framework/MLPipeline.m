@implementation MLPipeline

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  v25 = v10;
  v11 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v11, "setParentSignpostID:", -[MLModelEngine signpostID](self, "signpostID"));
  for (i = 0; ; ++i)
  {
    if (i >= -[NSArray count](self->_models, "count"))
    {
      v18 = (void *)MEMORY[0x1E0C99E60];
      -[MLModelEngine modelDescription](self, "modelDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "outputDescriptionsByName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithArray:", v21);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:providedBy:](MLFeatureProviderUtils, "providerWithSubsetOfFeaturesNamed:providedBy:", v15, v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    -[NSArray objectAtIndexedSubscript:](self->_models, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v13, "predictionFromFeatures:options:error:", v10, v11, &v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v26;

    if (!v14 || v15 != 0)
      break;
    +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:](MLFeatureProviderUtils, "lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:", v14, v10);
    v17 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v17;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v15, CFSTR("Failed to evaluate model %@ in pipeline"), v23);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v22 = 0;
LABEL_13:

  return v22;
}

- (void)updateParameterDescriptionsByKeyBasedOnSubModel
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  while (1)
  {
    -[MLPipeline models](self, "models");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v23 < objc_msgSend(v2, "count");

    if (!v3)
      break;
    -[MLPipeline models](self, "models");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", v23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLPipeline modelNames](self, "modelNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "modelDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parameterDescriptionsByKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") == 0;

    if (!v10)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v5, "modelDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "parameterDescriptionsByKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v26;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
            objc_msgSend(v5, "modelDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "parameterDescriptionsByKey");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "scopedTo:", v7);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, v20);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
      }

    }
    ++v23;
  }
  if (objc_msgSend(v24, "count"))
  {
    -[MLModelEngine modelDescription](self, "modelDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setParameterDescriptionsByKey:", v24);

  }
}

- (id)initModelFromMetadataAndArchive:(void *)a3 versionInfo:(id)a4 description:(id)a5 configuration:(id)a6 error:(id *)a7
{
  MLPipeline *v9;
  id *p_isa;
  char v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  id v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  id v39;
  void *v40;
  id obj;
  id v43;
  MLPipeline *v44;
  void *__p[2];
  char v46;
  char v47[8];
  std::__shared_weak_count *v48;
  char *v49;
  id v50;
  id v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)MLPipeline;
  v43 = a6;
  v9 = -[MLModelEngine initWithDescription:configuration:](&v52, sel_initWithDescription_configuration_, a5);
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    v44 = v9;
    v51 = 0;
    v50 = 0;
    v11 = objc_msgSend((id)objc_opt_class(), "parseModelArchive:subModelNames:subModelArchiveNames:error:", a3, &v51, &v50, a7);
    v39 = v51;
    v12 = v51;
    v13 = v50;
    if ((v11 & 1) == 0)
    {

LABEL_17:
      v34 = 0;
      goto LABEL_18;
    }
    v40 = v13;
    v14 = objc_msgSend(v12, "count");
    v15 = (void *)objc_msgSend(v43, "copy");
    objc_msgSend(v15, "modelDisplayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setParentModelName:", v16);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v14);
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v17 = 0;
      v18 = 1;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v17, v39);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndexedSubscript:", v17);
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v20, "UTF8String"));
        v21 = IArchive::nestedArchive(a3, (uint64_t)__p);
        _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)v47, (const IArchive *)v21);
        if (v46 < 0)
          operator delete(__p[0]);
        objc_msgSend(v43, "parameters");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLParameterUtils deScopeParameters:byDeletingPrefixingScope:](MLParameterUtils, "deScopeParameters:byDeletingPrefixingScope:", v22, v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setParameters:", v23);

        objc_msgSend(v15, "setModelDisplayName:", v19);
        +[MLLoader loadModelFromArchive:configuration:error:](MLLoader, "loadModelFromArchive:configuration:error:", v47, v15, a7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
          break;
        -[MLModelEngine modelPath](v44, "modelPath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setModelPath:modelName:", v25, v19);

        objc_msgSend(obj, "addObject:", v24);
        std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v49);
        v26 = v48;
        if (v48)
        {
          p_shared_owners = (unint64_t *)&v48->__shared_owners_;
          do
            v28 = __ldaxr(p_shared_owners);
          while (__stlxr(v28 - 1, p_shared_owners));
          if (!v28)
          {
            ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
            std::__shared_weak_count::__release_weak(v26);
          }
        }

        v18 = ++v17 < v14;
        p_isa = (id *)&v44->super.super.isa;
        if (v17 == v14)
          goto LABEL_14;
      }
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v49);
      v36 = v48;
      if (v48)
      {
        v37 = (unint64_t *)&v48->__shared_owners_;
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
          std::__shared_weak_count::__release_weak(v36);
        }
      }

      p_isa = (id *)&v44->super.super.isa;
      if (v18)
        goto LABEL_17;
    }
    else
    {
LABEL_14:
      objc_storeStrong(p_isa + 4, obj);
      objc_storeStrong(p_isa + 5, v39);
      v29 = (void *)objc_opt_class();
      objc_msgSend(p_isa, "modelDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "predictedFeatureName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "classLabelsForPipelineFromSubModelArray:predictedFeatureName:", obj, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "modelDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setClassLabels:", v32);

      objc_msgSend(p_isa, "updateParameterDescriptionsByKeyBasedOnSubModel");
    }
  }
  v34 = p_isa;
LABEL_18:

  return v34;
}

- (MLPipeline)initWithModels:(id)a3 modelNames:(id)a4 description:(id)a5 configuration:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MLPipeline *v14;
  uint64_t v15;
  NSArray *models;
  uint64_t v17;
  NSArray *modelNames;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MLPipeline *v24;
  NSObject *v25;
  objc_super v27;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v27.receiver = self;
    v27.super_class = (Class)MLPipeline;
    v14 = -[MLModelEngine initWithDescription:configuration:](&v27, sel_initWithDescription_configuration_, v12, v13);
    if (v14)
    {
      v15 = objc_msgSend(v10, "copy");
      models = v14->_models;
      v14->_models = (NSArray *)v15;

      v17 = objc_msgSend(v11, "copy");
      modelNames = v14->_modelNames;
      v14->_modelNames = (NSArray *)v17;

      v19 = (void *)objc_opt_class();
      -[MLModelEngine modelDescription](v14, "modelDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "predictedFeatureName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "classLabelsForPipelineFromSubModelArray:predictedFeatureName:", v10, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLModelEngine modelDescription](v14, "modelDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setClassLabels:", v22);

      -[MLPipeline updateParameterDescriptionsByKeyBasedOnSubModel](v14, "updateParameterDescriptionsByKeyBasedOnSubModel");
    }
    self = v14;
    v24 = self;
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v25, OS_LOG_TYPE_ERROR, "Pipeline model must have at least 1 submodel.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Pipeline model must have at least 1 submodel."));
    v24 = 0;
  }

  return v24;
}

- (unint64_t)predictionTypeForKTrace
{
  return 3;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = 0;
  v25 = v10;
  while (1)
  {
    if (v11 >= -[NSArray count](self->_models, "count"))
    {
      v17 = (void *)MEMORY[0x1E0C99E60];
      -[MLModelEngine modelDescription](self, "modelDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "outputDescriptionsByName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v20);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      +[MLBatchProviderUtils batchWithSubsetOfFeaturesNamed:fromBatch:](MLBatchProviderUtils, "batchWithSubsetOfFeaturesNamed:fromBatch:", v14, v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    -[NSArray objectAtIndexedSubscript:](self->_models, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v12, "predictionsFromBatch:options:error:", v10, v9, &v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v27;

    if (!v13 || v14 != 0)
      break;
    v26 = 0;
    +[MLBatchProviderUtils lazyBatchWithFeaturesInBatch:addedToBatch:error:](MLBatchProviderUtils, "lazyBatchWithFeaturesInBatch:addedToBatch:error:", v13, v10, &v26);
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = v26;

    if (v14)
    {
      if (!a5)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v14, CFSTR("Failed to carry forward results for model %@ in pipeline"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }

    ++v11;
    v10 = (id)v16;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v14, CFSTR("Failed to evaluate model %@ in pipeline"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (uint64_t)v10;
LABEL_15:
    *a5 = v23;

    goto LABEL_17;
  }
  v16 = (uint64_t)v10;
LABEL_17:

  v21 = 0;
  v10 = (id)v16;
LABEL_18:

  return v21;
}

- (BOOL)supportsConcurrentSubmissions
{
  return 1;
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "predictionOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "setParentSignpostID:", -[MLModelEngine signpostID](self, "signpostID"));
  objc_msgSend(v10, "inputFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLPipeline _submitPredictionRequestToSubmodel:input:options:completionHandler:](self, "_submitPredictionRequestToSubmodel:input:options:completionHandler:", 0, v9, v8, v6);

}

- (void)_submitPredictionRequestToSubmodel:(unint64_t)a3 input:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MLPipeline *v20;
  id v21;
  id v22;
  unint64_t v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[MLPipeline models](self, "models");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__MLPipeline__submitPredictionRequestToSubmodel_input_options_completionHandler___block_invoke;
  v18[3] = &unk_1E3D65980;
  v23 = a3;
  v15 = v12;
  v22 = v15;
  v16 = v10;
  v19 = v16;
  v20 = self;
  v17 = v11;
  v21 = v17;
  objc_msgSend(v14, "predictionFromFeatures:options:completionHandler:", v16, v17, v18);

}

- (void)replaceModelAtIndex:(unint64_t)a3 with:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MLPipeline models](self, "models");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:atIndexedSubscript:", v8, a3);
  -[MLPipeline setModels:](self, "setModels:", v7);

}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  char v11;
  void *v12;
  id v14;

  v6 = a3;
  -[MLModelEngine modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = +[MLSaver copyModelAtURL:toURL:error:](MLSaver, "copyModelAtURL:toURL:error:", v8, v6, &v14);
  v10 = v14;

  if (a4)
    v11 = v9;
  else
    v11 = 1;
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v6, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v10, CFSTR("Failed to copy original model files to the new destionation: %@"), v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  id v20;

  v6 = a3;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    -[MLPipeline models](self, "models");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v7 >= v10)
      break;
    -[MLPipeline models](self, "models");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLPipeline modelNames](self, "modelNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "deletingPrefixingScope:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v12, "parameterValueForKey:error:", v15, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;

    if (v16)
    {
      if (v8)
      {
        if (a4)
        {
          +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Pipeline Model contains multiple models that have parameter for requested key %@. Use parameter scoping to disambiguate."), v6);
          v18 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        goto LABEL_9;
      }
      v8 = v16;
    }
    v18 = 1;
LABEL_9:

    ++v7;
    if ((v18 & 1) == 0)
    {

      v8 = 0;
      goto LABEL_15;
    }
  }
  if (!v8 && a4)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Pipeline Model does not contain a model that has a parameter for requested key %@."), v6);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v8;
}

- (id)executionSchedule
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  void *v18;
  NSUInteger v20;
  MLModelExecutionSchedule *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  NSUInteger v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v20 = -[NSArray count](self->_models, "count");
    *(_DWORD *)buf = 134217984;
    v28 = v20;
    _os_log_debug_impl(&dword_19C486000, v3, OS_LOG_TYPE_DEBUG, "Profiler: MLPipeline::executionSchedule %lu networks", buf, 0xCu);
  }

  v21 = objc_alloc_init(MLModelExecutionSchedule);
  -[MLModelEngine configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "profilingOptions") & 1) == 0;

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[MLPipeline models](self, "models");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "executionSchedule");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "modelExecutionSchedule");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count") == 0;

          if (v14)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_19C486000, v15, OS_LOG_TYPE_DEBUG, "Profiler: [schedule] Model in pipeline does not have a schedule", buf, 2u);
            }
          }
          else
          {
            objc_msgSend(v12, "modelExecutionSchedule");
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addEntriesFromDictionary:", v15);
          }

          objc_msgSend(v12, "modelExecutionScheduleByModelStructurePath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count") == 0;

          if (!v17)
          {
            objc_msgSend(v12, "modelExecutionScheduleByModelStructurePath");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addEntriesFromDictionary:", v18);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    -[MLModelExecutionSchedule setModelExecutionSchedule:](v21, "setModelExecutionSchedule:", v6);
    -[MLModelExecutionSchedule setModelExecutionScheduleByModelStructurePath:](v21, "setModelExecutionScheduleByModelStructurePath:", v7);

  }
  return v21;
}

- (NSArray)models
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)modelNames
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModelNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNames, 0);
  objc_storeStrong((id *)&self->_models, 0);
}

void __81__MLPipeline__submitPredictionRequestToSubmodel_input_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = v5;
  if (v17)
  {
    +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:](MLFeatureProviderUtils, "lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:", v17, *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "models");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 + 1 == v10)
    {
      v11 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(*(id *)(a1 + 40), "modelDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "outputDescriptionsByName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:providedBy:](MLFeatureProviderUtils, "providerWithSubsetOfFeaturesNamed:providedBy:", v15, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_submitPredictionRequestToSubmodel:input:options:completionHandler:", *(_QWORD *)(a1 + 64) + 1, v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
  }
  else
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v5, CFSTR("Failed to evaluate model %tu in pipeline"), *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

+ (void)archivePipelineUpdateParameterForModels:(const void *)a3 to:(void *)a4 updatable:(BOOL)a5
{
  char *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  char v20[8];
  uint64_t v21;
  std::__shared_weak_count *v22;
  char *v23[3];
  void *__p[2];
  char v25;

  if (a5)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "updateParameters");
    v7 = OArchive::nestedArchive((char *)a4, (uint64_t)__p);
    if (v25 < 0)
      operator delete(__p[0]);
    (*(void (**)(_QWORD))(**((_QWORD **)v7 + 1) + 56))(*((_QWORD *)v7 + 1));
    v20[0] = *v7;
    v8 = (std::__shared_weak_count *)*((_QWORD *)v7 + 2);
    v21 = *((_QWORD *)v7 + 1);
    v22 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v23, (_QWORD *)v7 + 3);
    v11 = *((int *)a3 + 2);
    if ((_DWORD)v11)
    {
      v12 = 0;
      v13 = 0;
      v14 = *((int *)a3 + 2);
      do
      {
        v13 += *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)a3 + 2) + (v12 >> 29) + 8) + 28);
        v12 += 0x100000000;
        --v14;
      }
      while (v14);
    }
    else
    {
      v13 = 0;
    }
    operator<<((uint64_t)v20, v13);
    if ((_DWORD)v11)
    {
      v15 = 0;
      for (i = 0; i != v11; ++i)
      {
        if (*(_BYTE *)(*(_QWORD *)(*((_QWORD *)a3 + 2) + (v15 >> 29) + 8) + 28))
          operator<<((uint64_t)v20, i);
        v15 += 0x100000000;
      }
    }
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v23[1]);
    v17 = v22;
    if (v22)
    {
      v18 = (unint64_t *)&v22->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
}

+ (void)archiveCustomModelNames:(const void *)a3 to:(void *)a4
{
  unint64_t v4;
  char *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *__p[2];
  std::__shared_weak_count *v19;
  char *v20;
  char v21[8];
  uint64_t v22;
  std::__shared_weak_count *v23;
  char *v24[3];

  v4 = *((int *)a3 + 2);
  if ((_DWORD)v4)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "modelNames");
    v7 = OArchive::nestedArchive((char *)a4, (uint64_t)__p);
    v21[0] = *v7;
    v8 = (std::__shared_weak_count *)*((_QWORD *)v7 + 2);
    v22 = *((_QWORD *)v7 + 1);
    v23 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v24, (_QWORD *)v7 + 3);
    if (SHIBYTE(v19) < 0)
      operator delete(__p[0]);
    _MLModelOutputArchiver::_MLModelOutputArchiver((uint64_t)__p, (uint64_t)v21);
    operator<<((uint64_t)__p, v4);
    v11 = 0;
    if (v4 <= 1)
      v4 = 1;
    do
    {
      operator<<((uint64_t)__p, *(uint64_t **)(*((_QWORD *)a3 + 2) + (v11 >> 29) + 8));
      v11 += 0x100000000;
      --v4;
    }
    while (v4);
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v20);
    v12 = v19;
    if (v19)
    {
      v13 = (unint64_t *)&v19->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v24[1]);
    v15 = v23;
    if (v23)
    {
      v16 = (unint64_t *)&v23->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
}

+ (BOOL)archivePipelineModelDetailsFrom:(const void *)a3 toArchive:(void *)a4 error:(id *)a5
{
  _OWORD *v7;
  BOOL v8;
  void *__p[2];
  char v11;
  std::string __str;
  _QWORD v13[11];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  _QWORD *v17[2];
  void **v18;

  v17[0] = 0;
  v17[1] = 0;
  v16 = (uint64_t *)v17;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v13);
  std::ostream::operator<<();
  std::stringbuf::str();
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("modelDimension"), "UTF8String"));
  v18 = __p;
  v7 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v16, __p, (_OWORD **)&v18);
  std::string::operator=((std::string *)((char *)v7 + 56), &__str);
  if (v11 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "PipelineModelDetails");
  v8 = +[MLReporterUtils archiveModelDetails:withName:toArchive:error:](MLReporterUtils, "archiveModelDetails:withName:toArchive:error:", &v16, __p, a4, a5);
  if (v11 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v13[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v13 + *(_QWORD *)(v13[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v13[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v14 < 0)
    operator delete((void *)v13[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1A1AD61C4](&v15);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v17[0]);
  return v8;
}

+ (id)compileWithModelsInPipeline:(const void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 updatable:(BOOL)a7 osSizeTracking:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint8x8_t v20;
  uint64_t **v21;
  uint64_t *i;
  unint64_t v23;
  _QWORD *v24;
  float v25;
  _BOOL8 v26;
  unint64_t v27;
  unint64_t v28;
  size_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  char *v35;
  char *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  std::string *v43;
  __int128 v44;
  char *v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  CoreML::Specification::Model *v49;
  CoreML::Specification::ModelDescription *v50;
  CoreML::Specification::Metadata *v51;
  uint64_t v52;
  google::protobuf::Arena **v53;
  uint8x8_t v54;
  unint64_t v55;
  uint64_t **v56;
  uint64_t *j;
  unint64_t v58;
  id v59;
  id v60;
  std::__shared_weak_count *v61;
  unint64_t *p_shared_owners;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  id *v70;
  id v71;
  void *v72;
  void *v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  NSObject *v83;
  const CoreML::Specification::Pipeline *v84;
  const CoreML::Specification::Pipeline *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v93;
  void *v94;
  _BOOL4 v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  CoreML::Specification::ModelDescription **v101;
  std::__shared_weak_count *v102;
  void *v103[2];
  std::__shared_weak_count *v104;
  char *v105;
  std::string v106;
  void *v107[2];
  void *__p[2];
  int v109;
  uint8_t buf[16];
  __int128 v111;
  char *v112;
  uint64_t v113;
  _QWORD v114[3];

  v96 = a7;
  v114[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v97 = a6;
  v14 = a8;
  *(_OWORD *)v107 = 0u;
  *(_OWORD *)__p = 0u;
  v109 = 1065353216;
  v98 = v13;
  if (v13)
  {
    *(_OWORD *)buf = 0uLL;
    v111 = 0uLL;
    LODWORD(v112) = 1065353216;
    std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>((uint64_t)buf, (unint64_t)(float)(unint64_t)*((int *)a3 + 6));
    if (*((int *)a3 + 6) >= 1)
    {
      v15 = 0;
      while (1)
      {
        v16 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)a3 + 4) + 8 * v15 + 8) + 44);
        +[MLModelTypeRegistry sharedInstance](MLModelTypeRegistry, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "classForCompilingModelType:", v16);

        if (objc_msgSend((id)v18, "conformsToProtocol:", &unk_1EE438330))
          break;
LABEL_43:
        if ((uint64_t)++v15 >= *((int *)a3 + 6))
          goto LABEL_44;
      }
      v19 = *(_QWORD *)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v20 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&buf[8]);
        v20.i16[0] = vaddlv_u8(v20);
        if (v20.u32[0] > 1uLL)
        {
          v18 = v15;
          if (*(_QWORD *)&buf[8] <= v15)
            v18 = v15 % *(_QWORD *)&buf[8];
        }
        else
        {
          v18 = (*(_QWORD *)&buf[8] + 0x7FFFFFFFFFFFFFFFLL) & v15;
        }
        v21 = *(uint64_t ***)(*(_QWORD *)buf + 8 * v18);
        if (v21)
        {
          for (i = *v21; i; i = (uint64_t *)*i)
          {
            v23 = i[1];
            if (v23 == v15)
            {
              if (v15 == *((_DWORD *)i + 4))
                goto LABEL_43;
            }
            else
            {
              if (v20.u32[0] > 1uLL)
              {
                if (v23 >= *(_QWORD *)&buf[8])
                  v23 %= *(_QWORD *)&buf[8];
              }
              else
              {
                v23 &= *(_QWORD *)&buf[8] - 1;
              }
              if (v23 != v18)
                break;
            }
          }
        }
      }
      v24 = operator new(0x18uLL);
      *v24 = 0;
      v24[1] = v15;
      *((_DWORD *)v24 + 4) = v15;
      v25 = (float)(unint64_t)(*((_QWORD *)&v111 + 1) + 1);
      if (!v19 || (float)(*(float *)&v112 * (float)v19) < v25)
      {
        v26 = (v19 & (v19 - 1)) != 0;
        if (v19 < 3)
          v26 = 1;
        v27 = v26 | (2 * v19);
        v28 = vcvtps_u32_f32(v25 / *(float *)&v112);
        if (v27 <= v28)
          v29 = v28;
        else
          v29 = v27;
        std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>((uint64_t)buf, v29);
        v19 = *(_QWORD *)&buf[8];
        if ((v19 & (v19 - 1)) != 0)
        {
          if (*(_QWORD *)&buf[8] <= v15)
            v18 = v15 % *(_QWORD *)&buf[8];
          else
            v18 = v15;
        }
        else
        {
          v18 = (*(_QWORD *)&buf[8] + 0x7FFFFFFFFFFFFFFFLL) & v15;
        }
      }
      v30 = *(_QWORD *)buf;
      v31 = *(_QWORD **)(*(_QWORD *)buf + 8 * v18);
      if (v31)
      {
        *v24 = *v31;
      }
      else
      {
        *v24 = v111;
        *(_QWORD *)&v111 = v24;
        *(_QWORD *)(v30 + 8 * v18) = &v111;
        if (!*v24)
        {
LABEL_42:
          ++*((_QWORD *)&v111 + 1);
          goto LABEL_43;
        }
        v32 = *(_QWORD *)(*v24 + 8);
        if ((v19 & (v19 - 1)) != 0)
        {
          if (v32 >= v19)
            v32 %= v19;
        }
        else
        {
          v32 &= v19 - 1;
        }
        v31 = (_QWORD *)(*(_QWORD *)buf + 8 * v32);
      }
      *v31 = v24;
      goto LABEL_42;
    }
LABEL_44:
    if (__p[1])
    {
      v33 = __p[0];
      if (__p[0])
      {
        do
        {
          v34 = (_QWORD *)*v33;
          operator delete(v33);
          v33 = v34;
        }
        while (v34);
      }
      __p[0] = 0;
      v35 = (char *)v107[1];
      if (v107[1])
      {
        v36 = 0;
        do
          *((_QWORD *)v107[0] + (_QWORD)v36++) = 0;
        while (v35 != v36);
      }
      __p[1] = 0;
    }
    v37 = *(void **)buf;
    *(_QWORD *)buf = 0;
    v38 = v107[0];
    v107[0] = v37;
    if (v38)
      operator delete(v38);
    v39 = *(_QWORD *)&buf[8];
    *(_QWORD *)&buf[8] = 0;
    *(_OWORD *)__p = v111;
    v109 = (int)v112;
    v107[1] = (void *)v39;
    if (*((_QWORD *)&v111 + 1))
    {
      v40 = *(_QWORD *)(v111 + 8);
      if ((v39 & (v39 - 1)) != 0)
      {
        if (v40 >= v39)
          v40 %= v39;
      }
      else
      {
        v40 &= v39 - 1;
      }
      *((_QWORD *)v107[0] + v40) = __p;
      v111 = 0uLL;
    }
    std::__hash_table<MIL::Builder::Variable const*,std::hash<MIL::Builder::Variable const*>,std::equal_to<MIL::Builder::Variable const*>,std::allocator<MIL::Builder::Variable const*>>::~__hash_table((uint64_t)buf);
    if (!__p[1])
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "componentsJoinedByString:", CFSTR(", "));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v94;
        _os_log_error_impl(&dword_19C486000, v83, OS_LOG_TYPE_ERROR, "The 'BlobMapping' parameter is not empty. However, the model types %@ in the pipeline don't support 'BlobFileValue' syntax in the specification.", buf, 0xCu);

      }
      if (a9)
      {
        v86 = (void *)MEMORY[0x1E0CB35C8];
        v113 = *MEMORY[0x1E0CB2D50];
        v87 = (void *)MEMORY[0x1E0CB3940];
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "componentsJoinedByString:", CFSTR(", "));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "stringWithFormat:", CFSTR("The 'BlobMapping' parameter is not empty. However, the model types %@ in the pipeline don't support 'BlobFileValue' syntax in the specification."), v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v114[0] = v90;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v91);
        *a9 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_134;
    }
  }
  v41 = *((int *)a3 + 6);
  operator<<((uint64_t)a5, v41);
  if ((_DWORD)v41)
  {
    v42 = 0;
    while (1)
    {
      std::to_string(&v106, v42);
      v43 = std::string::insert(&v106, 0, "model");
      v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
      v104 = (std::__shared_weak_count *)v43->__r_.__value_.__r.__words[2];
      *(_OWORD *)v103 = v44;
      v43->__r_.__value_.__l.__size_ = 0;
      v43->__r_.__value_.__r.__words[2] = 0;
      v43->__r_.__value_.__r.__words[0] = 0;
      v45 = OArchive::nestedArchive((char *)a5, (uint64_t)v103);
      buf[0] = *v45;
      v46 = *((_QWORD *)v45 + 2);
      *(_QWORD *)&buf[8] = *((_QWORD *)v45 + 1);
      *(_QWORD *)&v111 = v46;
      if (v46)
      {
        v47 = (unint64_t *)(v46 + 8);
        do
          v48 = __ldxr(v47);
        while (__stxr(v48 + 1, v47));
      }
      std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)&v111 + 8, (_QWORD *)v45 + 3);
      if (SHIBYTE(v104) < 0)
        operator delete(v103[0]);
      if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v106.__r_.__value_.__l.__data_);
      _MLModelOutputArchiver::_MLModelOutputArchiver((uint64_t)v103, (uint64_t)buf);
      std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>((CoreML::Specification::Model **)&v101, *(const CoreML::Specification::Model **)(*((_QWORD *)a3 + 4) + 8 * (int)v42 + 8));
      if (v14)
      {
        v49 = (CoreML::Specification::Model *)v101;
        v50 = v101[2];
        if (!v50)
        {
          v50 = (CoreML::Specification::ModelDescription *)operator new();
          CoreML::Specification::ModelDescription::ModelDescription(v50);
          *((_QWORD *)v49 + 2) = v50;
        }
        v51 = (CoreML::Specification::Metadata *)*((_QWORD *)v50 + 20);
        if (!v51)
        {
          v51 = (CoreML::Specification::Metadata *)operator new();
          CoreML::Specification::Metadata::Metadata(v51);
          *((_QWORD *)v50 + 20) = v51;
        }
        v52 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
        std::string::basic_string[abi:ne180100]<0>(&v106, "mldb_token");
        v53 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)v51 + 24, (uint64_t)&v106);
        MEMORY[0x1A1AD5EAC](v53, v52);
        if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v106.__r_.__value_.__l.__data_);
      }
      if (v98 && v107[1])
      {
        v54 = (uint8x8_t)vcnt_s8((int8x8_t)v107[1]);
        v54.i16[0] = vaddlv_u8(v54);
        if (v54.u32[0] > 1uLL)
        {
          v55 = (int)v42;
          if (v107[1] <= (void *)(int)v42)
            v55 = (int)v42 % (unint64_t)v107[1];
        }
        else
        {
          v55 = ((unint64_t)v107[1] - 1) & (int)v42;
        }
        v56 = (uint64_t **)*((_QWORD *)v107[0] + v55);
        if (v56)
        {
          for (j = *v56; j; j = (uint64_t *)*j)
          {
            v58 = j[1];
            if (v58 == (int)v42)
            {
              if (*((_DWORD *)j + 4) == (_DWORD)v42)
              {
                v100 = 0;
                v70 = (id *)&v100;
                v71 = +[MLCompiler compileSpecification:blobMapping:toArchive:options:error:](MLCompiler, "compileSpecification:blobMapping:toArchive:options:error:", &v101, v98, v103, v97, &v100);
                goto LABEL_94;
              }
            }
            else
            {
              if (v54.u32[0] > 1uLL)
              {
                if ((void *)v58 >= v107[1])
                  v58 %= (unint64_t)v107[1];
              }
              else
              {
                v58 &= (unint64_t)v107[1] - 1;
              }
              if (v58 != v55)
                break;
            }
          }
        }
      }
      v99 = 0;
      v70 = (id *)&v99;
      v59 = +[MLCompiler compileSpecification:toArchive:options:error:](MLCompiler, "compileSpecification:toArchive:options:error:", &v101, v103, v97, &v99);
LABEL_94:
      v60 = *v70;
      if (v60)
        break;
      v61 = v102;
      if (v102)
      {
        p_shared_owners = (unint64_t *)&v102->__shared_owners_;
        do
          v63 = __ldaxr(p_shared_owners);
        while (__stlxr(v63 - 1, p_shared_owners));
        if (!v63)
        {
          ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
          std::__shared_weak_count::__release_weak(v61);
        }
      }
      std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v105);
      v64 = v104;
      if (v104)
      {
        v65 = (unint64_t *)&v104->__shared_owners_;
        do
          v66 = __ldaxr(v65);
        while (__stlxr(v66 - 1, v65));
        if (!v66)
        {
          ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
          std::__shared_weak_count::__release_weak(v64);
        }
      }
      std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v112);
      v67 = (std::__shared_weak_count *)v111;
      if ((_QWORD)v111)
      {
        v68 = (unint64_t *)(v111 + 8);
        do
          v69 = __ldaxr(v68);
        while (__stlxr(v69 - 1, v68));
        if (!v69)
        {
          ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
          std::__shared_weak_count::__release_weak(v67);
        }
      }
      if (++v42 == v41)
        goto LABEL_111;
    }
    v73 = v60;
    if (a9)
      *a9 = objc_retainAutorelease(v60);
    v74 = v102;
    if (v102)
    {
      v75 = (unint64_t *)&v102->__shared_owners_;
      do
        v76 = __ldaxr(v75);
      while (__stlxr(v76 - 1, v75));
      if (!v76)
      {
        ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
        std::__shared_weak_count::__release_weak(v74);
      }
    }

    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v105);
    v77 = v104;
    if (v104)
    {
      v78 = (unint64_t *)&v104->__shared_owners_;
      do
        v79 = __ldaxr(v78);
      while (__stlxr(v79 - 1, v78));
      if (!v79)
      {
        ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
        std::__shared_weak_count::__release_weak(v77);
      }
    }
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v112);
    v80 = (std::__shared_weak_count *)v111;
    if ((_QWORD)v111)
    {
      v81 = (unint64_t *)(v111 + 8);
      do
        v82 = __ldaxr(v81);
      while (__stlxr(v82 - 1, v81));
      if (!v82)
      {
        ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
        std::__shared_weak_count::__release_weak(v80);
      }
    }
    goto LABEL_134;
  }
LABEL_111:
  +[MLPipeline archivePipelineUpdateParameterForModels:to:updatable:](MLPipeline, "archivePipelineUpdateParameterForModels:to:updatable:", (char *)a3 + 16, a5, v96);
  +[MLPipeline archiveCustomModelNames:to:](MLPipeline, "archiveCustomModelNames:to:", (char *)a3 + 40, a5);
  if (!objc_msgSend(a1, "archivePipelineModelDetailsFrom:toArchive:error:", a3, a5, a9))
  {
LABEL_134:
    v72 = 0;
    goto LABEL_135;
  }
  +[MLCompilerResult resultWithArchive:](MLCompilerResult, "resultWithArchive:", a5);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_135:
  std::__hash_table<MIL::Builder::Variable const*,std::hash<MIL::Builder::Variable const*>,std::equal_to<MIL::Builder::Variable const*>,std::allocator<MIL::Builder::Variable const*>>::~__hash_table((uint64_t)v107);

  return v72;
}

+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  int v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t *v27;
  uint64_t *v28;
  void *v29;
  void *__p[2];
  char v32;
  _QWORD v33[2];
  int v34;
  std::string v35;

  v11 = a4;
  v12 = a6;
  v13 = *(unsigned __int8 *)(*(_QWORD *)a3 + 28);
  v14 = *(uint64_t **)(*(_QWORD *)a3 + 16);
  if (!v14)
    v14 = &CoreML::Specification::_ModelDescription_default_instance_;
  v15 = (_QWORD *)v14[20];
  std::string::basic_string[abi:ne180100]<0>(__p, "mldb_token");
  if (v15)
    v16 = v15;
  else
    v16 = &CoreML::Specification::_Metadata_default_instance_;
  google::protobuf::Map<std::string,std::string>::InnerMap::FindHelper(v33, v16[5], (unsigned __int8 *)__p, 0);
  v17 = (void *)v33[0];
  if (v32 < 0)
  {
    operator delete(__p[0]);
    if (!v17)
      goto LABEL_18;
  }
  else if (!v33[0])
  {
    goto LABEL_18;
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  std::string::basic_string[abi:ne180100]<0>(__p, "mldb_token");
  google::protobuf::Map<std::string,std::string>::InnerMap::FindHelper(v33, v16[5], (unsigned __int8 *)__p, 0);
  v19 = v33[0];
  if (!v33[0])
  {
    LODWORD(v33[0]) = 3;
    v33[1] = "/Library/Caches/com.apple.xbs/Sources/CoreML/coremltools-internal/deps/protobuf/src/google/protobuf/map.h";
    v34 = 1048;
    memset(&v35, 0, sizeof(v35));
    std::string::append(&v35, "CHECK failed: it != end(): ");
    google::protobuf::internal::LogMessage::Finish((google::protobuf::internal::LogMessage *)v33);
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v35.__r_.__value_.__l.__data_);
  }
  v20 = *(_QWORD *)(v19 + 24);
  v23 = *(_QWORD *)(v20 + 24);
  v21 = v20 + 24;
  v22 = v23;
  if (*(char *)(v21 + 23) >= 0)
    v24 = v21;
  else
    v24 = v22;
  objc_msgSend(v18, "stringWithUTF8String:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32 < 0)
    operator delete(__p[0]);
LABEL_18:
  v25 = *(_QWORD *)a3;
  v26 = *(_DWORD *)(*(_QWORD *)a3 + 44);
  if (v26 == 202)
  {
    v28 = *(uint64_t **)(v25 + 32);
  }
  else
  {
    if (v26 != 201 && v26 != 200)
    {
      v29 = 0;
      goto LABEL_27;
    }
    v27 = *(uint64_t **)(*(_QWORD *)(v25 + 32) + 16);
    if (v27)
      v28 = v27;
    else
      v28 = &CoreML::Specification::_Pipeline_default_instance_;
  }
  +[MLPipeline compileWithModelsInPipeline:blobMapping:toArchive:options:updatable:osSizeTracking:error:](MLPipeline, "compileWithModelsInPipeline:blobMapping:toArchive:options:updatable:osSizeTracking:error:", v28, v11, a5, v12, v13 != 0, v17, a7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v29;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  objc_msgSend(a1, "_compileSpecification:blobMapping:toArchive:options:error:", a3, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  objc_msgSend(a1, "_compileSpecification:blobMapping:toArchive:options:error:", a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  void *v25;
  __CFString *v27;
  void *v28;
  id v29;
  CoreML::Specification::Model *v30;
  std::__shared_weak_count *v31;

  v7 = a4;
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 1, CFSTR("generic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "variantString");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = (__CFString *)v9;
  else
    v10 = &stru_1E3D68DC8;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)a3;
  v13 = *(_DWORD *)(*(_QWORD *)a3 + 44);
  if (v13 == 200)
  {
    v28 = v8;
    v15 = *(_QWORD *)(v12 + 32);
    v14 = *(_QWORD *)(v15 + 16);
    if (v14)
      goto LABEL_12;
LABEL_11:
    v14 = operator new();
    CoreML::Specification::Pipeline::Pipeline((CoreML::Specification::Pipeline *)v14);
    *(_QWORD *)(v15 + 16) = v14;
    goto LABEL_12;
  }
  if (v13 == 201)
  {
    v28 = v8;
    v15 = *(_QWORD *)(v12 + 32);
    v14 = *(_QWORD *)(v15 + 16);
    if (v14)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (v13 != 202)
  {
    v25 = 0;
    goto LABEL_29;
  }
  v28 = v8;
  v14 = *(_QWORD *)(v12 + 32);
LABEL_12:
  v27 = v10;
  v16 = *(unsigned int *)(v14 + 24);
  if ((int)v16 < 1)
  {
LABEL_25:
    v8 = v28;
    +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", objc_msgSend(v28, "majorVersion"), objc_msgSend(v28, "minorVersion"), objc_msgSend(v28, "patchVersion"), v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
    while (1)
    {
      std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v30, *(const CoreML::Specification::Model **)(*(_QWORD *)(v14 + 32) + 8 * v17 + 8));
      v29 = 0;
      +[MLCompiler compiledVersionForSpecification:options:error:](MLCompiler, "compiledVersionForSpecification:options:error:", &v30, v7, &v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v29;
      v20 = v19;
      if (v19)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v19);
      }
      else
      {
        objc_msgSend(v18, "versionString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendFormat:", CFSTR(".model%lluv%@"), v17, v21);

      }
      v22 = v31;
      if (v31)
      {
        p_shared_owners = (unint64_t *)&v31->__shared_owners_;
        do
          v24 = __ldaxr(p_shared_owners);
        while (__stlxr(v24 - 1, p_shared_owners));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }

      if (v20)
        break;
      if (++v17 == v16)
        goto LABEL_25;
    }
    v25 = 0;
    v8 = v28;
  }
  v10 = v27;
LABEL_29:

  return v25;
}

+ (id)loadModelAssetDescriptionFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v8;
  NSObject *v9;
  uint8_t buf[8];
  uint64_t v12;

  v8 = -[MLModelDescription initFromRawCompiledModelArchive:error:]([MLModelDescription alloc], "initFromRawCompiledModelArchive:error:", a3, a7);
  if (v8)
  {
    v12 = 0;
    operator>>((uint64_t)a3);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Pipeline model must have at least 1 submodel.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Pipeline model must have at least 1 submodel."));
  }

  return 0;
}

+ (id)extractSubModelNamesFromArchive:(void *)a3 numModels:(unint64_t)a4
{
  int hasNestedArchive;
  std::string::size_type *v7;
  std::string::size_type v8;
  unint64_t *v9;
  unint64_t v10;
  _BOOL4 v11;
  std::__shared_weak_count *size;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  std::string *v21;
  __int128 v22;
  __int128 *v23;
  __int128 v24;
  std::string *p_p;
  void *v26;
  uint64_t v28;
  std::string v29;
  char *v30;
  std::string __p;
  char *v32;
  _QWORD v33[3];

  std::string::basic_string[abi:ne180100]<0>(&__p, "modelNames");
  hasNestedArchive = IArchive::hasNestedArchive(a3, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  memset(v33, 0, sizeof(v33));
  if (hasNestedArchive)
  {
    std::string::basic_string[abi:ne180100]<0>(&v29, "modelNames");
    v7 = (std::string::size_type *)IArchive::nestedArchive(a3, (uint64_t)&v29);
    v8 = v7[1];
    __p.__r_.__value_.__r.__words[0] = *v7;
    __p.__r_.__value_.__l.__size_ = v8;
    if (v8)
    {
      v9 = (unint64_t *)(v8 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)&__p.__r_.__value_.__r.__words[2], v7 + 2);
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v29.__r_.__value_.__l.__data_);
    _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)&v29, (const IArchive *)&__p);
    v28 = 0;
    operator>>((uint64_t)&v29);
    v11 = a4 != 0;
    std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v30);
    size = (std::__shared_weak_count *)v29.__r_.__value_.__l.__size_;
    if (v29.__r_.__value_.__l.__size_)
    {
      v13 = (unint64_t *)(v29.__r_.__value_.__l.__size_ + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
    std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v32);
    v15 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
      v16 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    v11 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v19 = 0;
    v20 = 0;
    do
    {
      if (v11)
      {
        std::to_string(&v29, v20);
        v21 = std::string::insert(&v29, 0, "model");
        v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v22;
        v21->__r_.__value_.__l.__size_ = 0;
        v21->__r_.__value_.__r.__words[2] = 0;
        v21->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v29.__r_.__value_.__l.__data_);
      }
      else
      {
        v23 = (__int128 *)(v33[0] + v19);
        if (*(char *)(v33[0] + v19 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v23, *((_QWORD *)v23 + 1));
        }
        else
        {
          v24 = *v23;
          __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v23 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v24;
        }
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v26);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      ++v20;
      v19 += 24;
    }
    while (a4 != v20);
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return v18;
}

+ (BOOL)parseModelArchive:(void *)a3 subModelNames:(id *)a4 subModelArchiveNames:(id *)a5 error:(id *)a6
{
  NSObject *v7;
  void *v8;
  void *v9;
  id v11;
  void *__p;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  operator>>((uint64_t)a3);
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LOWORD(__p) = 0;
    _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "Failed to parse Pipeline model. Found 0 sub-models, model is expected to have at least 1 submodel.", (uint8_t *)&__p, 2u);
  }

  if (a6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to parse Pipeline model. Found 0 sub-models, model is expected to have at least 1 submodel."));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v9);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (id)classLabelsForPipelineFromSubModelDescriptionArray:(id)a3 predictedFeatureName:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v11, "outputDescriptionsByName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v6);

          if (v14)
          {
            objc_msgSend(v11, "classLabels");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v8)
          continue;
        break;
      }
    }

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = 0;
    v18 = *(_QWORD *)v27;
    while (2)
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v20, "classLabels");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21 == 0;

        if (!v22)
        {
          if (v17)
          {

            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19C486000, v23, OS_LOG_TYPE_INFO, "This pipeline contains multiple sub-models with class labels. As a result, the classLabel property of the pipeline instance will not be populated.", buf, 2u);
            }

            goto LABEL_26;
          }
          objc_msgSend(v20, "classLabels");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v16)
        continue;
      break;
    }
  }
  else
  {
LABEL_26:
    v17 = 0;
  }
LABEL_27:

  return v17;
}

+ (id)classLabelsForPipelineFromSubModelArray:(id)a3 predictedFeatureName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "modelDescription", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(a1, "classLabelsForPipelineFromSubModelDescriptionArray:predictedFeatureName:", v8, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
