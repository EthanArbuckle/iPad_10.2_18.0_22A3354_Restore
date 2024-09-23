@implementation CSEnhancedEndpointer

- (CSEnhancedEndpointer)initWithModelFile:(id)a3 defaultThresholdPartial:(float)a4 defaultThresholdRC:(float)a5 relaxedThresholdPartial:(float)a6 relaxedThresholdRC:(float)a7 extraDelayMs:(int)a8 continuityWindowDuration:(int)a9 speechDetectedThreshold:(float)a10
{
  id v18;
  CSEnhancedEndpointer *v19;
  CSEnhancedEndpointer *v20;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  MLModel *endpointerModel;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  _TtP20CoreSpeechFoundation31CSEnhancedEndpointerInputVector_ *inputVector;
  int v37;
  void *v38;
  void *v39;
  CSEnhancedEndpointer *v40;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  id v47;
  objc_super v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CSEnhancedEndpointer;
  v19 = -[CSEnhancedEndpointer init](&v48, sel_init);
  v20 = v19;
  if (!v19)
    goto LABEL_15;
  v19->_defaultThresholdPartial = a4;
  v19->_defaultThresholdRC = a5;
  v19->_relaxedThresholdPartial = a6;
  v19->_relaxedThresholdRC = a7;
  v19->_extraDelayMs = a8;
  v19->_continuityWindowDuration = a9;
  v19->_speechDetectedThreshold = a10;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&v19->_delayedTargetTimeDefault = _Q0;
  v19->_continuityEndTargetTime = -1.0;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x1E0C9E960]);
  objc_msgSend(v27, "setComputeUnits:", 0);
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0C9E938], "modelWithContentsOfURL:configuration:error:", v26, v27, &v47);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v47;
  endpointerModel = v20->_endpointerModel;
  v20->_endpointerModel = (MLModel *)v28;

  if (v20->_endpointerModel)
  {
    -[CSEnhancedEndpointer _extractModelSpecs](v20, "_extractModelSpecs");
    -[NSDictionary objectForKeyedSubscript:](v20->_inputSpecs, "objectForKeyedSubscript:", CFSTR("x_1"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "multiArrayConstraint");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "shape");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v29;
    +[CSEnhancedEndpointerInputVectorFactory inputVectorWithShape:dataType:error:](_TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorFactory, "inputVectorWithShape:dataType:error:", v33, objc_msgSend(v32, "dataType"), &v46);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v46;

    inputVector = v20->_inputVector;
    v20->_inputVector = (_TtP20CoreSpeechFoundation31CSEnhancedEndpointerInputVector_ *)v34;

    if (!v20->_inputVector || v35)
    {
      v39 = (void *)CSLogCategoryEP;
      if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
      {
        v44 = v39;
        objc_msgSend(v35, "localizedDescription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v50 = "-[CSEnhancedEndpointer initWithModelFile:defaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartia"
              "l:relaxedThresholdRC:extraDelayMs:continuityWindowDuration:speechDetectedThreshold:]";
        v51 = 2112;
        v52 = v45;
        _os_log_error_impl(&dword_1B502E000, v44, OS_LOG_TYPE_ERROR, "%s Unable to create input vector. Error: %@", buf, 0x16u);

      }
      v37 = 1;
    }
    else
    {
      v37 = 0;
    }

  }
  else
  {
    v38 = (void *)CSLogCategoryEP;
    if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      v42 = v38;
      objc_msgSend(v29, "localizedDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v50 = "-[CSEnhancedEndpointer initWithModelFile:defaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartial:"
            "relaxedThresholdRC:extraDelayMs:continuityWindowDuration:speechDetectedThreshold:]";
      v51 = 2114;
      v52 = v43;
      _os_log_error_impl(&dword_1B502E000, v42, OS_LOG_TYPE_ERROR, "%s Unable to create MLModel with err %{public}@", buf, 0x16u);

    }
    v37 = 1;
    v35 = v29;
  }

  if (v37)
    v40 = 0;
  else
LABEL_15:
    v40 = v20;

  return v40;
}

- (void)_extractModelSpecs
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *inputSpecs;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *outputNodes;
  id v10;

  -[MLModel modelDescription](self->_endpointerModel, "modelDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDescriptionsByName");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  inputSpecs = self->_inputSpecs;
  self->_inputSpecs = v4;

  -[MLModel modelDescription](self->_endpointerModel, "modelDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputDescriptionsByName");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSArray *)objc_msgSend(v7, "copy");
  outputNodes = self->_outputNodes;
  self->_outputNodes = v8;

}

