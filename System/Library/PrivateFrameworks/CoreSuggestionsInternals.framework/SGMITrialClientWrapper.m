@implementation SGMITrialClientWrapper

- (SGMITrialClientWrapper)init
{
  SGMITrialClientWrapper *v2;
  uint64_t v3;
  TRIClient *triClient;
  id v5;
  void *v6;
  uint64_t v7;
  _PASLock *lock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SGMITrialClientWrapper;
  v2 = -[SGMITrialClientWrapper init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 109);
    v3 = objc_claimAutoreleasedReturnValue();
    triClient = v2->_triClient;
    v2->_triClient = (TRIClient *)v3;

    v5 = objc_alloc(MEMORY[0x1E0D815F0]);
    v6 = (void *)objc_opt_new();
    v7 = objc_msgSend(v5, "initWithGuardedData:", v6);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v7;

    -[SGMITrialClientWrapper loadFactors](v2, "loadFactors");
  }
  return v2;
}

- (void)refresh
{
  -[TRIClient refresh](self->_triClient, "refresh");
  -[SGMITrialClientWrapper loadFactors](self, "loadFactors");
}

- (id)trialMetadata
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  -[TRIClient experimentIdentifiersWithNamespaceName:](self->_triClient, "experimentIdentifiersWithNamespaceName:", CFSTR("PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  if (v2)
  {
    objc_msgSend(v2, "experimentId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExperimentId:", v4);

    objc_msgSend(v2, "treatmentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTreatmentId:", v5);

    objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v2, "deploymentId"));
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: Trial metadata (experimentId, deploymentId, treatmentId) unavailable. Device is likely not enrolled in experiment.", v8, 2u);
    }

  }
  return v3;
}

- (id)trialMetadataString
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  -[SGMITrialClientWrapper trialMetadata](self, "trialMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasTreatmentId"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v2, "experimentId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "deploymentId");
    objc_msgSend(v2, "treatmentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (__CFString *)objc_msgSend(v3, "initWithFormat:", CFSTR("E=%@ D=%d T=%@"), v4, v5, v6);

  }
  else
  {
    v7 = CFSTR("Device is likely not enrolled in a Trial experiment.");
  }

  return v7;
}

- (id)_loadPlistFromPath:(id)a3 expectedClass:(Class)a4 error:(id *)a5
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0C99D50];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithContentsOfFile:options:error:", v7, 1, a5);

  if (v8)
  {
    if ((unint64_t)objc_msgSend(v8, "length") >= 0x400
      && (objc_msgSend(MEMORY[0x1E0D815D8], "propertyListWithData:error:", v8, 0),
          (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, a5),
          (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v9 = 0;
        *a5 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)loadLevelAsModelPath:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", a3, CFSTR("PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directoryValue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "directoryValue"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasPath"),
        v6,
        v5,
        v7))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "directoryValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@/%@"), v10, CFSTR("model.mlmodelc"));

  }
  else
  {
    sgMailIntelligenceLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "directoryValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: No plist file found at %@", buf, 0xCu);

    }
    v11 = 0;
  }

  return v11;
}

