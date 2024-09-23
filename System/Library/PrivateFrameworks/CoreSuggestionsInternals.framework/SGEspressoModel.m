@implementation SGEspressoModel

+ (id)modelWithConfigPath:(id)a3 binPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v6);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PREDICTION_PARAMETERS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SUB_MODEL_KEY_STRING"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), v7, v11);
    objc_msgSend(MEMORY[0x1E0D81048], "classifierWithEspressoModelFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v30 = v7;
      v32 = v11;
      v14 = objc_alloc(MEMORY[0x1E0D81058]);
      v15 = (void *)objc_msgSend(v14, "initWithClassNameKey:", *MEMORY[0x1E0D810A0]);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MODEL_FEATURIZER"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C9AA60];
      v18 = MEMORY[0x1E0C9AA70];
      v31 = v15;
      objc_msgSend(v15, "readObjectWithPlist:chunks:context:", v16, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_alloc(MEMORY[0x1E0D81060]);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MODEL_SOURCE_SESSION_DESCRIPTOR"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithPlist:chunks:context:", v21, v17, v18);

      if (v22)
      {
        objc_msgSend(v22, "locale");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19ED8]), "initWithSessionDescriptor:modelClass:", v22, objc_opt_class());
        v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModel:locale:featurizer:modelSource:", v13, v23, v19, v24);

LABEL_17:
        v11 = v32;
        v7 = v30;
        goto LABEL_18;
      }
      sgLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v6;
        _os_log_fault_impl(&dword_1C3607000, v28, OS_LOG_TYPE_FAULT, "SGEspressoModel - Invalid sessionDescriptor in config: %@", buf, 0xCu);
      }

      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        v25 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      sgLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v12;
        _os_log_fault_impl(&dword_1C3607000, v27, OS_LOG_TYPE_FAULT, "SGEspressoModel - Could not initialize PMLMultiLabelEspressoClassifier: %@", buf, 0xCu);
      }

      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        v25 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_20:
    abort();
  }
  sgLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_log_fault_impl(&dword_1C3607000, v26, OS_LOG_TYPE_FAULT, "SGEspressoModel - Invalid model config: %@", buf, 0xCu);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    goto LABEL_20;
  v25 = 0;
LABEL_19:

  return v25;
}

@end