- (void)didEndpointWithFeatures:(id)a3 audioTimestampMs:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  id v15;
  MLModel *endpointerModel;
  void *v17;
  double delayedTargetTimeDefault;
  double delayedTargetTimeRelaxed;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  double continuityEndTargetTime;
  NSArray *outputNodes;
  void *v26;
  void *v27;
  NSObject *log;
  _QWORD v29[4];
  id v30;
  CSEnhancedEndpointer *v31;
  uint64_t *v32;
  double v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  CSEnhancedEndpointerResult *v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __76__CSEnhancedEndpointer_didEndpointWithFeatures_audioTimestampMs_completion___block_invoke;
  v42[3] = &unk_1E687E2C0;
  v11 = v9;
  v43 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E468D0](v42);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = objc_alloc_init(CSEnhancedEndpointerResult);
  if (!v8)
    goto LABEL_4;
  objc_msgSend((id)v37[5], "setEndpointerType:", -[CSEnhancedEndpointerInputVector endpointerType](self->_inputVector, "endpointerType"));
  if (!-[CSEnhancedEndpointer _shouldForceEndpoint:](self, "_shouldForceEndpoint:", v8))
  {
    -[CSEnhancedEndpointer _constructFeatureDictionary:](self, "_constructFeatureDictionary:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E900]), "initWithDictionary:error:", v13, &v35);
    v15 = v35;
    if (v15 || !v14)
    {
      v22 = (id)CSLogCategoryEP;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v45 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
        v46 = 2114;
        v47 = v26;
        v48 = 2114;
        v49 = v13;
        _os_log_error_impl(&dword_1B502E000, v22, OS_LOG_TYPE_ERROR, "%s Unable to create feature dict with error %{public}@ from %{public}@", buf, 0x20u);

      }
      v12[2](v12, v37[5]);
      goto LABEL_35;
    }
    endpointerModel = self->_endpointerModel;
    v34 = 0;
    -[MLModel predictionFromFeatures:error:](endpointerModel, "predictionFromFeatures:error:", v14, &v34);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v34;
    if (v15 || !v17)
    {
      v23 = (id)CSLogCategoryEP;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "localizedDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v45 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
        v46 = 2114;
        v47 = v27;
        v48 = 2114;
        v49 = v14;
        _os_log_error_impl(&dword_1B502E000, v23, OS_LOG_TYPE_ERROR, "%s Unable to create get prediction from model with error %{public}@ from %{public}@", buf, 0x20u);

      }
      goto LABEL_33;
    }
    if (self->_delayedTrigger)
      objc_msgSend((id)v37[5], "setExtraDelayMs:", self->_extraDelayMs);
    delayedTargetTimeDefault = self->_delayedTargetTimeDefault;
    if (delayedTargetTimeDefault > 0.0 && delayedTargetTimeDefault <= a4 && !self->_hasHadDelayedDefaultResult)
    {
      log = CSLogCategoryEP;
      if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
        _os_log_impl(&dword_1B502E000, log, OS_LOG_TYPE_DEFAULT, "%s Reached delayed trigger target time for default endpointer", buf, 0xCu);
      }
      self->_hasHadDelayedDefaultResult = 1;
      objc_msgSend((id)v37[5], "setDidDefaultEndpointerFire:", 1, log);
    }
    delayedTargetTimeRelaxed = self->_delayedTargetTimeRelaxed;
    if (delayedTargetTimeRelaxed <= 0.0 || delayedTargetTimeRelaxed > a4)
    {
      continuityEndTargetTime = self->_continuityEndTargetTime;
      if (continuityEndTargetTime <= 0.0 || continuityEndTargetTime > a4)
      {
        outputNodes = self->_outputNodes;
        v29[0] = v10;
        v29[1] = 3221225472;
        v29[2] = __76__CSEnhancedEndpointer_didEndpointWithFeatures_audioTimestampMs_completion___block_invoke_135;
        v29[3] = &unk_1E687E2E8;
        v31 = self;
        v32 = &v36;
        v30 = v17;
        v33 = a4;
        -[NSArray enumerateObjectsUsingBlock:](outputNodes, "enumerateObjectsUsingBlock:", v29);
        v12[2](v12, v37[5]);

        goto LABEL_34;
      }
      v20 = CSLogCategoryEP;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      *(_DWORD *)buf = 136315138;
      v45 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
      v21 = "%s Reached continuity window end time - force endpointing";
    }
    else
    {
      v20 = CSLogCategoryEP;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:
        objc_msgSend((id)v37[5], "setDidRelaxedEndpointerFire:", 1);
LABEL_33:
        v12[2](v12, v37[5]);
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      *(_DWORD *)buf = 136315138;
      v45 = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]";
      v21 = "%s Reached delayed trigger target time for relaxed endpointer - force endpointing";
    }
    _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    goto LABEL_32;
  }
  objc_msgSend((id)v37[5], "setDidDefaultEndpointerFire:", 1);
  objc_msgSend((id)v37[5], "setDidRelaxedEndpointerFire:", 1);
  objc_msgSend((id)v37[5], "setDidForceEndpoint:", 1);
