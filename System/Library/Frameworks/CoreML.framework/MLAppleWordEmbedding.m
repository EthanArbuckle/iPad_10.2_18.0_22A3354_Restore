@implementation MLAppleWordEmbedding

- (MLAppleWordEmbedding)initWithParameters:(id)a3 modelDescription:(id)a4 nlpHandle:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char isKindOfClass;
  MLAppleWordEmbedding *v19;
  void *v20;
  MLAppleWordEmbedding *v21;
  void *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if ((objc_msgSend(v15, "isValid") & 1) == 0)
  {
    if (!a7)
      goto LABEL_15;
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("NaturalLanguage framework not available on this OS version"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v21 = 0;
    *a7 = v22;
    goto LABEL_16;
  }
  if (!v13)
  {
    if (!a7)
      goto LABEL_15;
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid parameters for Word Embedding"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v13, "modelParameterData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (a7)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("parameters.modelParameterData does not exist or is not a NSData"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_15:
    v21 = 0;
    goto LABEL_16;
  }
  v24.receiver = self;
  v24.super_class = (Class)MLAppleWordEmbedding;
  v19 = -[MLModel initWithDescription:configuration:](&v24, sel_initWithDescription_configuration_, v14, v16);
  if (!v19)
  {
LABEL_7:
    self = v19;
    v21 = self;
    goto LABEL_16;
  }
  objc_msgSend(v13, "modelParameterData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19->wordEmbeddingModel = (void *)objc_msgSend(v15, "initializeEmbeddingModelWithData:error:", v20, a7);

  if (v19->wordEmbeddingModel)
  {
    objc_storeStrong((id *)&v19->_parameters, a3);
    goto LABEL_7;
  }
  if (a7)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("initialization of word embedding model with model data failed"));
    v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  self = v19;
LABEL_16:

  return v21;
}

- (void)dealloc
{
  void *wordEmbeddingModel;
  objc_super v4;

  wordEmbeddingModel = self->wordEmbeddingModel;
  if (wordEmbeddingModel)
    CFRelease(wordEmbeddingModel);
  v4.receiver = self;
  v4.super_class = (Class)MLAppleWordEmbedding;
  -[MLAppleWordEmbedding dealloc](&v4, sel_dealloc);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  MLPredictionEvent *v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MLDictionaryFeatureProvider *v17;
  void *v18;
  void *v19;
  void *v20;
  MLDictionaryFeatureProvider *v21;
  id v22;
  void *v23;
  void *v25;
  id v26;
  _QWORD aBlock[6];
  id v28[7];
  void *v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v8 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v9 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v28, v9, 10, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v8, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v10 = -[MLModel signpostID](self, "signpostID");
  v11 = objc_msgSend(v8, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MLAppleWordEmbedding_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  +[_MLNLPFrameworkHandle sharedHandle](_MLNLPFrameworkHandle, "sharedHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isValid") & 1) != 0)
  {
    -[MLAppleWordEmbeddingParameters inputFeatureName](self->_parameters, "inputFeatureName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "featureValueForName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v13, "predictVectorForString:inputString:error:", self->wordEmbeddingModel, v25, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = [MLDictionaryFeatureProvider alloc];
        -[MLAppleWordEmbeddingParameters outputFeatureName](self->_parameters, "outputFeatureName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v18;
        +[MLMultiArray doubleVectorWithValues:](MLMultiArray, "doubleVectorWithValues:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v17, "initWithDictionary:error:", v20, a5);

LABEL_15:
LABEL_16:

        goto LABEL_17;
      }
      if (!a5)
      {
LABEL_14:
        v16 = 0;
        v21 = 0;
        goto LABEL_15;
      }
      if (*a5)
      {
        objc_msgSend(*a5, "localizedDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Embedding does not contain input string '%@'. %@"), v25, v23);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Embedding does not contain input string '%@'. "), v25);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v16 = 0;
    }
    else
    {
      if (!a5)
      {
        v21 = 0;
        goto LABEL_16;
      }
      -[MLAppleWordEmbeddingParameters inputFeatureName](self->_parameters, "inputFeatureName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Input string feature '%@' not found"), v16);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = 0;
    *a5 = v22;
    goto LABEL_15;
  }
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("NaturalLanguage framework not available on this OS version"));
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_17:

  v12[2](v12);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v28);

  return v21;
}

