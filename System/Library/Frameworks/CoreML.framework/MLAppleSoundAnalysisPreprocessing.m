@implementation MLAppleSoundAnalysisPreprocessing

- (MLAppleSoundAnalysisPreprocessing)initWithDescription:(id)a3 configuration:(id)a4 error:(id *)p_isa
{
  id v8;
  id v9;
  MLAppleSoundAnalysisPreprocessing *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *inputFeatureName;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *outputFeatureName;
  MLCustomModel *v19;
  MLCustomModel *frontendProcessingModel;
  id v21;
  uint64_t v22;
  MLCustomModel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((-[objc_class conformsToProtocol:](NSClassFromString(CFSTR("_SNVGGishFrontEndProcessingCustomModel")), "conformsToProtocol:", &unk_1EE435650) & 1) != 0)
  {
    v29.receiver = self;
    v29.super_class = (Class)MLAppleSoundAnalysisPreprocessing;
    v10 = -[MLModel initWithDescription:configuration:](&v29, sel_initWithDescription_configuration_, v8, v9);
    if (!v10)
    {
LABEL_5:
      self = v10;
      p_isa = (id *)&self->super.super.isa;
      goto LABEL_11;
    }
    objc_msgSend(v8, "inputDescriptionsByName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = objc_claimAutoreleasedReturnValue();
    inputFeatureName = v10->_inputFeatureName;
    v10->_inputFeatureName = (NSString *)v13;

    objc_msgSend(v8, "outputDescriptionsByName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = objc_claimAutoreleasedReturnValue();
    outputFeatureName = v10->_outputFeatureName;
    v10->_outputFeatureName = (NSString *)v17;

    v19 = (MLCustomModel *)objc_alloc(NSClassFromString(CFSTR("_SNVGGishFrontEndProcessingCustomModel")));
    frontendProcessingModel = v10->_frontendProcessingModel;
    v10->_frontendProcessingModel = v19;

    v21 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v22 = -[MLCustomModel initWithModelDescription:parameterDictionary:error:](v10->_frontendProcessingModel, "initWithModelDescription:parameterDictionary:error:", v8, v21, p_isa);
    v23 = v10->_frontendProcessingModel;
    v10->_frontendProcessingModel = (MLCustomModel *)v22;

    if (v10->_frontendProcessingModel)
    {

      goto LABEL_5;
    }
    if (p_isa)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      v31 = CFSTR("Sound analysis preprocessing failed to init");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v27);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

    }
    p_isa = 0;
    self = v10;
  }
  else if (p_isa)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR("Sound analysis preprocessing does not conform to custom model protocol");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v25);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
  }
LABEL_11:

  return (MLAppleSoundAnalysisPreprocessing *)p_isa;
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
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v17, v10, 5, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = -[MLModel signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__MLAppleSoundAnalysisPreprocessing_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!v9)
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MLCustomModel predictionFromFeatures:options:error:](self->_frontendProcessingModel, "predictionFromFeatures:options:error:", v8, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v17);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontendProcessingModel, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
}

uint64_t __74__MLAppleSoundAnalysisPreprocessing_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  CoreML::Specification::CoreMLModels::protobuf_SoundAnalysisPreprocessing_2eproto *v10;
  uint64_t *v11;
  MLAppleSoundAnalysisPreprocessing *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  CoreML::Specification::CoreMLModels::protobuf_SoundAnalysisPreprocessing_2eproto *v17;
  uint64_t *v18;
  uint64_t v19;
  void (**v21)(CoreML::Specification::CoreMLModels::SoundAnalysisPreprocessing *__hidden);
  uint64_t v22[2];
  int v23;
  int v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2003)
  {
    v8 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
    +[_MLSNFrameworkHandle sharedHandle](_MLSNFrameworkHandle, "sharedHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = NSClassFromString(CFSTR("_SNVGGishFrontEndProcessingCustomModel"));
      if (v10)
      {
        if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 2003)
        {
          v11 = *(uint64_t **)(*(_QWORD *)a3 + 32);
        }
        else
        {
          CoreML::Specification::CoreMLModels::protobuf_SoundAnalysisPreprocessing_2eproto::InitDefaults(v10);
          v11 = &CoreML::Specification::CoreMLModels::_SoundAnalysisPreprocessing_default_instance_;
        }
        v21 = &off_1E3D4D8B8;
        v22[0] = 0;
        v23 = 0;
        v15 = v11[1];
        if ((v15 & 1) != 0)
          google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(v22, v15 & 0xFFFFFFFFFFFFFFFELL);
        v24 = 0;
        if (*((_DWORD *)v11 + 7) != 20)
          goto LABEL_25;
        v24 = 20;
        v16 = (uint64_t *)operator new();
        v17 = CoreML::Specification::CoreMLModels::SoundAnalysisPreprocessing_Vggish::SoundAnalysisPreprocessing_Vggish((CoreML::Specification::CoreMLModels::SoundAnalysisPreprocessing_Vggish *)v16);
        v22[1] = (uint64_t)v16;
        if (*((_DWORD *)v11 + 7) == 20)
        {
          v18 = (uint64_t *)v11[2];
        }
        else
        {
          CoreML::Specification::CoreMLModels::protobuf_SoundAnalysisPreprocessing_2eproto::InitDefaults(v17);
          v18 = &CoreML::Specification::CoreMLModels::_SoundAnalysisPreprocessing_Vggish_default_instance_;
        }
        v19 = v18[1];
        if ((v19 & 1) != 0)
          google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(v16 + 1, v19 & 0xFFFFFFFFFFFFFFFELL);
        if (v24)
        {
          v12 = -[MLAppleSoundAnalysisPreprocessing initWithDescription:configuration:error:]([MLAppleSoundAnalysisPreprocessing alloc], "initWithDescription:configuration:error:", v8, v7, a5);
        }
        else
        {
LABEL_25:
          if (a5)
          {
            +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Preprocessing type not set"));
            v12 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = 0;
          }
        }
        CoreML::Specification::CoreMLModels::SoundAnalysisPreprocessing::~SoundAnalysisPreprocessing((CoreML::Specification::CoreMLModels::SoundAnalysisPreprocessing *)&v21);
        goto LABEL_29;
      }
      if (a5)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0CB2D50];
        v26[0] = CFSTR("Sound analysis preprocessing not available on this version");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v14);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Sound analysis framework not available on this OS version"));
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    v12 = 0;
    goto LABEL_29;
  }
  if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model type is not a sound analysis preprocessing"));
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_30:

  return v12;
}

@end
