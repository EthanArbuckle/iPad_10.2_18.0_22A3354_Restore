@implementation MLAppleWordTagger

- (MLAppleWordTagger)initWithParameters:(id)a3 modelDescription:(id)a4 nlpHandle:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char isKindOfClass;
  MLAppleWordTagger *v19;
  void *v20;
  MLAppleWordTagger *v21;
  void *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v15 || (objc_msgSend(v15, "isValid") & 1) == 0)
  {
    if (!a7)
      goto LABEL_16;
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("NaturalLanguage framework not available on this OS version"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v21 = 0;
    *a7 = v22;
    goto LABEL_17;
  }
  if (!v13)
  {
    if (!a7)
      goto LABEL_16;
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid parameters for Word Tagger"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
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
      goto LABEL_11;
    }
LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  v24.receiver = self;
  v24.super_class = (Class)MLAppleWordTagger;
  v19 = -[MLModel initWithDescription:configuration:](&v24, sel_initWithDescription_configuration_, v14, v16);
  if (!v19)
  {
LABEL_8:
    self = v19;
    v21 = self;
    goto LABEL_17;
  }
  objc_msgSend(v13, "modelParameterData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19->wordTaggingModel = (void *)objc_msgSend(v15, "initializeWordTaggingModelWithData:error:", v20, a7);

  if (v19->wordTaggingModel)
  {
    objc_storeStrong((id *)&v19->_parameters, a3);
    goto LABEL_8;
  }
  if (a7)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("initialization of word tagger model with model data failed"));
    v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  self = v19;
LABEL_17:

  return v21;
}

- (void)dealloc
{
  void *wordTaggingModel;
  objc_super v4;

  wordTaggingModel = self->wordTaggingModel;
  if (wordTaggingModel)
    CFRelease(wordTaggingModel);
  v4.receiver = self;
  v4.super_class = (Class)MLAppleWordTagger;
  -[MLAppleWordTagger dealloc](&v4, sel_dealloc);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  unint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  MLDictionaryFeatureProvider *v44;
  void *v45;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  _QWORD aBlock[6];
  id v60[8];

  v8 = a3;
  v9 = a4;
  v58 = v8;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v60, v10, 7, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = -[MLModel signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__MLAppleWordTagger_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  +[_MLNLPFrameworkHandle sharedHandle](_MLNLPFrameworkHandle, "sharedHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isValid") & 1) != 0)
  {
    -[MLAppleWordTaggerParameters inputFeatureName](self->_parameters, "inputFeatureName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "featureValueForName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v55 = v17;
      objc_msgSend(v14, "predictTokensLabelsLocationsLengthsForString:inputString:error:", self->wordTaggingModel, v17, a5);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v57 = (void *)v18;
        v56 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[MLAppleWordTaggerParameters tokenTagsOutputFeatureName](self->_parameters, "tokenTagsOutputFeatureName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
          objc_msgSend(v57, "allKeys");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKeyedSubscript:", v48);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLSequence sequenceWithStringArray:](MLSequence, "sequenceWithStringArray:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLAppleWordTaggerParameters tokenTagsOutputFeatureName](self->_parameters, "tokenTagsOutputFeatureName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v23, v24);

        }
        -[MLAppleWordTaggerParameters tokenLocationsOutputFeatureName](self->_parameters, "tokenLocationsOutputFeatureName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (v26)
        {
          objc_msgSend(v57, "allKeys");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKeyedSubscript:", v49);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLSequence sequenceWithInt64Array:](MLSequence, "sequenceWithInt64Array:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLAppleWordTaggerParameters tokenLocationsOutputFeatureName](self->_parameters, "tokenLocationsOutputFeatureName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v29, v30);

        }
        -[MLAppleWordTaggerParameters tokenLengthsOutputFeatureName](self->_parameters, "tokenLengthsOutputFeatureName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "length");

        if (v32)
        {
          objc_msgSend(v57, "allKeys");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectAtIndexedSubscript:", 2);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKeyedSubscript:", v50);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLSequence sequenceWithInt64Array:](MLSequence, "sequenceWithInt64Array:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLAppleWordTaggerParameters tokenLengthsOutputFeatureName](self->_parameters, "tokenLengthsOutputFeatureName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v35, v36);

        }
        -[MLAppleWordTaggerParameters tokensOutputFeatureName](self->_parameters, "tokensOutputFeatureName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "length");

        if (v38)
        {
          objc_msgSend(v57, "allKeys");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectAtIndexedSubscript:", 3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLSequence sequenceWithStringArray:](MLSequence, "sequenceWithStringArray:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLAppleWordTaggerParameters tokensOutputFeatureName](self->_parameters, "tokensOutputFeatureName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v42, v43);

        }
        v44 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v56, a5);

        v45 = v57;
        goto LABEL_21;
      }
      if (!a5)
      {
        v45 = 0;
        v44 = 0;
        goto LABEL_21;
      }
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Prediction failed"));
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v45 = 0;
    }
    else
    {
      if (!a5)
      {
        v44 = 0;
        goto LABEL_22;
      }
      v55 = 0;
      -[MLAppleWordTaggerParameters inputFeatureName](self->_parameters, "inputFeatureName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Input string feature '%@' not found"), v45);
      v46 = (id)objc_claimAutoreleasedReturnValue();
    }
    v44 = 0;
    *a5 = v46;
