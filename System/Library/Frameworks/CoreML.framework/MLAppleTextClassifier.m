@implementation MLAppleTextClassifier

- (MLAppleTextClassifier)initWithParameters:(id)a3 modelDescription:(id)a4 nlpHandle:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char isKindOfClass;
  MLAppleTextClassifier *v19;
  void *v20;
  MLAppleTextClassifier *v21;
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
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid parameters for Text Classifier"));
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
  v24.super_class = (Class)MLAppleTextClassifier;
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
  v19->textClassifierModel = (void *)objc_msgSend(v15, "initializeSentenceClassifierModelWithData:error:", v20, a7);

  if (v19->textClassifierModel)
  {
    objc_storeStrong((id *)&v19->_parameters, a3);
    goto LABEL_7;
  }
  if (a7)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("initialization of text classifier model with model data failed"));
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
  void *textClassifierModel;
  objc_super v4;

  textClassifierModel = self->textClassifierModel;
  if (textClassifierModel)
    CFRelease(textClassifierModel);
  v4.receiver = self;
  v4.super_class = (Class)MLAppleTextClassifier;
  -[MLAppleTextClassifier dealloc](&v4, sel_dealloc);
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
  void *v17;
  MLDictionaryFeatureProvider *v18;
  void *v19;
  void *v20;
  MLDictionaryFeatureProvider *v21;
  id v22;
  id v24;
  _QWORD aBlock[6];
  id v26[7];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v8 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v9 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v26, v9, 8, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v8, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v10 = -[MLModel signpostID](self, "signpostID");
  v11 = objc_msgSend(v8, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__MLAppleTextClassifier_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  +[_MLNLPFrameworkHandle sharedHandle](_MLNLPFrameworkHandle, "sharedHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isValid") & 1) != 0)
  {
    -[MLAppleTextClassifierParameters inputFeatureName](self->_parameters, "inputFeatureName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "featureValueForName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v13, "predictLabelsForSentenceString:inputString:error:", self->textClassifierModel, v16, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = [MLDictionaryFeatureProvider alloc];
        -[MLAppleTextClassifierParameters outputFeatureName](self->_parameters, "outputFeatureName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v19;
        v28[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v18, "initWithDictionary:error:", v20, a5);

LABEL_13:
LABEL_14:

        goto LABEL_15;
      }
      if (!a5)
      {
        v17 = 0;
        v21 = 0;
        goto LABEL_13;
      }
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Prediction failed"));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v17 = 0;
    }
    else
    {
      if (!a5)
      {
        v21 = 0;
        goto LABEL_14;
      }
      -[MLAppleTextClassifierParameters inputFeatureName](self->_parameters, "inputFeatureName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Input string feature '%@' not found"), v17);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = 0;
    *a5 = v22;
    goto LABEL_13;
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
LABEL_15:

  v12[2](v12);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v26);

  return v21;
}