- (MLAppleWordEmbeddingParameters)parameters
{
  return (MLAppleWordEmbeddingParameters *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

uint64_t __61__MLAppleWordEmbedding_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  CoreML::Specification::CoreMLModels::protobuf_WordEmbedding_2eproto *v10;
  uint64_t *v11;
  MLAppleWordEmbedding *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MLAppleWordEmbeddingParameters *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  std::string *p_p;
  std::string::size_type size;
  void *v29;
  std::string __p;
  void (**v32)(CoreML::Specification::CoreMLModels::WordEmbedding *__hidden);
  uint64_t v33;
  std::string *v34;
  std::string *v35;
  unsigned int v36;
  int v37;

  v7 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2005)
  {
    v8 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
    +[_MLNLPFrameworkHandle sharedHandle](_MLNLPFrameworkHandle, "sharedHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (CoreML::Specification::CoreMLModels::protobuf_WordEmbedding_2eproto *)objc_msgSend(v9, "isValid");
    if ((v10 & 1) != 0)
    {
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2005)
      {
        v11 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        CoreML::Specification::CoreMLModels::protobuf_WordEmbedding_2eproto::InitDefaults(v10);
        v11 = &CoreML::Specification::CoreMLModels::_WordEmbedding_default_instance_;
      }
      v32 = &off_1E3D4D528;
      v33 = 0;
      v37 = 0;
      v13 = v11[1];
      if ((v13 & 1) != 0)
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v33, v13 & 0xFFFFFFFFFFFFFFFELL);
      v34 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
      v14 = v11[2];
      if (*(char *)(v14 + 23) < 0)
        v15 = *(_QWORD *)(v14 + 8);
      else
        v15 = *(unsigned __int8 *)(v14 + 23);
      if ((__int128 *)v14 != &google::protobuf::internal::fixed_address_empty_string && v15)
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v34, v14);
      v35 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
      v16 = v11[3];
      if (*(char *)(v16 + 23) < 0)
        v17 = *(_QWORD *)(v16 + 8);
      else
        v17 = *(unsigned __int8 *)(v16 + 23);
      if ((__int128 *)v16 != &google::protobuf::internal::fixed_address_empty_string && v17)
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v35, v16);
      v36 = *((_DWORD *)v11 + 8);
      v18 = objc_alloc_init(MLAppleWordEmbeddingParameters);
      -[MLAppleWordEmbeddingParameters setRevision:](v18, "setRevision:", v36);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLAppleWordEmbeddingParameters setLanguage:](v18, "setLanguage:", v19);

      objc_msgSend(v8, "inputDescriptionsByName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLAppleWordEmbeddingParameters setInputFeatureName:](v18, "setInputFeatureName:", v22);

      objc_msgSend(v8, "outputDescriptionsByName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLAppleWordEmbeddingParameters setOutputFeatureName:](v18, "setOutputFeatureName:", v25);

      if (SHIBYTE(v35->__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, v35->__r_.__value_.__l.__data_, v35->__r_.__value_.__l.__size_);
      }
      else
      {
        v26 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v35->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v26;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        size = __p.__r_.__value_.__l.__size_;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", p_p, size, __p.__r_.__value_.__r.__words[0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLAppleWordEmbeddingParameters setModelParameterData:](v18, "setModelParameterData:", v29);

      v12 = -[MLAppleWordEmbedding initWithParameters:modelDescription:nlpHandle:configuration:error:]([MLAppleWordEmbedding alloc], "initWithParameters:modelDescription:nlpHandle:configuration:error:", v18, v8, v9, v7, a5);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);

      v32 = &off_1E3D4D528;
      CoreML::Specification::SerializedModel::SharedDtor((uint64_t)&v32);
      google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v33);
    }
    else if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("NaturalLanguage framework not available on this OS version"));
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model type is not a Word Embedding"));
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)saveAppleWordEmbeddingModelToURL:(id)a3 wordEmbeddingParameters:(id)a4 error:(id *)a5
{
  CoreML::Specification::Model *v6;
  CoreML::Specification::ModelDescription *v7;
  CoreML::Specification::Metadata *v8;
  CoreML::Specification::FeatureDescription *v9;
  id v10;
  uint64_t v11;
  CoreML::Specification::StringFeatureType *v12;
  CoreML::Specification::FeatureDescription *v13;
  id v14;
  double v15;
  uint64_t v16;
  CoreML::Specification::ArrayFeatureType *v17;
  CoreML::Specification::Model *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char isKindOfClass;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  google::protobuf::Arena **v69;
  void *v70;
  BOOL v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  CoreML::Specification::Model *v76;
  id v77;
  std::__shared_weak_count *v78;
  unint64_t *p_shared_owners;
  unint64_t v80;
  unsigned __int32 v81;
  unint64_t *v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  id v87;
  __int128 **v89;
  id v90;
  void *v91;
  char v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __n128 __p;
  char v98;
  char v99;
  CoreML::Specification::Model *v100;
  std::__shared_weak_count *v101;
  _QWORD v102[2];
  std::__shared_weak_count *v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v87 = a3;
  v90 = a4;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v100, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  v6 = v100;
  *((_DWORD *)v100 + 6) = 9;
  v7 = (CoreML::Specification::ModelDescription *)*((_QWORD *)v6 + 2);
  if (!v7)
  {
    v7 = (CoreML::Specification::ModelDescription *)operator new();
    CoreML::Specification::ModelDescription::ModelDescription(v7);
    *((_QWORD *)v6 + 2) = v7;
  }
  v8 = (CoreML::Specification::Metadata *)*((_QWORD *)v7 + 20);
  if (!v8)
  {
    v8 = (CoreML::Specification::Metadata *)operator new();
    CoreML::Specification::Metadata::Metadata(v8);
    *((_QWORD *)v7 + 20) = v8;
  }
  v89 = (__int128 **)v8;
  v9 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>((uint64_t)v7 + 16);
  objc_msgSend(v90, "inputFeatureName");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v10, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v9 + 2, &__p);
  if (v98 < 0)
    operator delete((void *)__p.n128_u64[0]);

  std::string::basic_string[abi:ne180100]<0>(&__p, "word");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v9 + 3, &__p);
  if (v98 < 0)
    operator delete((void *)__p.n128_u64[0]);
  v11 = *((_QWORD *)v9 + 4);
  if (!v11)
  {
    v11 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v11);
    *((_QWORD *)v9 + 4) = v11;
  }
  if (*(_DWORD *)(v11 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v11);
    *(_DWORD *)(v11 + 36) = 3;
    v12 = (CoreML::Specification::StringFeatureType *)operator new();
    CoreML::Specification::StringFeatureType::StringFeatureType(v12);
    *(_QWORD *)(v11 + 24) = v12;
  }
  v13 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>((uint64_t)v7 + 40);
  objc_msgSend(v90, "outputFeatureName");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v14, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v13 + 2, &__p);
  if (v98 < 0)
    operator delete((void *)__p.n128_u64[0]);

  std::string::basic_string[abi:ne180100]<0>(&__p, "vector");
  *(_QWORD *)&v15 = google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v13 + 3, &__p).n128_u64[0];
  if (v98 < 0)
    operator delete((void *)__p.n128_u64[0]);
  v16 = *((_QWORD *)v13 + 4);
  if (!v16)
  {
    v16 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v16);
    *((_QWORD *)v13 + 4) = v16;
  }
  if (*(_DWORD *)(v16 + 36) == 5)
  {
    v17 = *(CoreML::Specification::ArrayFeatureType **)(v16 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v16);
    *(_DWORD *)(v16 + 36) = 5;
    v17 = (CoreML::Specification::ArrayFeatureType *)operator new();
    CoreML::Specification::ArrayFeatureType::ArrayFeatureType(v17);
    *(_QWORD *)(v16 + 24) = v17;
  }
  *((_DWORD *)v17 + 9) = 65600;
  v18 = v100;
  if (*((_DWORD *)v100 + 11) == 2005)
  {
    v19 = *((_QWORD *)v100 + 4);
  }
  else
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v100);
    *((_DWORD *)v18 + 11) = 2005;
    v19 = operator new();
    CoreML::Specification::CoreMLModels::WordEmbedding::WordEmbedding((CoreML::Specification::CoreMLModels::WordEmbedding *)v19);
    *((_QWORD *)v18 + 4) = v19;
  }
  *(_DWORD *)(v19 + 32) = objc_msgSend(v90, "revision", v15);
  objc_msgSend(v90, "language");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length") == 0;

  if (!v21)
  {
    objc_msgSend(v90, "language");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v22, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v19 + 16), &__p);
    if (v98 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  objc_msgSend(v90, "modelParameterData");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = (void *)objc_msgSend(v23, "bytes");
  objc_msgSend(v90, "modelParameterData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  std::string::basic_string[abi:ne180100](&__p, v24, objc_msgSend(v25, "length"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v19 + 24), &__p);
  if (v98 < 0)
    operator delete((void *)__p.n128_u64[0]);

  objc_msgSend(v90, "metadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (!v27)
  {
    objc_msgSend(v90, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v90, "metadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_38;
      objc_msgSend(v90, "metadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v33, "UTF8String"));
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 8, &__p);
      if (v98 < 0)
        operator delete((void *)__p.n128_u64[0]);

    }
LABEL_38:
    objc_msgSend(v90, "metadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v90, "metadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v38 = objc_opt_isKindOfClass();

      if ((v38 & 1) == 0)
        goto LABEL_44;
      objc_msgSend(v90, "metadata");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v39, "UTF8String"));
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 9, &__p);
      if (v98 < 0)
        operator delete((void *)__p.n128_u64[0]);

    }
LABEL_44:
    objc_msgSend(v90, "metadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v90, "metadata");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v44 = objc_opt_isKindOfClass();

      if ((v44 & 1) == 0)
        goto LABEL_50;
      objc_msgSend(v90, "metadata");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v45, "UTF8String"));
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 7, &__p);
      if (v98 < 0)
        operator delete((void *)__p.n128_u64[0]);

    }