LABEL_21:

    v17 = v55;
LABEL_22:

    goto LABEL_23;
  }
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("NaturalLanguage framework not available on this OS version"));
    v44 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }
LABEL_23:

  v13[2](v13);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v60);

  return v44;
}

- (MLAppleWordTaggerParameters)parameters
{
  return (MLAppleWordTaggerParameters *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

uint64_t __58__MLAppleWordTagger_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  CoreML::Specification::CoreMLModels::protobuf_WordTagger_2eproto *v10;
  uint64_t *v11;
  MLAppleWordTagger *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CoreML::Specification::StringVector *v26;
  CoreML::Specification::protobuf_DataStructures_2eproto *v27;
  const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *v28;
  MLAppleWordTaggerParameters *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CoreML::Specification::StringVector *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  void *v44;
  void *v45;
  __int128 v46;
  std::string *v47;
  std::string::size_type size;
  void *v49;
  void *v51;
  std::string v52;
  void (**v53)(CoreML::Specification::CoreMLModels::WordTagger *__hidden);
  uint64_t v54;
  std::string *v55;
  std::string *v56;
  std::string *v57;
  std::string *v58;
  std::string *v59;
  std::string *v60;
  unsigned int v61;
  CoreML::Specification::StringVector *v62;
  int v63;
  int v64;

  v7 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2001)
  {
    v8 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
    if (v8)
    {
      +[_MLNLPFrameworkHandle sharedHandle](_MLNLPFrameworkHandle, "sharedHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (CoreML::Specification::CoreMLModels::protobuf_WordTagger_2eproto *)objc_msgSend(v9, "isValid");
      if ((v10 & 1) != 0)
      {
        if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2001)
        {
          v11 = *(uint64_t **)(*(_QWORD *)a3 + 32);
        }
        else
        {
          CoreML::Specification::CoreMLModels::protobuf_WordTagger_2eproto::InitDefaults(v10);
          v11 = &CoreML::Specification::CoreMLModels::_WordTagger_default_instance_;
        }
        v53 = &off_1E3D4D490;
        v54 = 0;
        v63 = 0;
        v13 = v11[1];
        if ((v13 & 1) != 0)
          google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v54, v13 & 0xFFFFFFFFFFFFFFFELL);
        v55 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
        v14 = v11[2];
        if (*(char *)(v14 + 23) < 0)
          v15 = *(_QWORD *)(v14 + 8);
        else
          v15 = *(unsigned __int8 *)(v14 + 23);
        if ((__int128 *)v14 != &google::protobuf::internal::fixed_address_empty_string && v15)
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v55, v14);
        v56 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
        v16 = v11[3];
        if (*(char *)(v16 + 23) < 0)
          v17 = *(_QWORD *)(v16 + 8);
        else
          v17 = *(unsigned __int8 *)(v16 + 23);
        if ((__int128 *)v16 != &google::protobuf::internal::fixed_address_empty_string && v17)
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v56, v16);
        v57 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
        v18 = v11[4];
        if (*(char *)(v18 + 23) < 0)
          v19 = *(_QWORD *)(v18 + 8);
        else
          v19 = *(unsigned __int8 *)(v18 + 23);
        if ((__int128 *)v18 != &google::protobuf::internal::fixed_address_empty_string && v19)
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v57, v18);
        v58 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
        v20 = v11[5];
        if (*(char *)(v20 + 23) < 0)
          v21 = *(_QWORD *)(v20 + 8);
        else
          v21 = *(unsigned __int8 *)(v20 + 23);
        if ((__int128 *)v20 != &google::protobuf::internal::fixed_address_empty_string && v21)
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v58, v20);
        v59 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
        v22 = v11[6];
        if (*(char *)(v22 + 23) < 0)
          v23 = *(_QWORD *)(v22 + 8);
        else
          v23 = *(unsigned __int8 *)(v22 + 23);
        if ((__int128 *)v22 != &google::protobuf::internal::fixed_address_empty_string && v23)
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v59, v22);
        v60 = (std::string *)&google::protobuf::internal::fixed_address_empty_string;
        v24 = v11[7];
        if (*(char *)(v24 + 23) < 0)
          v25 = *(_QWORD *)(v24 + 8);
        else
          v25 = *(unsigned __int8 *)(v24 + 23);
        if ((__int128 *)v24 != &google::protobuf::internal::fixed_address_empty_string && v25)
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(&v60, v24);
        v61 = *((_DWORD *)v11 + 16);
        v64 = 0;
        if (*((_DWORD *)v11 + 21) == 200)
        {
          v64 = 200;
          v26 = (CoreML::Specification::StringVector *)operator new();
          v27 = CoreML::Specification::StringVector::StringVector(v26);
          v62 = v26;
          if (*((_DWORD *)v11 + 21) == 200)
          {
            v28 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)v11[9];
          }
          else
          {
            CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(v27);
            v28 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)&CoreML::Specification::_StringVector_default_instance_;
          }
          CoreML::Specification::MILSpec::TensorValue_RepeatedStrings::MergeFrom((std::string *)v26, v28);
        }
        v29 = objc_alloc_init(MLAppleWordTaggerParameters);
        -[MLAppleWordTaggerParameters setRevision:](v29, "setRevision:", v61);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLAppleWordTaggerParameters setLanguage:](v29, "setLanguage:", v30);

        objc_msgSend(v8, "inputDescriptionsByName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "allKeys");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLAppleWordTaggerParameters setInputFeatureName:](v29, "setInputFeatureName:", v33);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLAppleWordTaggerParameters setTokensOutputFeatureName:](v29, "setTokensOutputFeatureName:", v34);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLAppleWordTaggerParameters setTokenTagsOutputFeatureName:](v29, "setTokenTagsOutputFeatureName:", v35);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLAppleWordTaggerParameters setTokenLocationsOutputFeatureName:](v29, "setTokenLocationsOutputFeatureName:", v36);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLAppleWordTaggerParameters setTokenLengthsOutputFeatureName:](v29, "setTokenLengthsOutputFeatureName:", v37);

        if (v64 == 200)
        {
          v51 = v9;
          v38 = v62;
          v39 = *((unsigned int *)v62 + 6);
          v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if ((int)v39 >= 1)
          {
            v41 = 0;
            v42 = 8 * v39;
            do
            {
              v43 = *(uint64_t **)(*((_QWORD *)v38 + 4) + v41 + 8);
              if (*((char *)v43 + 23) < 0)
                v43 = (uint64_t *)*v43;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v44);

              v41 += 8;
            }
            while (v42 != v41);
          }
          v9 = v51;
          if (v40)
          {
            v45 = (void *)objc_msgSend(v40, "copy");
            -[MLAppleWordTaggerParameters setTagNames:](v29, "setTagNames:", v45);

            objc_msgSend(v8, "setClassLabels:", v40);
          }
        }
        else
        {
          v40 = 0;
        }
        if (SHIBYTE(v60->__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(&v52, v60->__r_.__value_.__l.__data_, v60->__r_.__value_.__l.__size_);
        }
        else
        {
          v46 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
          v52.__r_.__value_.__r.__words[2] = v60->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v52.__r_.__value_.__l.__data_ = v46;
        }
        if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v47 = &v52;
        else
          v47 = (std::string *)v52.__r_.__value_.__r.__words[0];
        if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(v52.__r_.__value_.__r.__words[2]);
        else
          size = v52.__r_.__value_.__l.__size_;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v47, size);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLAppleWordTaggerParameters setModelParameterData:](v29, "setModelParameterData:", v49);

        v12 = -[MLAppleWordTagger initWithParameters:modelDescription:nlpHandle:configuration:error:]([MLAppleWordTagger alloc], "initWithParameters:modelDescription:nlpHandle:configuration:error:", v29, v8, v9, v7, a5);
        if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v52.__r_.__value_.__l.__data_);

        CoreML::Specification::CoreMLModels::WordTagger::~WordTagger((CoreML::Specification::CoreMLModels::WordTagger *)&v53);
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
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model description is invalid"));
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
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model type is not a word tagger"));
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)saveAppleWordTaggingModelToURL:(id)a3 wordTaggerParameters:(id)a4 error:(id *)a5
{
  CoreML::Specification::Model *v6;
  CoreML::Specification::ModelDescription *v7;
  CoreML::Specification::Metadata *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  CoreML::Specification::FeatureDescription *v17;
  id v18;
  uint64_t v19;
  CoreML::Specification::StringFeatureType *v20;
  uint64_t v21;
  CoreML::Specification::FeatureDescription *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  CoreML::Specification::StringFeatureType *v26;
  CoreML::Specification::SequenceFeatureType *v27;
  CoreML::Specification::SizeRange *v28;
  CoreML::Specification::SequenceFeatureType *v29;
  CoreML::Specification::SizeRange *v30;
  void *v31;
  BOOL v32;
  CoreML::Specification::FeatureDescription *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  CoreML::Specification::Int64FeatureType *v37;
  CoreML::Specification::SequenceFeatureType *v38;
  CoreML::Specification::SizeRange *v39;
  CoreML::Specification::SequenceFeatureType *v40;
  CoreML::Specification::SizeRange *v41;
  id v42;
  void *v43;
  BOOL v44;
  CoreML::Specification::FeatureDescription *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  CoreML::Specification::Int64FeatureType *v49;
  CoreML::Specification::SequenceFeatureType *v50;
  CoreML::Specification::SizeRange *v51;
  CoreML::Specification::SequenceFeatureType *v52;
  CoreML::Specification::SizeRange *v53;
  id v54;
  void *v55;
  BOOL v56;
  CoreML::Specification::FeatureDescription *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  CoreML::Specification::StringFeatureType *v61;
  CoreML::Specification::SequenceFeatureType *v62;
  CoreML::Specification::SizeRange *v63;
  CoreML::Specification::SequenceFeatureType *v64;
  CoreML::Specification::SizeRange *v65;
  id v66;
  void *v67;
  CoreML::Specification::StringVector *v68;
  const char *v69;
  void *v70;
  BOOL v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char isKindOfClass;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  double v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  char v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  google::protobuf::Arena **v113;
  void *v114;
  BOOL v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  CoreML::Specification::Model *v121;
  id v122;
  std::__shared_weak_count *v123;
  unint64_t *p_shared_owners;
  unint64_t v125;
  unsigned __int32 v126;
  unint64_t *v127;
  std::__shared_weak_count *v128;
  unint64_t *v129;
  unint64_t v130;
  id v132;
  __int128 **v134;
  uint64_t v135;
  id v136;
  void *v137;
  char v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __n128 __p;
  char v144;
  char v145;
  CoreML::Specification::Model *v146;
  std::__shared_weak_count *v147;
  _QWORD v148[2];
  std::__shared_weak_count *v149;
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v132 = a3;
  v136 = a4;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v146, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  v6 = v146;
  *((_DWORD *)v146 + 6) = 9;
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
  v134 = (__int128 **)v8;
  if (*((_DWORD *)v6 + 11) == 2001)
  {
    v9 = *((_QWORD *)v6 + 4);
  }
  else
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v6);
    *((_DWORD *)v6 + 11) = 2001;
    v9 = operator new();
    CoreML::Specification::CoreMLModels::WordTagger::WordTagger((CoreML::Specification::CoreMLModels::WordTagger *)v9);
    *((_QWORD *)v6 + 4) = v9;
  }
  *(_DWORD *)(v9 + 64) = objc_msgSend(v136, "revision");
  objc_msgSend(v136, "language");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length") == 0;

  if (!v11)
  {
    objc_msgSend(v136, "language");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v12, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v9 + 16), &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  objc_msgSend(v136, "tokenTagsOutputFeatureName");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v13, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v9 + 32), &__p);
  if (v144 < 0)
    operator delete((void *)__p.n128_u64[0]);

  objc_msgSend(v136, "modelParameterData");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (void *)objc_msgSend(v14, "bytes");
  objc_msgSend(v136, "modelParameterData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  std::string::basic_string[abi:ne180100](&__p, v15, objc_msgSend(v16, "length"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v9 + 56), &__p);
  if (v144 < 0)
    operator delete((void *)__p.n128_u64[0]);

  v17 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>((uint64_t)v7 + 16);
  objc_msgSend(v136, "inputFeatureName");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v17 + 2, &__p);
  if (v144 < 0)
    operator delete((void *)__p.n128_u64[0]);

  std::string::basic_string[abi:ne180100]<0>(&__p, "Input text");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v17 + 3, &__p);
  if (v144 < 0)
    operator delete((void *)__p.n128_u64[0]);
  v19 = *((_QWORD *)v17 + 4);
  if (!v19)
  {
    v19 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v19);
    *((_QWORD *)v17 + 4) = v19;
  }
  if (*(_DWORD *)(v19 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v19);
    *(_DWORD *)(v19 + 36) = 3;
    v20 = (CoreML::Specification::StringFeatureType *)operator new();
    CoreML::Specification::StringFeatureType::StringFeatureType(v20);
    *(_QWORD *)(v19 + 24) = v20;
  }
  v21 = (uint64_t)v7 + 40;
  v22 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v21);
  objc_msgSend(v136, "tokenTagsOutputFeatureName");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v23, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v22 + 2, &__p);
  if (v144 < 0)
    operator delete((void *)__p.n128_u64[0]);

  std::string::basic_string[abi:ne180100]<0>(&__p, "Token tags");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v22 + 3, &__p);
  if (v144 < 0)
    operator delete((void *)__p.n128_u64[0]);
  v24 = *((_QWORD *)v22 + 4);
  if (!v24)
  {
    v24 = operator new();
    CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v24);
    *((_QWORD *)v22 + 4) = v24;
  }
  if (*(_DWORD *)(v24 + 36) == 7)
  {
    v25 = *(_QWORD *)(v24 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v24);
    *(_DWORD *)(v24 + 36) = 7;
    v25 = operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v25);
    *(_QWORD *)(v24 + 24) = v25;
    if (*(_DWORD *)(v24 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v24);
      *(_DWORD *)(v24 + 36) = 7;
      v25 = operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v25);
      *(_QWORD *)(v24 + 24) = v25;
    }
  }
  if (*(_DWORD *)(v25 + 36) != 3)
  {
    CoreML::Specification::SequenceFeatureType::clear_Type(v25);
    *(_DWORD *)(v25 + 36) = 3;
    v26 = (CoreML::Specification::StringFeatureType *)operator new();
    CoreML::Specification::StringFeatureType::StringFeatureType(v26);
    *(_QWORD *)(v25 + 24) = v26;
  }
  if (*(_DWORD *)(v24 + 36) == 7)
  {
    v27 = *(CoreML::Specification::SequenceFeatureType **)(v24 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v24);
    *(_DWORD *)(v24 + 36) = 7;
    v27 = (CoreML::Specification::SequenceFeatureType *)operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v27);
    *(_QWORD *)(v24 + 24) = v27;
  }
  v28 = (CoreML::Specification::SizeRange *)*((_QWORD *)v27 + 2);
  if (!v28)
  {
    v28 = (CoreML::Specification::SizeRange *)operator new();
    CoreML::Specification::SizeRange::SizeRange(v28);
    *((_QWORD *)v27 + 2) = v28;
  }
  *((_QWORD *)v28 + 2) = 0;
  if (*(_DWORD *)(v24 + 36) == 7)
  {
    v29 = *(CoreML::Specification::SequenceFeatureType **)(v24 + 24);
  }
  else
  {
    CoreML::Specification::FeatureType::clear_Type(v24);
    *(_DWORD *)(v24 + 36) = 7;
    v29 = (CoreML::Specification::SequenceFeatureType *)operator new();
    CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v29);
    *(_QWORD *)(v24 + 24) = v29;
  }
  v30 = (CoreML::Specification::SizeRange *)*((_QWORD *)v29 + 2);
  if (!v30)
  {
    v30 = (CoreML::Specification::SizeRange *)operator new();
    CoreML::Specification::SizeRange::SizeRange(v30);
    *((_QWORD *)v29 + 2) = v30;
  }
  *((_QWORD *)v30 + 3) = 10000;
  objc_msgSend(v136, "tokenLengthsOutputFeatureName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "length") == 0;

  if (!v32)
  {
    v33 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v21);
    objc_msgSend(v136, "tokenLengthsOutputFeatureName");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v34, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v33 + 2, &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);

    std::string::basic_string[abi:ne180100]<0>(&__p, "Token lengths");
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v33 + 3, &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);
    v35 = *((_QWORD *)v33 + 4);
    if (!v35)
    {
      v35 = operator new();
      CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v35);
      *((_QWORD *)v33 + 4) = v35;
    }
    if (*(_DWORD *)(v35 + 36) == 7)
    {
      v36 = *(_QWORD *)(v35 + 24);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type(v35);
      *(_DWORD *)(v35 + 36) = 7;
      v36 = operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v36);
      *(_QWORD *)(v35 + 24) = v36;
      if (*(_DWORD *)(v35 + 36) != 7)
      {
        CoreML::Specification::FeatureType::clear_Type(v35);
        *(_DWORD *)(v35 + 36) = 7;
        v36 = operator new();
        CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v36);
        *(_QWORD *)(v35 + 24) = v36;
      }
    }
    if (*(_DWORD *)(v36 + 36) != 1)
    {
      CoreML::Specification::SequenceFeatureType::clear_Type(v36);
      *(_DWORD *)(v36 + 36) = 1;
      v37 = (CoreML::Specification::Int64FeatureType *)operator new();
      CoreML::Specification::Int64FeatureType::Int64FeatureType(v37);
      *(_QWORD *)(v36 + 24) = v37;
    }
    if (*(_DWORD *)(v35 + 36) == 7)
    {
      v38 = *(CoreML::Specification::SequenceFeatureType **)(v35 + 24);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type(v35);
      *(_DWORD *)(v35 + 36) = 7;
      v38 = (CoreML::Specification::SequenceFeatureType *)operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v38);
      *(_QWORD *)(v35 + 24) = v38;
    }
    v39 = (CoreML::Specification::SizeRange *)*((_QWORD *)v38 + 2);
    if (!v39)
    {
      v39 = (CoreML::Specification::SizeRange *)operator new();
      CoreML::Specification::SizeRange::SizeRange(v39);
      *((_QWORD *)v38 + 2) = v39;
    }
    *((_QWORD *)v39 + 2) = 0;
    if (*(_DWORD *)(v35 + 36) == 7)
    {
      v40 = *(CoreML::Specification::SequenceFeatureType **)(v35 + 24);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type(v35);
      *(_DWORD *)(v35 + 36) = 7;
      v40 = (CoreML::Specification::SequenceFeatureType *)operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v40);
      *(_QWORD *)(v35 + 24) = v40;
    }
    v41 = (CoreML::Specification::SizeRange *)*((_QWORD *)v40 + 2);
    if (!v41)
    {
      v41 = (CoreML::Specification::SizeRange *)operator new();
      CoreML::Specification::SizeRange::SizeRange(v41);
      *((_QWORD *)v40 + 2) = v41;
    }
    *((_QWORD *)v41 + 3) = 10000;
    objc_msgSend(v136, "tokenLengthsOutputFeatureName");
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v42, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v9 + 48), &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  objc_msgSend(v136, "tokenLocationsOutputFeatureName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "length") == 0;

  if (!v44)
  {
    v45 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v21);
    objc_msgSend(v136, "tokenLocationsOutputFeatureName");
    v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v46, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v45 + 2, &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);

    std::string::basic_string[abi:ne180100]<0>(&__p, "Token locations");
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v45 + 3, &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);
    v47 = *((_QWORD *)v45 + 4);
    if (!v47)
    {
      v47 = operator new();
      CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v47);
      *((_QWORD *)v45 + 4) = v47;
    }
    if (*(_DWORD *)(v47 + 36) == 7)
    {
      v48 = *(_QWORD *)(v47 + 24);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type(v47);
      *(_DWORD *)(v47 + 36) = 7;
      v48 = operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v48);
      *(_QWORD *)(v47 + 24) = v48;
      if (*(_DWORD *)(v47 + 36) != 7)
      {
        CoreML::Specification::FeatureType::clear_Type(v47);
        *(_DWORD *)(v47 + 36) = 7;
        v48 = operator new();
        CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v48);
        *(_QWORD *)(v47 + 24) = v48;
      }
    }
    if (*(_DWORD *)(v48 + 36) != 1)
    {
      CoreML::Specification::SequenceFeatureType::clear_Type(v48);
      *(_DWORD *)(v48 + 36) = 1;
      v49 = (CoreML::Specification::Int64FeatureType *)operator new();
      CoreML::Specification::Int64FeatureType::Int64FeatureType(v49);
      *(_QWORD *)(v48 + 24) = v49;
    }
    if (*(_DWORD *)(v47 + 36) == 7)
    {
      v50 = *(CoreML::Specification::SequenceFeatureType **)(v47 + 24);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type(v47);
      *(_DWORD *)(v47 + 36) = 7;
      v50 = (CoreML::Specification::SequenceFeatureType *)operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v50);
      *(_QWORD *)(v47 + 24) = v50;
    }
    v51 = (CoreML::Specification::SizeRange *)*((_QWORD *)v50 + 2);
    if (!v51)
    {
      v51 = (CoreML::Specification::SizeRange *)operator new();
      CoreML::Specification::SizeRange::SizeRange(v51);
      *((_QWORD *)v50 + 2) = v51;
    }
    *((_QWORD *)v51 + 2) = 0;
    if (*(_DWORD *)(v47 + 36) == 7)
    {
      v52 = *(CoreML::Specification::SequenceFeatureType **)(v47 + 24);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type(v47);
      *(_DWORD *)(v47 + 36) = 7;
      v52 = (CoreML::Specification::SequenceFeatureType *)operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v52);
      *(_QWORD *)(v47 + 24) = v52;
    }
    v53 = (CoreML::Specification::SizeRange *)*((_QWORD *)v52 + 2);
    if (!v53)
    {
      v53 = (CoreML::Specification::SizeRange *)operator new();
      CoreML::Specification::SizeRange::SizeRange(v53);
      *((_QWORD *)v52 + 2) = v53;
    }
    *((_QWORD *)v53 + 3) = 10000;
    objc_msgSend(v136, "tokenLocationsOutputFeatureName");
    v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v54, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v9 + 40), &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  objc_msgSend(v136, "tokensOutputFeatureName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "length") == 0;

  if (!v56)
  {
    v57 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v21);
    objc_msgSend(v136, "tokensOutputFeatureName");
    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v58, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v57 + 2, &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);

    std::string::basic_string[abi:ne180100]<0>(&__p, "Tokens");
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)v57 + 3, &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);
    v59 = *((_QWORD *)v57 + 4);
    if (!v59)
    {
      v59 = operator new();
      CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v59);
      *((_QWORD *)v57 + 4) = v59;
    }
    if (*(_DWORD *)(v59 + 36) == 7)
    {
      v60 = *(_QWORD *)(v59 + 24);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type(v59);
      *(_DWORD *)(v59 + 36) = 7;
      v60 = operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v60);
      *(_QWORD *)(v59 + 24) = v60;
      if (*(_DWORD *)(v59 + 36) != 7)
      {
        CoreML::Specification::FeatureType::clear_Type(v59);
        *(_DWORD *)(v59 + 36) = 7;
        v60 = operator new();
        CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)v60);
        *(_QWORD *)(v59 + 24) = v60;
      }
    }
    if (*(_DWORD *)(v60 + 36) != 3)
    {
      CoreML::Specification::SequenceFeatureType::clear_Type(v60);
      *(_DWORD *)(v60 + 36) = 3;
      v61 = (CoreML::Specification::StringFeatureType *)operator new();
      CoreML::Specification::StringFeatureType::StringFeatureType(v61);
      *(_QWORD *)(v60 + 24) = v61;
    }
    if (*(_DWORD *)(v59 + 36) == 7)
    {
      v62 = *(CoreML::Specification::SequenceFeatureType **)(v59 + 24);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type(v59);
      *(_DWORD *)(v59 + 36) = 7;
      v62 = (CoreML::Specification::SequenceFeatureType *)operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v62);
      *(_QWORD *)(v59 + 24) = v62;
    }
    v63 = (CoreML::Specification::SizeRange *)*((_QWORD *)v62 + 2);
    if (!v63)
    {
      v63 = (CoreML::Specification::SizeRange *)operator new();
      CoreML::Specification::SizeRange::SizeRange(v63);
      *((_QWORD *)v62 + 2) = v63;
    }
    *((_QWORD *)v63 + 2) = 0;
    if (*(_DWORD *)(v59 + 36) == 7)
    {
      v64 = *(CoreML::Specification::SequenceFeatureType **)(v59 + 24);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type(v59);
      *(_DWORD *)(v59 + 36) = 7;
      v64 = (CoreML::Specification::SequenceFeatureType *)operator new();
      CoreML::Specification::SequenceFeatureType::SequenceFeatureType(v64);
      *(_QWORD *)(v59 + 24) = v64;
    }
    v65 = (CoreML::Specification::SizeRange *)*((_QWORD *)v64 + 2);
    if (!v65)
    {
      v65 = (CoreML::Specification::SizeRange *)operator new();
      CoreML::Specification::SizeRange::SizeRange(v65);
      *((_QWORD *)v64 + 2) = v65;
    }
    *((_QWORD *)v65 + 3) = 10000;
    objc_msgSend(v136, "tokensOutputFeatureName");
    v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v66, "UTF8String"));
    google::protobuf::internal::ArenaStringPtr::SetNoArena((__int128 **)(v9 + 24), &__p);
    if (v144 < 0)
      operator delete((void *)__p.n128_u64[0]);

  }
  objc_msgSend(v136, "tagNames");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = objc_msgSend(v67, "count");

  if (v135)
  {
    if (*(_DWORD *)(v9 + 84) == 200)
    {
      v68 = *(CoreML::Specification::StringVector **)(v9 + 72);
    }
    else
    {
      *(_DWORD *)(v9 + 84) = 200;
      v68 = (CoreML::Specification::StringVector *)operator new();
      CoreML::Specification::StringVector::StringVector(v68);
      *(_QWORD *)(v9 + 72) = v68;
    }
    objc_msgSend(v136, "tagNames");
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "objectAtIndexedSubscript:", 0);
    v69 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    CoreML::Specification::StringVector::add_vector(v68, v69);
  }
  objc_msgSend(v136, "metadata");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70 == 0;

  if (!v71)
  {
    objc_msgSend(v136, "metadata");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      objc_msgSend(v136, "metadata");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_136;
      objc_msgSend(v136, "metadata");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("MLModelAuthorKey"));
      v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v77, "UTF8String"));
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v134 + 8, &__p);
      if (v144 < 0)
        operator delete((void *)__p.n128_u64[0]);

    }