- (MLAppleTextClassifierParameters)parameters
{
  return (MLAppleTextClassifierParameters *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

uint64_t __62__MLAppleTextClassifier_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  const CoreML::Specification::ModelDescription *v8;
  id v9;
  void *v10;
  CoreML::Specification::CoreMLModels::protobuf_TextClassifier_2eproto *v11;
  uint64_t *v12;
  MLAppleTextClassifier *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CoreML::Specification::StringVector *v19;
  CoreML::Specification::protobuf_DataStructures_2eproto *v20;
  const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *v21;
  MLAppleTextClassifierParameters *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CoreML::Specification::StringVector *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  void *v36;
  void *v37;
  __int128 v38;
  std::string *v39;
  std::string::size_type size;
  void *v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  void *v46;
  std::string v47;
  void (**v48)(CoreML::Specification::CoreMLModels::TextClassifier *__hidden);
  uint64_t v49;
  std::string *v50;
  std::string *v51;
  unsigned int v52;
  CoreML::Specification::StringVector *v53;
  int v54;
  int v55;
  char v56[8];
  std::__shared_weak_count *v57;

  v7 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2000)
  {
    if (*(_QWORD *)(*(_QWORD *)a3 + 16))
      v8 = *(const CoreML::Specification::ModelDescription **)(*(_QWORD *)a3 + 16);
    else
      v8 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
    _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)v56, v8);
    v9 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
    +[_MLNLPFrameworkHandle sharedHandle](_MLNLPFrameworkHandle, "sharedHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (CoreML::Specification::CoreMLModels::protobuf_TextClassifier_2eproto *)objc_msgSend(v10, "isValid");
    if ((v11 & 1) != 0)
    {
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2000)
      {
        v12 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        CoreML::Specification::CoreMLModels::protobuf_TextClassifier_2eproto::InitDefaults(v11);
        v12 = &CoreML::Specification::CoreMLModels::_TextClassifier_default_instance_;
      }
      v48 = &off_1E3D4D5C0;
      v49 = 0;
      v54 = 0;
      v14 = v12[1];
      if ((v14 & 1) != 0)
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v49, v14 & 0xFFFFFFFFFFFFFFFELL);
      v50 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
      v15 = v12[2];
      if (*(char *)(v15 + 23) < 0)
        v16 = *(_QWORD *)(v15 + 8);
      else
        v16 = *(unsigned __int8 *)(v15 + 23);
      if ((__int128 *)v15 != &google::protobuf::internal::fixed_address_empty_string && v16)
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v50, v15);
      v51 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
      v17 = v12[3];
      if (*(char *)(v17 + 23) < 0)
        v18 = *(_QWORD *)(v17 + 8);
      else
        v18 = *(unsigned __int8 *)(v17 + 23);
      if ((__int128 *)v17 != &google::protobuf::internal::fixed_address_empty_string && v18)
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v51, v17);
      v52 = *((_DWORD *)v12 + 8);
      v55 = 0;
      if (*((_DWORD *)v12 + 13) == 200)
      {
        v55 = 200;
        v19 = (CoreML::Specification::StringVector *)operator new();
        v20 = CoreML::Specification::StringVector::StringVector(v19);
        v53 = v19;
        if (*((_DWORD *)v12 + 13) == 200)
        {
          v21 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)v12[5];
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(v20);
          v21 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)&CoreML::Specification::_StringVector_default_instance_;
        }
        CoreML::Specification::MILSpec::TensorValue_RepeatedStrings::MergeFrom((std::string *)v19, v21);
      }
      v22 = objc_alloc_init(MLAppleTextClassifierParameters);
      -[MLAppleTextClassifierParameters setRevision:](v22, "setRevision:", v52);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLAppleTextClassifierParameters setLanguage:](v22, "setLanguage:", v23);

      objc_msgSend(v9, "inputDescriptionsByName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allKeys");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLAppleTextClassifierParameters setInputFeatureName:](v22, "setInputFeatureName:", v26);

      objc_msgSend(v9, "outputDescriptionsByName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLAppleTextClassifierParameters setOutputFeatureName:](v22, "setOutputFeatureName:", v29);

      if (v55 == 200)
      {
        v46 = v10;
        v30 = v53;
        v31 = *((unsigned int *)v53 + 6);
        v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if ((int)v31 >= 1)
        {
          v33 = 0;
          v34 = 8 * v31;
          do
          {
            v35 = *(uint64_t **)(*((_QWORD *)v30 + 4) + v33 + 8);
            if (*((char *)v35 + 23) < 0)
              v35 = (uint64_t *)*v35;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v36);

            v33 += 8;
          }
          while (v34 != v33);
        }
        v10 = v46;
        if (v32)
        {
          v37 = (void *)objc_msgSend(v32, "copy");
          -[MLAppleTextClassifierParameters setLabelNames:](v22, "setLabelNames:", v37);

          objc_msgSend(v9, "setClassLabels:", v32);
        }
      }
      else
      {
        v32 = 0;
      }
      if (SHIBYTE(v51->__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&v47, v51->__r_.__value_.__l.__data_, v51->__r_.__value_.__l.__size_);
      }
      else
      {
        v38 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
        v47.__r_.__value_.__r.__words[2] = v51->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v47.__r_.__value_.__l.__data_ = v38;
      }
      if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v39 = &v47;
      else
        v39 = (std::string *)v47.__r_.__value_.__r.__words[0];
      if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v47.__r_.__value_.__r.__words[2]);
      else
        size = v47.__r_.__value_.__l.__size_;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v39, size);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLAppleTextClassifierParameters setModelParameterData:](v22, "setModelParameterData:", v41);

      v13 = -[MLAppleTextClassifier initWithParameters:modelDescription:nlpHandle:configuration:error:]([MLAppleTextClassifier alloc], "initWithParameters:modelDescription:nlpHandle:configuration:error:", v22, v9, v10, v7, a5);
      if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v47.__r_.__value_.__l.__data_);

      CoreML::Specification::CoreMLModels::TextClassifier::~TextClassifier((CoreML::Specification::CoreMLModels::TextClassifier *)&v48);
    }
    else if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("NaturalLanguage framework not available on this OS version"));
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    v42 = v57;
    if (v57)
    {
      p_shared_owners = (unint64_t *)&v57->__shared_owners_;
      do
        v44 = __ldaxr(p_shared_owners);
      while (__stlxr(v44 - 1, p_shared_owners));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model type is not a Word tagger"));
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)saveAppleTextClassifierModelToURL:(id)a3 textClassifierParameters:(id)a4 error:(id *)a5
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
  uint64_t v15;
  CoreML::Specification::StringFeatureType *v16;
  CoreML::Specification::Model *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  CoreML::Specification::StringVector *v26;
  const char *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  double v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  google::protobuf::Arena **v71;
  void *v72;
  BOOL v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  CoreML::Specification::Model *v79;
  id v80;
  std::__shared_weak_count *v81;
  unint64_t *p_shared_owners;
  unint64_t v83;
  unsigned __int32 v84;
  unint64_t *v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  id v90;
  __int128 **v92;
  uint64_t v93;
  id v94;
  void *v95;
  char v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __n128 __p;
  char v102;
  char v103;
  CoreML::Specification::Model *v104;
  std::__shared_weak_count *v105;
  _QWORD v106[2];
  std::__shared_weak_count *v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v90 = a3;
  v94 = a4;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v104, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  v6 = v104;
  *((_DWORD *)v104 + 6) = 9;
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
  v92 = (__int128 **)v8;
  v9 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>((uint64_t)v7 + 16);
  objc_msgSend(v94, "inputFeatureName");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v10, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v9 + 2, &__p);
  if (v102 < 0)
    operator delete((void *)__p.n128_u64[0]);

  std::string::basic_string[abi:ne180100]<0>(&__p, "Input text");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v9 + 3, &__p);
  if (v102 < 0)
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
  objc_msgSend(v94, "outputFeatureName");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v14, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v13 + 2, &__p);
  if (v102 < 0)
    operator delete((void *)__p.n128_u64[0]);

  std::string::basic_string[abi:ne180100]<0>(&__p, "Text label");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v13 + 3, &__p);
  if (v102 < 0)
    operator delete((void *)__p.n128_u64[0]);
  v15 = *((_QWORD *)v13 + 4);
  if (!v15)
  {
    v15 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v15);
    *((_QWORD *)v13 + 4) = v15;
  }
  if (*(_DWORD *)(v15 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v15);
    *(_DWORD *)(v15 + 36) = 3;
    v16 = (CoreML::Specification::StringFeatureType *)operator new();
    CoreML::Specification::StringFeatureType::StringFeatureType(v16);
    *(_QWORD *)(v15 + 24) = v16;
  }
  v17 = v104;
  if (*((_DWORD *)v104 + 11) == 2000)
  {
    v18 = *((_QWORD *)v104 + 4);
  }
  else
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v104);
    *((_DWORD *)v17 + 11) = 2000;
    v18 = operator new();
    CoreML::Specification::CoreMLModels::TextClassifier::TextClassifier((CoreML::Specification::CoreMLModels::TextClassifier *)v18);
    *((_QWORD *)v17 + 4) = v18;
  }
  *(_DWORD *)(v18 + 32) = objc_msgSend(v94, "revision");
  objc_msgSend(v94, "language");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length") == 0;

  if (!v20)
  {
    objc_msgSend(v94, "language");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v21, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v18 + 16), &__p);
    if (v102 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  objc_msgSend(v94, "modelParameterData");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (void *)objc_msgSend(v22, "bytes");
  objc_msgSend(v94, "modelParameterData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  std::string::basic_string[abi:ne180100](&__p, v23, objc_msgSend(v24, "length"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v18 + 24), &__p);
  if (v102 < 0)
    operator delete((void *)__p.n128_u64[0]);

  objc_msgSend(v94, "labelNames");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v25, "count");

  if (v93)
  {
    if (*(_DWORD *)(v18 + 52) == 200)
    {
      v26 = *(CoreML::Specification::StringVector **)(v18 + 40);
    }
    else
    {
      *(_DWORD *)(v18 + 52) = 200;
      v26 = (CoreML::Specification::StringVector *)operator new();
      CoreML::Specification::StringVector::StringVector(v26);
      *(_QWORD *)(v18 + 40) = v26;
    }
    objc_msgSend(v94, "labelNames");
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "objectAtIndexedSubscript:", 0);
    v27 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    CoreML::Specification::StringVector::add_vector(v26, v27);
  }
  objc_msgSend(v94, "metadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (!v29)
  {
    objc_msgSend(v94, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v94, "metadata");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_42;
      objc_msgSend(v94, "metadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v35, "UTF8String"));
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v92 + 8, &__p);
      if (v102 < 0)
        operator delete((void *)__p.n128_u64[0]);

    }
LABEL_42:
    objc_msgSend(v94, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v94, "metadata");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v40 = objc_opt_isKindOfClass();

      if ((v40 & 1) == 0)
        goto LABEL_48;
      objc_msgSend(v94, "metadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
      v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v41, "UTF8String"));
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v92 + 9, &__p);
      if (v102 < 0)
        operator delete((void *)__p.n128_u64[0]);

    }