LABEL_4:
  v12[2](v12, v37[5]);
LABEL_36:
  _Block_object_dispose(&v36, 8);

}

- (BOOL)_didRelaxedEndpointerFireWithPartialScore:(float)a3 rcScore:(float)a4
{
  return self->_relaxedThresholdPartial <= a3 || self->_relaxedThresholdRC <= a4;
}

- (BOOL)_didDefaultEndpointerFireWithPartialScore:(float)a3 rcScore:(float)a4
{
  return self->_defaultThresholdPartial <= a3 || self->_defaultThresholdRC <= a4;
}

- (BOOL)_didDetectSpeechWithPartialScore:(float)a3
{
  return self->_speechDetectedThreshold > a3;
}

- (id)_constructFeatureDictionary:(id)a3
{
  void *v4;
  void *v5;
  NSDictionary *inputSpecs;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  void *v14;

  -[CSEnhancedEndpointerInputVector multiArrayWithContext:](self->_inputVector, "multiArrayWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  inputSpecs = self->_inputSpecs;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__CSEnhancedEndpointer__constructFeatureDictionary___block_invoke;
  v12[3] = &unk_1E6880998;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inputSpecs, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (BOOL)_shouldForceEndpoint:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  float v7;
  BOOL v8;
  void *v9;
  float v10;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "trailingSilenceDuration") >= 5000)
  {
    v4 = (void *)CSLogCategoryEP;
    if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v12 = 136315394;
      v13 = "-[CSEnhancedEndpointer _shouldForceEndpoint:]";
      v14 = 2048;
      v15 = COERCE_DOUBLE(objc_msgSend(v3, "trailingSilenceDuration"));
      v6 = "%s Force endpointing based on trailingSilenceDuration: %ld";
LABEL_8:
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v12, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(v3, "silencePosteriorNF");
  if (v7 >= 5000.0)
  {
    v9 = (void *)CSLogCategoryEP;
    if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v9;
      objc_msgSend(v3, "silencePosteriorNF");
      v12 = 136315394;
      v13 = "-[CSEnhancedEndpointer _shouldForceEndpoint:]";
      v14 = 2048;
      v15 = v10;
      v6 = "%s Force endpointing based on silencePosteriorNF: %f";
      goto LABEL_8;
    }
LABEL_9:
    v8 = 1;
    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (void)updateDelayedTriggerSwitch:(BOOL)a3
{
  self->_delayedTrigger = a3;
}

- (void)updateDefaultThresholdPartial:(float)a3 defaultThresholdRC:(float)a4 relaxedThresholdPartial:(float)a5 relaxedThresholdRC:(float)a6
{
  self->_defaultThresholdPartial = a3;
  self->_defaultThresholdRC = a4;
  self->_relaxedThresholdPartial = a5;
  self->_relaxedThresholdRC = a6;
}

- (id)modelType
{
  return (id)-[CSEnhancedEndpointerInputVector modelName](self->_inputVector, "modelName");
}

- (MLModel)endpointerModel
{
  return self->_endpointerModel;
}

- (void)setEndpointerModel:(id)a3
{
  objc_storeStrong((id *)&self->_endpointerModel, a3);
}

- (NSDictionary)inputSpecs
{
  return self->_inputSpecs;
}

- (void)setInputSpecs:(id)a3
{
  objc_storeStrong((id *)&self->_inputSpecs, a3);
}

- (NSArray)outputNodes
{
  return self->_outputNodes;
}

- (void)setOutputNodes:(id)a3
{
  objc_storeStrong((id *)&self->_outputNodes, a3);
}

- (float)defaultThresholdPartial
{
  return self->_defaultThresholdPartial;
}

- (void)setDefaultThresholdPartial:(float)a3
{
  self->_defaultThresholdPartial = a3;
}

- (float)defaultThresholdRC
{
  return self->_defaultThresholdRC;
}

- (void)setDefaultThresholdRC:(float)a3
{
  self->_defaultThresholdRC = a3;
}

- (float)relaxedThresholdPartial
{
  return self->_relaxedThresholdPartial;
}

- (void)setRelaxedThresholdPartial:(float)a3
{
  self->_relaxedThresholdPartial = a3;
}

- (float)relaxedThresholdRC
{
  return self->_relaxedThresholdRC;
}

- (void)setRelaxedThresholdRC:(float)a3
{
  self->_relaxedThresholdRC = a3;
}

- (int)extraDelayMs
{
  return self->_extraDelayMs;
}

- (void)setExtraDelayMs:(int)a3
{
  self->_extraDelayMs = a3;
}

- (int)continuityWindowDuration
{
  return self->_continuityWindowDuration;
}

- (void)setContinuityWindowDuration:(int)a3
{
  self->_continuityWindowDuration = a3;
}

- (float)speechDetectedThreshold
{
  return self->_speechDetectedThreshold;
}

- (void)setSpeechDetectedThreshold:(float)a3
{
  self->_speechDetectedThreshold = a3;
}

- (BOOL)delayedTrigger
{
  return self->_delayedTrigger;
}

- (void)setDelayedTrigger:(BOOL)a3
{
  self->_delayedTrigger = a3;
}

- (double)delayedTargetTimeDefault
{
  return self->_delayedTargetTimeDefault;
}

- (void)setDelayedTargetTimeDefault:(double)a3
{
  self->_delayedTargetTimeDefault = a3;
}

- (double)delayedTargetTimeRelaxed
{
  return self->_delayedTargetTimeRelaxed;
}

- (void)setDelayedTargetTimeRelaxed:(double)a3
{
  self->_delayedTargetTimeRelaxed = a3;
}

- (BOOL)hasHadDelayedDefaultResult
{
  return self->_hasHadDelayedDefaultResult;
}

- (void)setHasHadDelayedDefaultResult:(BOOL)a3
{
  self->_hasHadDelayedDefaultResult = a3;
}

- (_TtP20CoreSpeechFoundation31CSEnhancedEndpointerInputVector_)inputVector
{
  return self->_inputVector;
}

- (void)setInputVector:(id)a3
{
  objc_storeStrong((id *)&self->_inputVector, a3);
}

- (double)continuityEndTargetTime
{
  return self->_continuityEndTargetTime;
}

- (void)setContinuityEndTargetTime:(double)a3
{
  self->_continuityEndTargetTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputVector, 0);
  objc_storeStrong((id *)&self->_outputNodes, 0);
  objc_storeStrong((id *)&self->_inputSpecs, 0);
  objc_storeStrong((id *)&self->_endpointerModel, 0);
}

