@implementation MLNeuralNetworkContainer

- (NSArray)inputLayerNames
{
  return self->_inputLayerNames;
}

- (void)setHasDynamicLayer:(BOOL)a3
{
  self->_hasDynamicLayer = a3;
}

+ (id)containerFromCompiledArchiveCommon:(void *)a3 filename:(id)a4 modelVersionInfo:(id)a5 compilerVersionInfo:(id)a6 configuration:(id)a7 error:(id *)a8
{
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  MLModelAssetDescription *v19;
  MLModelAssetDescription *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  MLNeuralNetworkFunctionInfo *v25;
  void *v26;
  MLModelAssetDescription *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  uint8_t buf[8];
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v35 = a5;
  v13 = a6;
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 9, 0, 0, CFSTR("generic"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "majorVersion");
  if (v15 >= objc_msgSend(v13, "majorVersion"))
  {
    if (!v13)
    {
      +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 2, 1, CFSTR("generic"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = -[MLModelAssetDescription initWithCompiledModelArchive:error:]([MLModelAssetDescription alloc], "initWithCompiledModelArchive:error:", a3, a8);
    v20 = v19;
    if (v19)
    {
      if (!-[MLModelAssetDescription usesMultiFunctionSyntax](v19, "usesMultiFunctionSyntax"))
      {
        v25 = -[MLNeuralNetworkFunctionInfo initWithCompiledModelArchive:compilerVersionInfo:error:]([MLNeuralNetworkFunctionInfo alloc], "initWithCompiledModelArchive:compilerVersionInfo:error:", a3, v13, a8);
        -[MLNeuralNetworkFunctionInfo classLabels](v25, "classLabels");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLModelAssetDescription assetDescriptionBySettingClassLabels:](v20, "assetDescriptionBySettingClassLabels:", v26);
        v27 = (MLModelAssetDescription *)objc_claimAutoreleasedReturnValue();

        v28 = objc_alloc((Class)a1);
        -[MLModelAssetDescription defaultModelDescription](v27, "defaultModelDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkFunctionInfo outputNames](v25, "outputNames");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkFunctionInfo classScoreVectorName](v25, "classScoreVectorName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLNeuralNetworkFunctionInfo classLabels](v25, "classLabels");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v28, "initWithFeatureDescriptions:modelDescription:outputLayerNames:classScoreVectorName:classLabels:isEncrypted:modelVersionInfo:compilerVersionInfo:", v34, v29, v30, v31, v32, (*(uint64_t (**)(_QWORD))(**(_QWORD **)a3 + 64))(*(_QWORD *)a3), v35, v13);

        v20 = v27;
        goto LABEL_15;
      }
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19C486000, v21, OS_LOG_TYPE_ERROR, "This MLModel doesn't support the multi-function description sytnax.", buf, 2u);
      }

      if (a8)
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This MLModel doesn't support the multi-function description sytnax."));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v24);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v18 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (a8)
  {
    objc_msgSend(v13, "versionNumberString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "versionNumberString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("compiler major version for compiled model is %@ and is more recent than this framework major version %@."), v16, v17);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18 = 0;
LABEL_16:

  return v18;
}

- (void)setOptionalInputTypes:(id)a3
{
  objc_storeStrong((id *)&self->_optionalInputTypes, a3);
}

- (void)setOptionalInputDefaultValues:(id)a3
{
  objc_storeStrong((id *)&self->_optionalInputDefaultValues, a3);
}

- (void)setNdArrayInterpretation:(BOOL)a3
{
  self->_ndArrayInterpretation = a3;
}

- (void)setHasOptionalInputSequenceConcat:(BOOL)a3
{
  self->_hasOptionalInputSequenceConcat = a3;
}

- (void)setCompilerOutput:(id)a3
{
  objc_storeStrong((id *)&self->_compilerOutput, a3);
}

- (void)setUpdatableModelCompiledParams:(id)a3
{
  objc_storeStrong((id *)&self->_updatableModelCompiledParams, a3);
}

- (void)setHasBidirectionalLayer:(BOOL)a3
{
  self->_hasBidirectionalLayer = a3;
}

- (void)setConfigurationList:(id)a3
{
  objc_storeStrong((id *)&self->_configurationList, a3);
}

- (NSDictionary)optionalInputDefaultValues
{
  return self->_optionalInputDefaultValues;
}

- (NSDictionary)optionalInputTypes
{
  return self->_optionalInputTypes;
}

- (BOOL)ndArrayInterpretation
{
  return self->_ndArrayInterpretation;
}

- (MLVersionInfo)modelVersionInfo
{
  return self->_modelVersionInfo;
}

- (BOOL)modelIsMIL
{
  return self->_modelIsMIL;
}

- (NSString)modelFilePath
{
  return self->_modelFilePath;
}

- (MLCompilerNeuralNetworkOutput)compilerOutput
{
  return self->_compilerOutput;
}

- (NSString)classScoreVectorName
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSArray)outputLayerNames
{
  return self->_outputLayerNames;
}

