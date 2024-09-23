@implementation ATXTrialClientWrapper

- (id)stringForFactor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, self->_trialNamespaceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)longForFactor:(id)a3
{
  void *v3;
  void *v4;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, self->_trialNamespaceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", objc_msgSend(v3, "longValue"));
  else
    v4 = 0;

  return v4;
}

- (id)BOOLForFactor:(id)a3
{
  void *v3;
  void *v4;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, self->_trialNamespaceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v3, "BOOLeanValue"));
  else
    v4 = 0;

  return v4;
}

- (BOOL)refreshEnrollmentInformation
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *trialExperimentId;
  NSString *v7;
  NSString *trialTreatmentId;
  NSObject *v9;
  uint8_t v11[16];

  -[TRIClient refresh](self->_trialClient, "refresh");
  -[TRIClient experimentIdentifiersWithNamespaceName:](self->_trialClient, "experimentIdentifiersWithNamespaceName:", self->_trialNamespaceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "experimentId");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    trialExperimentId = self->_trialExperimentId;
    self->_trialExperimentId = v5;

    self->_trialDeploymentId = objc_msgSend(v4, "deploymentId");
    objc_msgSend(v4, "treatmentId");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    trialTreatmentId = self->_trialTreatmentId;
    self->_trialTreatmentId = v7;

  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Unable to fetch experimentId, deploymentId, treatmentId", v11, 2u);
    }

  }
  return v4 != 0;
}

- (ATXTrialClientWrapper)initWithClientIdentifier:(int)a3 namespaceName:(id)a4
{
  uint64_t v5;
  id v7;
  ATXTrialClientWrapper *v8;
  uint64_t v9;
  TRIClient *trialClient;
  TRIClient *v11;
  uint64_t v12;
  TRINotificationToken *token;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v5 = *(_QWORD *)&a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXTrialClientWrapper;
  v8 = -[ATXTrialClientWrapper init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    trialClient = v8->_trialClient;
    v8->_trialClient = (TRIClient *)v9;

    objc_storeStrong((id *)&v8->_trialNamespaceName, a4);
    objc_initWeak(&location, v8);
    v11 = v8->_trialClient;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__ATXTrialClientWrapper_initWithClientIdentifier_namespaceName___block_invoke;
    v15[3] = &unk_1E4D5CD90;
    objc_copyWeak(&v16, &location);
    -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v11, "addUpdateHandlerForNamespaceName:usingBlock:", v7, v15);
    v12 = objc_claimAutoreleasedReturnValue();
    token = v8->_token;
    v8->_token = (TRINotificationToken *)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __64__ATXTrialClientWrapper_initWithClientIdentifier_namespaceName___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateFactors");
    WeakRetained = v2;
  }

}

- (BOOL)refreshRolloutIdentifiers
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_trialClient, "rolloutIdentifiersWithNamespaceName:", self->_trialNamespaceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_storeStrong((id *)&self->_trialRolloutIdentifiers, v3);
  }
  else
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Unable to fetch rolloutIdentifiers", v6, 2u);
    }

  }
  return v3 != 0;
}

- (void)updateFactors
{
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v4;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a3, v7, "ATXTrialClientWrapper: Method %@ not overriden in %@", (uint8_t *)&v8);

}

- (id)dictionaryForTrialResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  _BYTE buf[12];
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXTrialClientWrapper filePathForTrialResource:](self, "filePathForTrialResource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v17 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 1, &v17);
    v7 = v17;
    if (v6)
    {
      if ((unint64_t)objc_msgSend(v6, "length") >= 3
        && ((v8 = objc_retainAutorelease(v6), v9 = objc_msgSend(v8, "bytes"), *(_WORD *)v9 == 19536)
          ? (v10 = *(_BYTE *)(v9 + 2) == 80)
          : (v10 = 0),
            v10))
      {
        *(_QWORD *)buf = v7;
        objc_msgSend(MEMORY[0x1E0D815D0], "dictionaryWithData:error:", v8, buf);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        *(_QWORD *)buf = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, buf);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v11;
      v13 = *(id *)buf;

      if (v12)
        goto LABEL_19;
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXTrialClientWrapper dictionaryForTrialResource:].cold.1((uint64_t)v5, (uint64_t)v13, v14);
      v7 = v13;
    }
    else
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v5;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Error loading plist %@: %@", buf, 0x16u);
      }
    }

    v12 = 0;
    v13 = v7;
LABEL_19:

    goto LABEL_20;
  }
  __atxlog_handle_default();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Could not get file path for resource: %@", buf, 0xCu);
  }

  v12 = 0;
LABEL_20:

  return v12;
}

- (id)filePathForTrialResource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, self->_trialNamespaceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)directoryPathForTrialResource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, self->_trialNamespaceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directoryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (NSString)trialNamespaceName
{
  return self->_trialNamespaceName;
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (int)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (TRIRolloutIdentifiers)trialRolloutIdentifiers
{
  return self->_trialRolloutIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialRolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

- (void)dictionaryForTrialResource:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a3, (uint64_t)a3, "ATXTrialClientWrapper: Error parsing plist %@: %@", (uint8_t *)&v3);
}

@end