LABEL_136:
    objc_msgSend(v136, "metadata");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79)
    {
      objc_msgSend(v136, "metadata");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v82 = objc_opt_isKindOfClass();

      if ((v82 & 1) == 0)
        goto LABEL_142;
      objc_msgSend(v136, "metadata");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("MLModelLicenseKey"));
      v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v83, "UTF8String"));
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v134 + 9, &__p);
      if (v144 < 0)
        operator delete((void *)__p.n128_u64[0]);

    }
LABEL_142:
    objc_msgSend(v136, "metadata");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v85)
    {
      objc_msgSend(v136, "metadata");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v88 = objc_opt_isKindOfClass();

      if ((v88 & 1) == 0)
        goto LABEL_148;
      objc_msgSend(v136, "metadata");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("MLModelVersionStringKey"));
      v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v89, "UTF8String"));
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v134 + 7, &__p);
      if (v144 < 0)
        operator delete((void *)__p.n128_u64[0]);

    }
LABEL_148:
    objc_msgSend(v136, "metadata");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v91)
    {
      objc_msgSend(v136, "metadata");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v94 = objc_opt_isKindOfClass();

      if ((v94 & 1) != 0)
      {
        objc_msgSend(v136, "metadata");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("MLModelDescriptionKey"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        v98 = objc_retainAutorelease(v97);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v98, "UTF8String"));
        *(_QWORD *)&v95 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v134 + 6, &__p).n128_u64[0];
        if (v144 < 0)
          operator delete((void *)__p.n128_u64[0]);