LABEL_50:
    objc_msgSend(v90, "metadata");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v90, "metadata");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v50 = objc_opt_isKindOfClass();

      if ((v50 & 1) != 0)
      {
        objc_msgSend(v90, "metadata");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = objc_retainAutorelease(v53);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v54, "UTF8String"));
        *(_QWORD *)&v51 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 6, &__p).n128_u64[0];
        if (v98 < 0)
          operator delete((void *)__p.n128_u64[0]);
LABEL_56:
        objc_msgSend(v90, "metadata", v51);
        v55 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56)
        {
          objc_msgSend(v90, "metadata");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v59 = objc_opt_isKindOfClass();

          if ((v59 & 1) == 0)
            goto LABEL_70;
          objc_msgSend(v90, "metadata");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v55 = v61;
          v62 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
          if (v62)
          {
            v63 = *(_QWORD *)v94;
            do
            {
              for (i = 0; i != v62; ++i)
              {
                if (*(_QWORD *)v94 != v63)
                  objc_enumerationMutation(v55);
                v65 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
                objc_msgSend(v55, "objectForKeyedSubscript:", v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "description");
                v67 = (void *)objc_claimAutoreleasedReturnValue();

                if (v67)
                {
                  v68 = objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
                  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v65), "UTF8String"));
                  v69 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)(v89 + 3), (uint64_t)&__p);
                  MEMORY[0x1A1AD5EAC](v69, v68);
                  if (v98 < 0)
                    operator delete((void *)__p.n128_u64[0]);
                }

              }
              v62 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
            }
            while (v62);
          }

        }
