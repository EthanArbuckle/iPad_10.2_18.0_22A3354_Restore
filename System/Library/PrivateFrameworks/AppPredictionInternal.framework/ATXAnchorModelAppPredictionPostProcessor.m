@implementation ATXAnchorModelAppPredictionPostProcessor

- (ATXAnchorModelAppPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3
{
  id v4;
  void *v5;
  ATXAnchorModelAppPredictionPostProcessor *v6;

  v4 = a3;
  +[ATXAppPredictionBlacklist sharedInstance](ATXAppPredictionBlacklist, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXAnchorModelAppPredictionPostProcessor initWithAnchorModelPrediction:blacklist:](self, "initWithAnchorModelPrediction:blacklist:", v4, v5);

  return v6;
}

- (ATXAnchorModelAppPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3 blacklist:(id)a4
{
  id v7;
  id v8;
  ATXAnchorModelAppPredictionPostProcessor *v9;
  ATXAnchorModelAppPredictionPostProcessor *v10;
  uint64_t v11;
  ATXAnchorModelDataStoreWrapper *storeWrapper;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelAppPredictionPostProcessor;
  v9 = -[ATXAnchorModelAppPredictionPostProcessor init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_anchorModelPrediction, a3);
    v11 = objc_opt_new();
    storeWrapper = v10->_storeWrapper;
    v10->_storeWrapper = (ATXAnchorModelDataStoreWrapper *)v11;

    objc_storeStrong((id *)&v10->_blacklist, a4);
  }

  return v10;
}

- (BOOL)shouldPredictAnchorModelAppPrediction
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[ATXAnchorModelPrediction candidateType](self->_anchorModelPrediction, "candidateType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("app"));

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0CF8CE8];
  -[ATXAnchorModelPrediction candidateId](self->_anchorModelPrediction, "candidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isInstalledForBundle:", v6);

  if ((v5 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CF8CE8];
    -[ATXAnchorModelPrediction candidateId](self->_anchorModelPrediction, "candidateId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "isDeviceManagementPolicyOkForBundleId:", v8);

    if ((v7 & 1) != 0)
    {
      -[ATXAppPredictionBlacklist disabledBundleIds](self->_blacklist, "disabledBundleIds");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAnchorModelPrediction candidateId](self->_anchorModelPrediction, "candidateId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      if (!v11)
        return 1;
      __atxlog_handle_anchor();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      -[ATXAnchorModelPrediction candidateId](self->_anchorModelPrediction, "candidateId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      v14 = "Skipping prediction for %@ because app is blacklisted.";
      goto LABEL_11;
    }
    __atxlog_handle_anchor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[ATXAnchorModelPrediction candidateId](self->_anchorModelPrediction, "candidateId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      v14 = "Skipping prediction for %@ because app is disabled from Screen Time.";
      goto LABEL_11;
    }
  }
  else
  {
    __atxlog_handle_anchor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[ATXAnchorModelPrediction candidateId](self->_anchorModelPrediction, "candidateId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      v14 = "Skipping prediction for %@ because app is not installed.";
LABEL_11:
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);

    }
  }
LABEL_12:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklist, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchorModelPrediction, 0);
}

@end