LABEL_48:
    objc_msgSend(v94, "metadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v94, "metadata");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v46 = objc_opt_isKindOfClass();

      if ((v46 & 1) == 0)
        goto LABEL_54;
      objc_msgSend(v94, "metadata");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v47, "UTF8String"));
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v92 + 7, &__p);
      if (v102 < 0)
        operator delete((void *)__p.n128_u64[0]);

    }
LABEL_54:
    objc_msgSend(v94, "metadata");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v94, "metadata");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v52 = objc_opt_isKindOfClass();

      if ((v52 & 1) != 0)
      {
        objc_msgSend(v94, "metadata");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = objc_retainAutorelease(v55);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v56, "UTF8String"));
        *(_QWORD *)&v53 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v92 + 6, &__p).n128_u64[0];
        if (v102 < 0)
          operator delete((void *)__p.n128_u64[0]);
LABEL_60:
        objc_msgSend(v94, "metadata", v53);
        v57 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          objc_msgSend(v94, "metadata");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v61 = objc_opt_isKindOfClass();

          if ((v61 & 1) == 0)
            goto LABEL_74;
          objc_msgSend(v94, "metadata");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v57 = v63;
          v64 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
          if (v64)
          {
            v65 = *(_QWORD *)v98;
            do
            {
              for (i = 0; i != v64; ++i)
              {
                if (*(_QWORD *)v98 != v65)
                  objc_enumerationMutation(v57);
                v67 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
                objc_msgSend(v57, "objectForKeyedSubscript:", v67);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "description");
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                if (v69)
                {
                  v70 = objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
                  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v67), "UTF8String"));
                  v71 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)(v92 + 3), (uint64_t)&__p);
                  MEMORY[0x1A1AD5EAC](v71, v70);
                  if (v102 < 0)
                    operator delete((void *)__p.n128_u64[0]);
                }

              }
              v64 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
            }
            while (v64);
          }

        }