- (BOOL)modelIsEncrypted
{
  return self->_modelIsEncrypted;
}

- (NSDictionary)imagePreprocessingParams
{
  return self->_imagePreprocessingParams;
}

- (NSDictionary)imageParameters
{
  return self->_imageParameters;
}

- (BOOL)hasOptionalInputSequenceConcat
{
  return self->_hasOptionalInputSequenceConcat;
}

- (BOOL)hasBidirectionalLayer
{
  return self->_hasBidirectionalLayer;
}

- (MLVersionInfo)compilerVersionInfo
{
  return self->_compilerVersionInfo;
}

- (NSArray)classLabels
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (NSString)activeFunction
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = (char *)self + 64;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = (char *)self + 88;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = (char *)self + 136;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compilerOutput, 0);
  objc_storeStrong((id *)&self->_compilerVersionInfo, 0);
  objc_storeStrong((id *)&self->_optionalInputTypes, 0);
  objc_storeStrong((id *)&self->_modelVersionInfo, 0);
  objc_storeStrong((id *)&self->_optionalInputDefaultValues, 0);
  objc_storeStrong((id *)&self->_updatableModelCompiledParams, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_classScoreVectorName, 0);
  objc_storeStrong((id *)&self->_classLabels, 0);
  objc_storeStrong((id *)&self->_configurationList, 0);
  objc_storeStrong((id *)&self->_imagePreprocessingParams, 0);
  objc_storeStrong((id *)&self->_imageParameters, 0);
  objc_storeStrong((id *)&self->_outputDescription, 0);
  objc_storeStrong((id *)&self->_inputDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_outputLayerNames, 0);
  objc_storeStrong((id *)&self->_inputLayerNames, 0);
  objc_storeStrong((id *)&self->_modelFilePath, 0);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->ranks.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->sequences.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->batches.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->ks.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->heights.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->widths.__tree_.__pair1_.__value_.__left_);
}

- (void)setOutputLayerNames:(id)a3
{
  objc_storeStrong((id *)&self->_outputLayerNames, a3);
}

- (void)setModelIsMIL:(BOOL)a3
{
  self->_modelIsMIL = a3;
}

- (BOOL)modelIsTrainingProgram
{
  return self->_modelIsTrainingProgram;
}

- (MLNeuralNetworkContainer)initWithFilePath:(id)a3 inputLayerNames:(id)a4 outputLayerNames:(id)a5 parameters:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MLNeuralNetworkContainer *v15;
  MLNeuralNetworkContainer *v16;
  NSDictionary *v17;
  NSDictionary *optionalInputTypes;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MLNeuralNetworkContainer;
  v15 = -[MLNeuralNetworkContainer init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modelFilePath, a3);
    objc_storeStrong((id *)&v16->_inputLayerNames, a4);
    objc_storeStrong((id *)&v16->_outputLayerNames, a5);
    *(_QWORD *)&v16->_precision = 65568;
    objc_storeStrong((id *)&v16->_imageParameters, a6);
    v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    optionalInputTypes = v16->_optionalInputTypes;
    v16->_optionalInputTypes = v17;

  }
  return v16;
}

