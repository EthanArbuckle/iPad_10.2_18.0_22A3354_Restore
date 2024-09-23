@implementation MLAppleAudioFeatureExtractor

- (MLAppleAudioFeatureExtractor)initWithParameters:(id)a3 modelDescription:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  MLAppleAudioFeatureExtractor *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *inputFeatureName;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *outputFeatureName;
  MLCustomModel *v23;
  MLCustomModel *featureEmbeddingModel;
  id v25;
  uint64_t v26;
  MLCustomModel *v27;
  MLAppleAudioFeatureExtractor *v28;
  const __CFString *v30;
  _QWORD *v31;
  id v32;
  objc_super v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    v30 = CFSTR("parameters == nil.");
    v31 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_13;
  }
  if ((-[objc_class conformsToProtocol:](NSClassFromString(CFSTR("_SNSoundPrintAFeatureEmbeddingCustomModel")), "conformsToProtocol:", &unk_1EE435650) & 1) == 0)
  {
    v30 = CFSTR("Not conforming custom model protocol.");
    v31 = (_QWORD *)MEMORY[0x1E0C99768];
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *v31, v30, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  v33.receiver = self;
  v33.super_class = (Class)MLAppleAudioFeatureExtractor;
  v14 = -[MLModel initWithDescription:configuration:](&v33, sel_initWithDescription_configuration_, v12, v13);
  if (!v14)
  {
LABEL_6:
    v28 = v14;
    goto LABEL_10;
  }
  objc_msgSend(v12, "inputDescriptionsByName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = objc_claimAutoreleasedReturnValue();
  inputFeatureName = v14->_inputFeatureName;
  v14->_inputFeatureName = (NSString *)v17;

  objc_msgSend(v12, "outputDescriptionsByName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = objc_claimAutoreleasedReturnValue();
  outputFeatureName = v14->_outputFeatureName;
  v14->_outputFeatureName = (NSString *)v21;

  objc_storeStrong((id *)&v14->_parameters, a3);
  v23 = (MLCustomModel *)objc_alloc(NSClassFromString(CFSTR("_SNSoundPrintAFeatureEmbeddingCustomModel")));
  featureEmbeddingModel = v14->_featureEmbeddingModel;
  v14->_featureEmbeddingModel = v23;

  v25 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v26 = -[MLCustomModel initWithModelDescription:parameterDictionary:error:](v14->_featureEmbeddingModel, "initWithModelDescription:parameterDictionary:error:", v12, v25, a6);
  v27 = v14->_featureEmbeddingModel;
  v14->_featureEmbeddingModel = (MLCustomModel *)v26;

  if (v14->_featureEmbeddingModel)
  {

    goto LABEL_6;
  }
  if (a6)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Audio feature extractor failed to init"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  v28 = 0;
LABEL_10:

  return v28;
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
  _QWORD aBlock[6];
  id v17[7];

  v8 = a3;
  v9 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v17, v10, 6, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = -[MLModel signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__MLAppleAudioFeatureExtractor_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!v9)
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MLCustomModel predictionFromFeatures:options:error:](self->_featureEmbeddingModel, "predictionFromFeatures:options:error:", v8, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v17);
  return v14;
}

- (MLAppleAudioFeatureExtractorParameters)parameters
{
  return (MLAppleAudioFeatureExtractorParameters *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_featureEmbeddingModel, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
}

uint64_t __69__MLAppleAudioFeatureExtractor_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  const CoreML::Specification::ModelDescription *v8;
  id v9;
  void *v10;
  CoreML::Specification::CoreMLModels::protobuf_AudioFeaturePrint_2eproto *v11;
  uint64_t *v12;
  MLAppleAudioFeatureExtractor *v13;
  uint64_t v14;
  uint64_t v15;
  CoreML::Specification::CoreMLModels::AudioFeaturePrint_Sound *v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  CoreML::Specification::CoreMLModels::protobuf_AudioFeaturePrint_2eproto *v25;
  uint64_t *v26;
  id v27;
  MLAppleAudioFeatureExtractorParameters *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  std::__shared_weak_count *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  id v47;
  void *v48;
  void (**v49)(CoreML::Specification::CoreMLModels::AudioFeaturePrint *__hidden);
  uint64_t v50;
  uint64_t *v51;
  int v52;
  int v53;
  char v54[8];
  std::__shared_weak_count *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) != 2006)
  {
    if (a5)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model type is not an audio feature print"));
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_61;
  }
  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
    v8 = *(const CoreML::Specification::ModelDescription **)(*(_QWORD *)a3 + 16);
  else
    v8 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)v54, v8);
  v9 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  +[_MLSNFrameworkHandle sharedHandle](_MLSNFrameworkHandle, "sharedHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = NSClassFromString(CFSTR("_SNSoundPrintAFeatureEmbeddingCustomModel"));
    if (v11)
    {
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2006)
      {
        v12 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        CoreML::Specification::CoreMLModels::protobuf_AudioFeaturePrint_2eproto::InitDefaults(v11);
        v12 = &CoreML::Specification::CoreMLModels::_AudioFeaturePrint_default_instance_;
      }
      v49 = &off_1E3D4D658;
      v50 = 0;
      v52 = 0;
      v14 = v12[1];
      if ((v14 & 1) != 0)
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v50, v14 & 0xFFFFFFFFFFFFFFFELL);
      v53 = 0;
      if (*((_DWORD *)v12 + 7) != 20)
        goto LABEL_34;
      v53 = 20;
      v15 = operator new();
      v16 = CoreML::Specification::CoreMLModels::AudioFeaturePrint_Sound::AudioFeaturePrint_Sound((CoreML::Specification::CoreMLModels::AudioFeaturePrint_Sound *)v15);
      v51 = (uint64_t *)v15;
      if (*((_DWORD *)v12 + 7) == 20)
      {
        v17 = (uint64_t *)v12[2];
      }
      else
      {
        CoreML::Specification::CoreMLModels::protobuf_AudioFeaturePrint_2eproto::InitDefaults(v16);
        v17 = &CoreML::Specification::CoreMLModels::_AudioFeaturePrint_Sound_default_instance_;
      }
      v18 = v17[1];
      if ((v18 & 1) != 0)
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom((uint64_t *)(v15 + 8), v18 & 0xFFFFFFFFFFFFFFFELL);
      v19 = *((_DWORD *)v17 + 4);
      if (v19)
        *(_DWORD *)(v15 + 16) = v19;
      if (v53)
      {
        if (v53 != 20)
        {
          v28 = 0;
LABEL_38:
          v13 = -[MLAppleAudioFeatureExtractor initWithParameters:modelDescription:configuration:error:]([MLAppleAudioFeatureExtractor alloc], "initWithParameters:modelDescription:configuration:error:", v28, v9, v7, a5);
          goto LABEL_55;
        }
        objc_msgSend(v9, "inputDescriptionsByName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count") == 1)
        {
          objc_msgSend(v9, "inputDescriptionsByName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "allValues");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "type") == 5;

          if (v24)
          {
            if (v53 == 20)
            {
              v26 = v51;
            }
            else
            {
              CoreML::Specification::CoreMLModels::protobuf_AudioFeaturePrint_2eproto::InitDefaults(v25);
              v26 = &CoreML::Specification::CoreMLModels::_AudioFeaturePrint_Sound_default_instance_;
            }
            v29 = *((int *)v26 + 4);
            objc_msgSend(v9, "outputDescriptionsByName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v30, "count") == 1)
            {
              objc_msgSend(v9, "outputDescriptionsByName");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "allValues");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "type") == 5;

              if (v34)
              {
                objc_msgSend(v9, "outputDescriptionsByName");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "allValues");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
                v48 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v48, "multiArrayConstraint");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v37;
                if (v37)
                {
                  objc_msgSend(v37, "shape");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v39, "count"))
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 512);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v56[0] = v40;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v42 = objc_msgSend(v38, "isAllowedShape:error:", v41, 0);

                    if ((v42 & 1) == 0)
                    {
                      if (a5)
                      {
                        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Must allow %lu-element vector as output"), 512);
                        *a5 = (id)objc_claimAutoreleasedReturnValue();
                      }

                      goto LABEL_54;
                    }
                  }
                  else
                  {

                  }
                }
                v47 = -[MLAppleAudioFeatureExtractorSoundPrintParameters initSoundPrintParameters:]([MLAppleAudioFeatureExtractorSoundPrintParameters alloc], "initSoundPrintParameters:", v29);
                v28 = -[MLAppleAudioFeatureExtractorParameters initWithSoundPrintParameters:]([MLAppleAudioFeatureExtractorParameters alloc], "initWithSoundPrintParameters:", v47);

                goto LABEL_38;
              }
            }
            else
            {

            }
            if (a5)
            {
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Must only have one output multiarray feature"));
              v27 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_36;
            }
LABEL_54:
            v28 = 0;
            v13 = 0;
            goto LABEL_55;
          }
        }
        else
        {

        }
        if (!a5)
          goto LABEL_54;
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Must only have one input multiarray feature"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_34:
        if (!a5)
          goto LABEL_54;
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Audio feature print type not set"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_36:
      v28 = 0;
      v13 = 0;
      *a5 = v27;
LABEL_55:

      CoreML::Specification::CoreMLModels::AudioFeaturePrint::~AudioFeaturePrint((CoreML::Specification::CoreMLModels::AudioFeaturePrint *)&v49);
      goto LABEL_56;
    }
    if (a5)
      goto LABEL_15;
LABEL_16:
    v13 = 0;
    goto LABEL_56;
  }
  if (!a5)
    goto LABEL_16;
LABEL_15:
  +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Audio feature print not available on this OS version"));
  v13 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

  v43 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      v45 = __ldaxr(p_shared_owners);
    while (__stlxr(v45 - 1, p_shared_owners));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
LABEL_61:

  return v13;
}

@end