LABEL_74:
        if (v56)
          goto LABEL_80;
        goto LABEL_75;
      }
    }
    else
    {

    }
    v56 = 0;
    goto LABEL_60;
  }
LABEL_75:
  objc_msgSend(v94, "language");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v72 == 0;

  v74 = (void *)MEMORY[0x1E0CB3940];
  if (v73)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This model is a text classifier (version %lu) which classifies text according to set {"), objc_msgSend(v94, "revision"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v75 = objc_msgSend(v94, "revision");
    objc_msgSend(v94, "language");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "stringWithFormat:", CFSTR("This model is a text classifier (version %lu) which classifies %@ text according to set {"), v75, v76, v90);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v77, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v77, "length") - 1, 1, CFSTR("}"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = objc_retainAutorelease(v78);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v56, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v92 + 6, &__p);
  if (v102 < 0)
    operator delete((void *)__p.n128_u64[0]);
LABEL_80:
  v79 = v104;
  v80 = objc_retainAutorelease(v90);
  std::string::basic_string[abi:ne180100]<0>(&v95, (char *)objc_msgSend(v80, "fileSystemRepresentation"));
  CoreML::Model::Model((CoreML::Model *)v106, v79);
  CoreML::Model::save((uint64_t)&__p, (uint64_t)v106);
  v106[0] = &off_1E3D597D0;
  v81 = v107;
  if (v107)
  {
    p_shared_owners = (unint64_t *)&v107->__shared_owners_;
    do
      v83 = __ldaxr(p_shared_owners);
    while (__stlxr(v83 - 1, p_shared_owners));
    if (!v83)
    {
      ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
      std::__shared_weak_count::__release_weak(v81);
    }
  }
  if (v96 < 0)
    operator delete(v95);
  v84 = __p.n128_u32[0] & 0xFFFFFFEF;
  if (a5 && v84)
  {
    v85 = &__p.n128_u64[1];
    if (v103 < 0)
      v85 = (unint64_t *)__p.n128_u64[1];
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Unable to save model to %@. %s"), v80, v85);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v103 < 0)
    operator delete((void *)__p.n128_u64[1]);

  v86 = v105;
  if (v105)
  {
    v87 = (unint64_t *)&v105->__shared_owners_;
    do
      v88 = __ldaxr(v87);
    while (__stlxr(v88 - 1, v87));
    if (!v88)
    {
      ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
      std::__shared_weak_count::__release_weak(v86);
    }
  }

  return v84 == 0;
}

@end