- (id)loadLevelAsBooleanFromFactor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v4, CFSTR("PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "BOOLeanValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: TRILevel is nil for %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)loadLevelAsNumericFromFactor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v4, CFSTR("PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: TRILevel is nil for %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)loadLevelAsLongFromFactor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v4, CFSTR("PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: TRILevel is nil for %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)loadLevelAsStringFromFactor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v4, CFSTR("PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: TRILevel is nil for %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)loadLevelAsStringArrayFromFactor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", a3, CFSTR("PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileValue");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "fileValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPath");

    if (v8)
    {
      objc_msgSend(v4, "fileValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      -[SGMITrialClientWrapper _loadPlistFromPath:expectedClass:error:](self, "_loadPlistFromPath:expectedClass:error:", v10, objc_opt_class(), &v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v23;

      if (v11)
      {
        if (objc_msgSend(v11, "count"))
        {
          v13 = v11;
LABEL_13:

          goto LABEL_14;
        }
        sgMailIntelligenceLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_12:

          v13 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v4, "fileValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        v17 = "SGMITrialClientWrapper: Empty plist content for %@";
        v18 = v14;
        v19 = 12;
      }
      else
      {
        sgMailIntelligenceLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_12;
        objc_msgSend(v4, "fileValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v16;
        v26 = 2112;
        v27 = v12;
        v17 = "SGMITrialClientWrapper: Unable to load plist content for %@: %@";
        v18 = v14;
        v19 = 22;
      }
      _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

      goto LABEL_12;
    }
  }
  sgMailIntelligenceLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "fileValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v22;
    _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: No plist file found at %@", buf, 0xCu);

  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)loadLevelAsNumericArrayFromFactor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", a3, CFSTR("PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileValue");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "fileValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPath");

    if (v8)
    {
      objc_msgSend(v4, "fileValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      -[SGMITrialClientWrapper _loadPlistFromPath:expectedClass:error:](self, "_loadPlistFromPath:expectedClass:error:", v10, objc_opt_class(), &v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v23;

      if (v11)
      {
        if (objc_msgSend(v11, "count"))
        {
          v13 = v11;
LABEL_13:

          goto LABEL_14;
        }
        sgMailIntelligenceLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_12:

          v13 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v4, "fileValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        v17 = "SGMITrialClientWrapper: Empty plist content for %@";
        v18 = v14;
        v19 = 12;
      }
      else
      {
        sgMailIntelligenceLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_12;
        objc_msgSend(v4, "fileValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v16;
        v26 = 2112;
        v27 = v12;
        v17 = "SGMITrialClientWrapper: Unable to load plist content for %@: %@";
        v18 = v14;
        v19 = 22;
      }
      _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

      goto LABEL_12;
    }
  }
  sgMailIntelligenceLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "fileValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v22;
    _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: No plist file found at %@", buf, 0xCu);

  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)loadLevelAsNumericDictionaryFromFactor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", a3, CFSTR("PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileValue");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "fileValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPath");

    if (v8)
    {
      objc_msgSend(v4, "fileValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      -[SGMITrialClientWrapper _loadPlistFromPath:expectedClass:error:](self, "_loadPlistFromPath:expectedClass:error:", v10, objc_opt_class(), &v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v23;

      if (v11)
      {
        if (objc_msgSend(v11, "count"))
        {
          v13 = v11;
LABEL_13:

          goto LABEL_14;
        }
        sgMailIntelligenceLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_12:

          v13 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v4, "fileValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        v17 = "SGMITrialClientWrapper: Empty plist content for %@";
        v18 = v14;
        v19 = 12;
      }
      else
      {
        sgMailIntelligenceLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_12;
        objc_msgSend(v4, "fileValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v16;
        v26 = 2112;
        v27 = v12;
        v17 = "SGMITrialClientWrapper: Unable to load plist content for %@: %@";
        v18 = v14;
        v19 = 22;
      }
      _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

      goto LABEL_12;
    }
  }
  sgMailIntelligenceLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "fileValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v22;
    _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: No plist file found at %@", buf, 0xCu);

  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)concatPathWithPrefix:(id)a3 suffix:(id)a4 extra:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  if (v7)
    v12 = objc_msgSend(v11, "initWithFormat:", CFSTR("%@/%@/%@"), v10, v9, v7);
  else
    v12 = objc_msgSend(v11, "initWithFormat:", CFSTR("%@/%@"), v10, v9, v15);
  v13 = (void *)v12;

  return v13;
}