LABEL_70:
        if (v54)
          goto LABEL_76;
        goto LABEL_71;
      }
    }
    else
    {

    }
    v54 = 0;
    goto LABEL_56;
  }
LABEL_71:
  objc_msgSend(v90, "language");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70 == 0;

  v72 = (void *)MEMORY[0x1E0CB3940];
  if (v71)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This model is a word embedding (version %lu) which represents a word in a vector space."), objc_msgSend(v90, "revision"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v73 = objc_msgSend(v90, "revision");
    objc_msgSend(v90, "language");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "stringWithFormat:", CFSTR("This model is a word embedding (version %lu) which represents an %@ word in a vector space."), v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v54 = objc_retainAutorelease(v75);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v54, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 6, &__p);
  if (v98 < 0)
    operator delete((void *)__p.n128_u64[0]);
LABEL_76:
  v76 = v100;
  v77 = objc_retainAutorelease(v87);
  std::string::basic_string[abi:ne180100]<0>(&v91, (char *)objc_msgSend(v77, "fileSystemRepresentation"));
  CoreML::Model::Model((CoreML::Model *)v102, v76);
  CoreML::Model::save((uint64_t)&__p, (uint64_t)v102);
  v102[0] = &off_1E3D597D0;
  v78 = v103;
  if (v103)
  {
    p_shared_owners = (unint64_t *)&v103->__shared_owners_;
    do
      v80 = __ldaxr(p_shared_owners);
    while (__stlxr(v80 - 1, p_shared_owners));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  if (v92 < 0)
    operator delete(v91);
  v81 = __p.n128_u32[0] & 0xFFFFFFEF;
  if (a5 && v81)
  {
    v82 = &__p.n128_u64[1];
    if (v99 < 0)
      v82 = (unint64_t *)__p.n128_u64[1];
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Unable to save model to %@. %s"), v77, v82);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v99 < 0)
    operator delete((void *)__p.n128_u64[1]);

  v83 = v101;
  if (v101)
  {
    v84 = (unint64_t *)&v101->__shared_owners_;
    do
      v85 = __ldaxr(v84);
    while (__stlxr(v85 - 1, v84));
    if (!v85)
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
  }

  return v81 == 0;
}

@end