void __52__CSEnhancedEndpointer__constructFeatureDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("x_1")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), v6);
  }
  else
  {
    v7 = CSLogCategoryEP;
    if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[CSEnhancedEndpointer _constructFeatureDictionary:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Unexpected key in model input specifications", (uint8_t *)&v8, 0xCu);
    }
    *a4 = 1;
  }

}

uint64_t __76__CSEnhancedEndpointer_didEndpointWithFeatures_audioTimestampMs_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __76__CSEnhancedEndpointer_didEndpointWithFeatures_audioTimestampMs_completion___block_invoke_135(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  int v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  void *v38;
  _BYTE v39[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "featureValueForName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "multiArrayValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("var_127"));
  if (v10)
  {
    objc_msgSend(v9, "convert1dMLMultiArrayToNSArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") != 2)
    {
      v28 = CSLogCategoryEP;
      if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v39 = 136315138;
        *(_QWORD *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
        _os_log_error_impl(&dword_1B502E000, v28, OS_LOG_TYPE_ERROR, "%s Model output had unexpected size", v39, 0xCu);
      }
      *a4 = 1;
      goto LABEL_35;
    }
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    objc_msgSend(v11, "objectAtIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;

    *(float *)&v18 = v14;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPartialScore:", v18);
    LODWORD(v19) = v17;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRcScore:", v19);
    *(float *)&v20 = v14;
    LODWORD(v21) = v17;
    if (objc_msgSend(*(id *)(a1 + 40), "_didRelaxedEndpointerFireWithPartialScore:rcScore:", v20, v21))
    {
      v24 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v24 + 8))
      {
        v22 = *(double *)(v24 + 72);
        if (v22 < 0.0)
        {
          *(double *)(v24 + 72) = *(double *)(a1 + 56) + (double)*(int *)(v24 + 28);
          v25 = CSLogCategoryEP;
          if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
          {
            v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
            *(_DWORD *)v39 = 136315394;
            *(_QWORD *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
            *(_WORD *)&v39[12] = 2048;
            *(_QWORD *)&v39[14] = v26;
            _os_log_impl(&dword_1B502E000, v25, OS_LOG_TYPE_DEFAULT, "%s Using delayed trigger logic for relaxed endpointer - target time: %f", v39, 0x16u);
          }
        }
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDidRelaxedEndpointerFire:", 1);
      }
    }
    *(float *)&v22 = v14;
    LODWORD(v23) = v17;
    if (objc_msgSend(*(id *)(a1 + 40), "_didDefaultEndpointerFireWithPartialScore:rcScore:", v22, v23))
    {
      v30 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v30 + 8) && !*(_BYTE *)(v30 + 9))
      {
        v29 = *(double *)(v30 + 64);
        if (v29 >= 0.0)
          goto LABEL_27;
        *(double *)(v30 + 64) = *(double *)(a1 + 56) + (double)*(int *)(v30 + 28);
        v32 = CSLogCategoryEP;
        if (!os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
        *(_DWORD *)v39 = 136315394;
        *(_QWORD *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
        *(_WORD *)&v39[12] = 2048;
        *(_QWORD *)&v39[14] = v35;
        v34 = "%s Using delayed trigger logic for default endpointer - target time: %f";
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDidDefaultEndpointerFire:", 1);
        v31 = *(_QWORD *)(a1 + 40);
        v29 = *(double *)(v31 + 88);
        if (v29 >= 0.0)
          goto LABEL_27;
        if (*(int *)(v31 + 32) < 1)
          goto LABEL_27;
        if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "didRelaxedEndpointerFire") & 1) != 0)
          goto LABEL_27;
        *(double *)(*(_QWORD *)(a1 + 40) + 88) = *(double *)(a1 + 56) + (double)*(int *)(*(_QWORD *)(a1 + 40) + 32);
        v32 = CSLogCategoryEP;
        if (!os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        v33 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
        *(_DWORD *)v39 = 136315394;
        *(_QWORD *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
        *(_WORD *)&v39[12] = 2048;
        *(_QWORD *)&v39[14] = v33;
        v34 = "%s Entering continuity window - target time for continuity end: %f";
      }
      _os_log_impl(&dword_1B502E000, v32, OS_LOG_TYPE_DEFAULT, v34, v39, 0x16u);
    }