- (id)arrayFromPathWithPrefix:(id)a3 suffix:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v8;

  -[SGMITrialClientWrapper concatPathWithPrefix:suffix:extra:](self, "concatPathWithPrefix:suffix:extra:", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  -[SGMITrialClientWrapper _loadPlistFromPath:expectedClass:error:](self, "_loadPlistFromPath:expectedClass:error:", v5, objc_opt_class(), &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryFromPathWithPrefix:(id)a3 suffix:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v8;

  -[SGMITrialClientWrapper concatPathWithPrefix:suffix:extra:](self, "concatPathWithPrefix:suffix:extra:", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  -[SGMITrialClientWrapper _loadPlistFromPath:expectedClass:error:](self, "_loadPlistFromPath:expectedClass:error:", v5, objc_opt_class(), &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadFactors
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__SGMITrialClientWrapper_loadFactors__block_invoke;
  v3[3] = &unk_1E7DB7058;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (id)isEnabled
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SGMITrialClientWrapper_isEnabled__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: isEnabled accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)isDNUOnlyEnablement
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SGMITrialClientWrapper_isDNUOnlyEnablement__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: isDNUOnlyEnablement accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)signatureStatsLogging
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SGMITrialClientWrapper_signatureStatsLogging__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: signatureStatsLogging accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)modelGroundTruthVersion
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__SGMITrialClientWrapper_modelGroundTruthVersion__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthVersion accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)modelInferenceVersion
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SGMITrialClientWrapper_modelInferenceVersion__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelInferenceVersion accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)modelPath
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SGMITrialClientWrapper_modelPath__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelPath accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)modelFeatureNames
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SGMITrialClientWrapper_modelFeatureNames__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelFeatureNames accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)modelFeatureStandardizationMeans
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SGMITrialClientWrapper_modelFeatureStandardizationMeans__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelFeatureStandardizationMeans accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)modelFeatureStandardizationStandardDeviations
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__SGMITrialClientWrapper_modelFeatureStandardizationStandardDeviations__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelFeatureStandardizationStandardDeviation accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)modelGroundTruthFeatureNames
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SGMITrialClientWrapper_modelGroundTruthFeatureNames__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthFeatureNames accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)modelGroundTruthFeatureLowerBounds
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SGMITrialClientWrapper_modelGroundTruthFeatureLowerBounds__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthFeatureLowerBounds accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)modelGroundTruthFeatureUpperBounds
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SGMITrialClientWrapper_modelGroundTruthFeatureUpperBounds__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthFeatureUpperBounds accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)modelGroundTruthOutputs
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SGMITrialClientWrapper_modelGroundTruthOutputs__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthOutputs accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)saliencyOverrideFeatureNames
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SGMITrialClientWrapper_saliencyOverrideFeatureNames__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: saliencyOverrideFeatureNames accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)saliencyOverrideFeatureLowerBounds
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SGMITrialClientWrapper_saliencyOverrideFeatureLowerBounds__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: saliencyOverrideFeatureLowerBounds accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)saliencyOverrideFeatureUpperBounds
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SGMITrialClientWrapper_saliencyOverrideFeatureUpperBounds__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: saliencyOverrideFeatureUpperBounds accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)saliencyOverrideOutputs
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SGMITrialClientWrapper_saliencyOverrideOutputs__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: saliencyOverrideOutputs accessed: size %lu, first element %@", buf, 0x16u);

  }
  return v3;
}

- (id)classificationThreshold
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__SGMITrialClientWrapper_classificationThreshold__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: classificationThreshold accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)classificationOfflinePrecision
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SGMITrialClientWrapper_classificationOfflinePrecision__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: classificationOfflinePrecision accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)classificationOfflineRecall
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SGMITrialClientWrapper_classificationOfflineRecall__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: classificationOfflineRecall accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)attachmentDetectionRegexes
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33489;
  v12 = __Block_byref_object_dispose__33490;
  v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SGMITrialClientWrapper_attachmentDetectionRegexes__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: attachmentDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);

  }
  return v3;
}

- (id)attachmentLinkDetection
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  _QWORD v7[5];
  __int128 buf;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33489;
  v11 = __Block_byref_object_dispose__33490;
  v12 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SGMITrialClientWrapper_attachmentLinkDetection__block_invoke;
  v7[3] = &unk_1E7DB7080;
  v7[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: attachmentLinkDetection accessed with %lu entries.", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)conservativeRecipientDetection
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SGMITrialClientWrapper_conservativeRecipientDetection__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: conservativeRecipientDetection accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)recipientConservativeDetectionRegexes
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33489;
  v12 = __Block_byref_object_dispose__33490;
  v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SGMITrialClientWrapper_recipientConservativeDetectionRegexes__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: recipientConservativeDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);

  }
  return v3;
}

- (id)recipientDetectionRegexes
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33489;
  v12 = __Block_byref_object_dispose__33490;
  v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SGMITrialClientWrapper_recipientDetectionRegexes__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: recipientDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);

  }
  return v3;
}