LABEL_154:
        objc_msgSend(v136, "metadata", v95);
        v99 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (v100)
        {
          objc_msgSend(v136, "metadata");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v103 = objc_opt_isKindOfClass();

          if ((v103 & 1) == 0)
            goto LABEL_168;
          objc_msgSend(v136, "metadata");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
          v105 = (void *)objc_claimAutoreleasedReturnValue();

          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          v99 = v105;
          v106 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v139, v150, 16);
          if (v106)
          {
            v107 = *(_QWORD *)v140;
            do
            {
              for (i = 0; i != v106; ++i)
              {
                if (*(_QWORD *)v140 != v107)
                  objc_enumerationMutation(v99);
                v109 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
                objc_msgSend(v99, "objectForKeyedSubscript:", v109);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "description");
                v111 = (void *)objc_claimAutoreleasedReturnValue();

                if (v111)
                {
                  v112 = objc_msgSend(objc_retainAutorelease(v111), "UTF8String");
                  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v109), "UTF8String"));
                  v113 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)(v134 + 3), (uint64_t)&__p);
                  MEMORY[0x1A1AD5EAC](v113, v112);
                  if (v144 < 0)
                    operator delete((void *)__p.n128_u64[0]);
                }

              }
              v106 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v139, v150, 16);
            }
            while (v106);
          }

        }