- (MLNeuralNetworkContainer)initWithFeatureDescriptions:(id)a3 modelDescription:(id)a4 outputLayerNames:(id)a5 classScoreVectorName:(id)a6 classLabels:(id)a7 isEncrypted:(BOOL)a8 modelVersionInfo:(id)a9
{
  return -[MLNeuralNetworkContainer initWithFeatureDescriptions:modelDescription:outputLayerNames:classScoreVectorName:classLabels:isEncrypted:modelVersionInfo:compilerVersionInfo:](self, "initWithFeatureDescriptions:modelDescription:outputLayerNames:classScoreVectorName:classLabels:isEncrypted:modelVersionInfo:compilerVersionInfo:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (MLNeuralNetworkContainer)initWithFeatureDescriptions:(id)a3 modelDescription:(id)a4 outputLayerNames:(id)a5 classScoreVectorName:(id)a6 classLabels:(id)a7 isEncrypted:(BOOL)a8 modelVersionInfo:(id)a9 compilerVersionInfo:(id)a10
{
  id v16;
  MLNeuralNetworkContainer *v17;
  MLNeuralNetworkContainer *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *inputLayerNames;
  NSDictionary *v25;
  NSDictionary *optionalInputTypes;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v16 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v31 = a9;
  v30 = a10;
  v36.receiver = self;
  v36.super_class = (Class)MLNeuralNetworkContainer;
  v17 = -[MLNeuralNetworkContainer init](&v36, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modelFilePath, a3);
    v18->_modelIsMIL = 0;
    objc_storeStrong((id *)&v18->_modelDescription, a4);
    objc_msgSend(v16, "inputDescriptionsByName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v16;
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stateDescriptionsByName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    inputLayerNames = v18->_inputLayerNames;
    v18->_inputLayerNames = (NSArray *)v23;

    objc_storeStrong((id *)&v18->_outputLayerNames, a5);
    *(_QWORD *)&v18->_precision = 65568;
    *(_WORD *)&v18->_hasBidirectionalLayer = 0;
    objc_storeStrong((id *)&v18->_classLabels, a7);
    objc_storeStrong((id *)&v18->_classScoreVectorName, a6);
    v18->_hasDynamicLayer = 0;
    v18->_modelIsEncrypted = a8;
    objc_storeStrong((id *)&v18->_compilerVersionInfo, a10);
    objc_storeStrong((id *)&v18->_modelVersionInfo, a9);
    v16 = v28;
    v25 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    optionalInputTypes = v18->_optionalInputTypes;
    v18->_optionalInputTypes = v25;

  }
  return v18;
}

- (void)setModelFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_modelFilePath, a3);
}

- (void)setInputLayerNames:(id)a3
{
  objc_storeStrong((id *)&self->_inputLayerNames, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)inputDescription
{
  return self->_inputDescription;
}

- (void)setInputDescription:(id)a3
{
  objc_storeStrong((id *)&self->_inputDescription, a3);
}

- (NSDictionary)outputDescription
{
  return self->_outputDescription;
}

- (void)setOutputDescription:(id)a3
{
  objc_storeStrong((id *)&self->_outputDescription, a3);
}

- (void)setImageParameters:(id)a3
{
  objc_storeStrong((id *)&self->_imageParameters, a3);
}

- (void)setImagePreprocessingParams:(id)a3
{
  objc_storeStrong((id *)&self->_imagePreprocessingParams, a3);
}

- (NSArray)configurationList
{
  return self->_configurationList;
}

- (BOOL)hasDynamicLayer
{
  return self->_hasDynamicLayer;
}

- (void)setClassLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void)setClassScoreVectorName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (MLNeuralNetworksCompileTimeParams)updatableModelCompiledParams
{
  return self->_updatableModelCompiledParams;
}

- (void)setModelIsEncrypted:(BOOL)a3
{
  self->_modelIsEncrypted = a3;
}

- (void)setModelVersionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersionInfo, a3);
}

- (void)setModelIsTrainingProgram:(BOOL)a3
{
  self->_modelIsTrainingProgram = a3;
}

- (int)precision
{
  return self->_precision;
}

- (void)setPrecision:(int)a3
{
  self->_precision = a3;
}

- (int)engine
{
  return self->_engine;
}

- (void)setEngine:(int)a3
{
  self->_engine = a3;
}

- (void)setCompilerVersionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_compilerVersionInfo, a3);
}

+ (id)containerFromFilePath:(id)a3 inputLayerNames:(id)a4 outputLayerNames:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilePath:inputLayerNames:outputLayerNames:parameters:", v10, v11, v12, v13);

  return v14;
}

+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  +[MLNeuralNetworkV1Container containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:](MLNeuralNetworkV1Container, "containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