LABEL_27:
    *(float *)&v29 = v14;
    if (objc_msgSend(*(id *)(a1 + 40), "_didDetectSpeechWithPartialScore:", v29, *(_OWORD *)v39, *(_QWORD *)&v39[16], v40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSpeechArrivalDetected:", 1);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) = 0xBFF0000000000000;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "didEndpointerFire"))
    {
      v37 = *(_QWORD *)(a1 + 40);
      if (v14 >= *(float *)(v37 + 12) || v14 >= *(float *)(v37 + 20))
      {
        v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(float *)&v36 = v14;
      }
      else
      {
        v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        LODWORD(v36) = v17;
      }
      objc_msgSend(v38, "setEndpointPosterior:", v36);
    }
LABEL_35:

    goto LABEL_36;
  }
  v27 = CSLogCategoryEP;
  if (os_log_type_enabled((os_log_t)CSLogCategoryEP, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v39 = 136315394;
    *(_QWORD *)&v39[4] = "-[CSEnhancedEndpointer didEndpointWithFeatures:audioTimestampMs:completion:]_block_invoke";
    *(_WORD *)&v39[12] = 2112;
    *(_QWORD *)&v39[14] = CFSTR("var_127");
    _os_log_error_impl(&dword_1B502E000, v27, OS_LOG_TYPE_ERROR, "%s Model had unexpected output vector name - should be %@", v39, 0x16u);
  }
  *a4 = 1;
LABEL_36:

}

@end