- (id)nicknameDetectionRegexes
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33489;
  v12 = __Block_byref_object_dispose__33490;
  v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SGMITrialClientWrapper_nicknameDetectionRegexes__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: nicknameDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);

  }
  return v3;
}

- (id)followUpOnOutgoingMailsQuestionsDetectionRegexes
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33489;
  v12 = __Block_byref_object_dispose__33490;
  v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SGMITrialClientWrapper_followUpOnOutgoingMailsQuestionsDetectionRegexes__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: followUpOnOutgoingMailsQuestionsDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);

  }
  return v3;
}

- (id)followUpOnOutgoingMailsAsksDetectionRegexes
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33489;
  v12 = __Block_byref_object_dispose__33490;
  v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__SGMITrialClientWrapper_followUpOnOutgoingMailsAsksDetectionRegexes__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: followUpOnOutgoingMailsAsksDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);

  }
  return v3;
}

- (id)defaultTimeIntervalToStartWarningExposition
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SGMITrialClientWrapper_defaultTimeIntervalToStartWarningExposition__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: defaultTimeIntervalToStartWarningExposition accessed %@.", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)defaultTimeIntervalForAWarning
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SGMITrialClientWrapper_defaultTimeIntervalForAWarning__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: defaultTimeIntervalForAWarning accessed %@.", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)followUpOnIncomingMailsDetectionRegexes
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33489;
  v12 = __Block_byref_object_dispose__33490;
  v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SGMITrialClientWrapper_followUpOnIncomingMailsDetectionRegexes__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: followUpOnIncomingMailsDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);

  }
  return v3;
}

- (id)followUpWarningsParameters
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33489;
  v12 = __Block_byref_object_dispose__33490;
  v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SGMITrialClientWrapper_followUpWarningsParameters__block_invoke;
  v8[3] = &unk_1E7DB7080;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: followUpWarningsParameters accessed with locales %@.", (uint8_t *)&buf, 0xCu);

  }
  return v3;
}

- (id)bodyAnalysisSamplingFactor
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SGMITrialClientWrapper_bodyAnalysisSamplingFactor__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: bodyAnalysisSamplingFactor accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)minCountToConsiderATokenAsHighlyDiscriminant
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__SGMITrialClientWrapper_minCountToConsiderATokenAsHighlyDiscriminant__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: minCountToConsiderATokenAsHighlyDiscriminant accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)ratioToConsiderATokenAsHighlyDiscriminant
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SGMITrialClientWrapper_ratioToConsiderATokenAsHighlyDiscriminant__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: ratioToConsiderATokenAsHighlyDiscriminant accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)minCountToConsiderATokenAsExtremelyDiscriminant
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__SGMITrialClientWrapper_minCountToConsiderATokenAsExtremelyDiscriminant__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: minCountToConsiderATokenAsExtremelyDiscriminant accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)ratioToConsiderATokenAsExtremelyDiscriminant
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33489;
  v10 = __Block_byref_object_dispose__33490;
  v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__SGMITrialClientWrapper_ratioToConsiderATokenAsExtremelyDiscriminant__block_invoke;
  v6[3] = &unk_1E7DB7080;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: ratioToConsiderATokenAsExtremelyDiscriminant accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (TRIClient)triClient
{
  return self->_triClient;
}

- (void)setTriClient:(id)a3
{
  objc_storeStrong((id *)&self->_triClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triClient, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __70__SGMITrialClientWrapper_ratioToConsiderATokenAsExtremelyDiscriminant__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 296));
}

void __73__SGMITrialClientWrapper_minCountToConsiderATokenAsExtremelyDiscriminant__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 288));
}

void __67__SGMITrialClientWrapper_ratioToConsiderATokenAsHighlyDiscriminant__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 280));
}

void __70__SGMITrialClientWrapper_minCountToConsiderATokenAsHighlyDiscriminant__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 272));
}

void __52__SGMITrialClientWrapper_bodyAnalysisSamplingFactor__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 264));
}

void __52__SGMITrialClientWrapper_followUpWarningsParameters__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 256));
}

void __65__SGMITrialClientWrapper_followUpOnIncomingMailsDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 248));
}

void __56__SGMITrialClientWrapper_defaultTimeIntervalForAWarning__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 224));
}