LABEL_168:
        if (v98)
          goto LABEL_174;
        goto LABEL_169;
      }
    }
    else
    {

    }
    v98 = 0;
    goto LABEL_154;
  }
LABEL_169:
  objc_msgSend(v136, "language");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v114 == 0;

  v116 = (void *)MEMORY[0x1E0CB3940];
  if (v115)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This model is a word tagger (version %lu) which tags words according to set {"), objc_msgSend(v136, "revision"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v117 = objc_msgSend(v136, "revision");
    objc_msgSend(v136, "language");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "stringWithFormat:", CFSTR("This model is a word tagger (version %lu) which tags %@ words according to set {"), v117, v118, v132);
    v119 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v119, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v119, "length") - 1, 1, CFSTR("}"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v98 = objc_retainAutorelease(v120);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v98, "UTF8String"));
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v134 + 6, &__p);
  if (v144 < 0)
    operator delete((void *)__p.n128_u64[0]);
LABEL_174:
  v121 = v146;
  v122 = objc_retainAutorelease(v132);
  std::string::basic_string[abi:ne180100]<0>(&v137, (char *)objc_msgSend(v122, "fileSystemRepresentation"));
  CoreML::Model::Model((CoreML::Model *)v148, v121);
  CoreML::Model::save((uint64_t)&__p, (uint64_t)v148);
  v148[0] = &off_1E3D597D0;
  v123 = v149;
  if (v149)
  {
    p_shared_owners = (unint64_t *)&v149->__shared_owners_;
    do
      v125 = __ldaxr(p_shared_owners);
    while (__stlxr(v125 - 1, p_shared_owners));
    if (!v125)
    {
      ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
      std::__shared_weak_count::__release_weak(v123);
    }
  }
  if (v138 < 0)
    operator delete(v137);
  v126 = __p.n128_u32[0] & 0xFFFFFFEF;
  if (a5 && v126)
  {
    v127 = &__p.n128_u64[1];
    if (v145 < 0)
      v127 = (unint64_t *)__p.n128_u64[1];
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Unable to save model to %@. %s"), v122, v127);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v145 < 0)
    operator delete((void *)__p.n128_u64[1]);

  v128 = v147;
  if (v147)
  {
    v129 = (unint64_t *)&v147->__shared_owners_;
    do
      v130 = __ldaxr(v129);
    while (__stlxr(v130 - 1, v129));
    if (!v130)
    {
      ((void (*)(std::__shared_weak_count *))v128->__on_zero_shared)(v128);
      std::__shared_weak_count::__release_weak(v128);
    }
  }

  return v126 == 0;
}

@end