void __69__SGMITrialClientWrapper_defaultTimeIntervalToStartWarningExposition__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 216));
}

void __69__SGMITrialClientWrapper_followUpOnOutgoingMailsAsksDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 240));
}

void __74__SGMITrialClientWrapper_followUpOnOutgoingMailsQuestionsDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 232));
}

void __50__SGMITrialClientWrapper_nicknameDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 208));
}

void __51__SGMITrialClientWrapper_recipientDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 200));
}

void __63__SGMITrialClientWrapper_recipientConservativeDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 192));
}

void __56__SGMITrialClientWrapper_conservativeRecipientDetection__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 184));
}

void __49__SGMITrialClientWrapper_attachmentLinkDetection__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 176));
}

void __52__SGMITrialClientWrapper_attachmentDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 168));
}

void __53__SGMITrialClientWrapper_classificationOfflineRecall__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 160));
}

void __56__SGMITrialClientWrapper_classificationOfflinePrecision__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 152));
}

void __49__SGMITrialClientWrapper_classificationThreshold__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 144));
}

void __49__SGMITrialClientWrapper_saliencyOverrideOutputs__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 136));
}

void __60__SGMITrialClientWrapper_saliencyOverrideFeatureUpperBounds__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 128));
}

void __60__SGMITrialClientWrapper_saliencyOverrideFeatureLowerBounds__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 120));
}

void __54__SGMITrialClientWrapper_saliencyOverrideFeatureNames__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 112));
}

void __49__SGMITrialClientWrapper_modelGroundTruthOutputs__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 104));
}

void __60__SGMITrialClientWrapper_modelGroundTruthFeatureUpperBounds__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 96));
}

void __60__SGMITrialClientWrapper_modelGroundTruthFeatureLowerBounds__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 88));
}

void __54__SGMITrialClientWrapper_modelGroundTruthFeatureNames__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 80));
}

void __71__SGMITrialClientWrapper_modelFeatureStandardizationStandardDeviations__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 72));
}

void __58__SGMITrialClientWrapper_modelFeatureStandardizationMeans__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 64));
}

void __43__SGMITrialClientWrapper_modelFeatureNames__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 56));
}

void __35__SGMITrialClientWrapper_modelPath__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 48));
}

void __47__SGMITrialClientWrapper_modelInferenceVersion__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 40));
}

void __49__SGMITrialClientWrapper_modelGroundTruthVersion__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 32));
}

void __47__SGMITrialClientWrapper_signatureStatsLogging__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 24));
}

void __45__SGMITrialClientWrapper_isDNUOnlyEnablement__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __35__SGMITrialClientWrapper_isEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __37__SGMITrialClientWrapper_loadFactors__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  uint8_t v81[16];
  uint8_t buf[16];

  v3 = a2;
  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: Loading Trial factors", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:", CFSTR("isEnabled"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v3[1];
  v3[1] = v5;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:", CFSTR("isDNUOnlyEnablement"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v3[2];
  v3[2] = v7;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:", CFSTR("signatureStatsLogging"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v3[3];
  v3[3] = v9;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsStringFromFactor:", CFSTR("modelGroundTruthVersion"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v3[4];
  v3[4] = v11;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsStringFromFactor:", CFSTR("modelInferenceVersion"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v3[5];
  v3[5] = v13;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsModelPath:", CFSTR("model"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v3[6];
  v3[6] = v15;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsStringArrayFromFactor:", CFSTR("modelFeatureNames.plist"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v3[7];
  v3[7] = v17;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericArrayFromFactor:", CFSTR("modelFeatureStandardizationMeans.plist"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v3[8];
  v3[8] = v19;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericArrayFromFactor:", CFSTR("modelFeatureStandardizationStandardDeviations.plist"));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v3[9];
  v3[9] = v21;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsStringArrayFromFactor:", CFSTR("modelGroundTruthFeatureNames.plist"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v3[10];
  v3[10] = v23;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericArrayFromFactor:", CFSTR("modelGroundTruthFeatureLowerBounds.plist"));
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v3[11];
  v3[11] = v25;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericArrayFromFactor:", CFSTR("modelGroundTruthFeatureUpperBounds.plist"));
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v3[12];
  v3[12] = v27;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericArrayFromFactor:", CFSTR("modelGroundTruthOutputs.plist"));
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v3[13];
  v3[13] = v29;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsStringArrayFromFactor:", CFSTR("saliencyOverrideFeatureNames.plist"));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v3[14];
  v3[14] = v31;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericArrayFromFactor:", CFSTR("saliencyOverrideFeatureLowerBounds.plist"));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v3[15];
  v3[15] = v33;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericArrayFromFactor:", CFSTR("saliencyOverrideFeatureUpperBounds.plist"));
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v3[16];
  v3[16] = v35;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericArrayFromFactor:", CFSTR("saliencyOverrideOutputs.plist"));
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v3[17];
  v3[17] = v37;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericDictionaryFromFactor:", CFSTR("classificationConfiguration.plist"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("classificationThreshold"));
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v3[18];
  v3[18] = v40;

  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("classificationOfflinePrecision"));
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v3[19];
  v3[19] = v42;

  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("classificationOfflineRecall"));
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v3[20];
  v3[20] = v44;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericDictionaryFromFactor:", CFSTR("attachmentDetectionRegexes.plist"));
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v3[21];
  v3[21] = v46;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsStringArrayFromFactor:", CFSTR("attachmentLinkDetection.plist"));
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v3[22];
  v3[22] = v48;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:", CFSTR("conservativeRecipientDetection"));
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v3[23];
  v3[23] = v50;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericDictionaryFromFactor:", CFSTR("recipientConservativeDetectionRegexes.plist"));
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v3[24];
  v3[24] = v52;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericDictionaryFromFactor:", CFSTR("recipientDetectionRegexes.plist"));
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v3[25];
  v3[25] = v54;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericDictionaryFromFactor:", CFSTR("nicknameDetectionRegexes.plist"));
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v3[26];
  v3[26] = v56;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericFromFactor:", CFSTR("defaultTimeIntervalToStartWarningExposition"));
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v3[27];
  v3[27] = v58;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericFromFactor:", CFSTR("defaultTimeIntervalForAWarning"));
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v3[28];
  v3[28] = v60;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericDictionaryFromFactor:", CFSTR("followUpOnOutgoingMailsQuestionsDetectionRegexes.plist"));
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v3[29];
  v3[29] = v62;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericDictionaryFromFactor:", CFSTR("followUpOnOutgoingMailsAsksDetectionRegexes.plist"));
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)v3[30];
  v3[30] = v64;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericDictionaryFromFactor:", CFSTR("followUpOnIncomingMailsDetectionRegexes.plist"));
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v3[31];
  v3[31] = v66;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericDictionaryFromFactor:", CFSTR("followUpWarningsParameters.plist"));
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v3[32];
  v3[32] = v68;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericFromFactor:", CFSTR("bodyAnalysisSamplingFactor"));
  v70 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)v3[33];
  v3[33] = v70;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsLongFromFactor:", CFSTR("minCountToConsiderATokenAsHighlyDiscriminant"));
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)v3[34];
  v3[34] = v72;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericFromFactor:", CFSTR("ratioToConsiderATokenAsHighlyDiscriminant"));
  v74 = objc_claimAutoreleasedReturnValue();
  v75 = (void *)v3[35];
  v3[35] = v74;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsLongFromFactor:", CFSTR("minCountToConsiderATokenAsExtremelyDiscriminant"));
  v76 = objc_claimAutoreleasedReturnValue();
  v77 = (void *)v3[36];
  v3[36] = v76;

  objc_msgSend(*(id *)(a1 + 32), "loadLevelAsNumericFromFactor:", CFSTR("ratioToConsiderATokenAsExtremelyDiscriminant"));
  v78 = objc_claimAutoreleasedReturnValue();
  v79 = (void *)v3[37];
  v3[37] = v78;

  sgMailIntelligenceLogHandle();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v81 = 0;
    _os_log_debug_impl(&dword_1C3607000, v80, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: Trial factor load complete", v81, 2u);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_33651 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_33651, &__block_literal_global_33652);
  return (id)sharedInstance__pasExprOnceResult_33653;
}

void __40__SGMITrialClientWrapper_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_33653;
  sharedInstance__pasExprOnceResult_33653 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
