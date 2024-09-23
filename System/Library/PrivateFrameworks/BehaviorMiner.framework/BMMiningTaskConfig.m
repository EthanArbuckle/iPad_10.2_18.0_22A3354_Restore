@implementation BMMiningTaskConfig

- (BMMiningTaskConfig)init
{
  BMMiningTaskConfig *v2;
  BMMiningTaskConfig *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BMMiningTaskConfig;
  v2 = -[BMMiningTaskConfig init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BMMiningTaskConfig loadDefaultConfig](v2, "loadDefaultConfig");
    -[BMMiningTaskConfig registerWithTrial](v3, "registerWithTrial");
  }
  return v3;
}

- (void)registerWithTrial
{
  void *v3;
  id v4;
  TRIClient *v5;
  TRIClient *trialClient;
  NSObject *v7;
  TRIClient *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[8];
  uint64_t v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v3 = (void *)getTRIClientClass_softClass;
  v20 = getTRIClientClass_softClass;
  if (!getTRIClientClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __getTRIClientClass_block_invoke;
    v15 = &unk_24D21EAF0;
    v16 = &v17;
    __getTRIClientClass_block_invoke((uint64_t)buf);
    v3 = (void *)v18[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v4, "clientWithIdentifier:", 210);
  v5 = (TRIClient *)objc_claimAutoreleasedReturnValue();
  trialClient = self->_trialClient;
  self->_trialClient = v5;

  if (self->_trialClient)
  {
    BMLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2147C2000, v7, OS_LOG_TYPE_INFO, "Trial: get trial client", buf, 2u);
    }

    -[BMMiningTaskConfig updateFactorLevels](self, "updateFactorLevels");
    objc_initWeak((id *)buf, self);
    v8 = self->_trialClient;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__BMMiningTaskConfig_registerWithTrial__block_invoke;
    v10[3] = &unk_24D21EB40;
    objc_copyWeak(&v11, (id *)buf);
    v9 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v8, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREML_SYSTEMS_PEOPLE_SUGGESTER"), v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __39__BMMiningTaskConfig_registerWithTrial__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateFactorLevels");
    WeakRetained = v2;
  }

}

- (void)updateFactorLevels
{
  OUTLINED_FUNCTION_2(&dword_2147C2000, a1, a3, "Failed to load trial config, fallback to default config", a5, a6, a7, a8, 0);
}

- (void)updateFactorLevelsFromFilePath:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *trialID;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BMLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_2147C2000, v5, OS_LOG_TYPE_INFO, "Updating from override config path:%@", (uint8_t *)&v15, 0xCu);
  }

  if (-[BMMiningTaskConfig loadBMMiningTaskConfig:](self, "loadBMMiningTaskConfig:", v4))
  {
    trialID = self->_trialID;
    self->_trialID = (NSString *)CFSTR("Override");

  }
  else
  {
    BMLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BMMiningTaskConfig updateFactorLevelsFromFilePath:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    -[BMMiningTaskConfig loadDefaultConfig](self, "loadDefaultConfig");
  }

}

- (void)loadDefaultConfig
{
  void *v3;
  NSString *trialID;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("com.apple.BehaviorMiner.Config.Default"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMiningTaskConfig loadBMMiningTaskConfig:](self, "loadBMMiningTaskConfig:", v3);
  trialID = self->_trialID;
  self->_trialID = (NSString *)CFSTR("Default");

}

- (BOOL)loadBMMiningTaskConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v5, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  -[BMMiningTaskConfig setBmMiningTaskConfig:](self, "setBmMiningTaskConfig:", v6);

  -[BMMiningTaskConfig bmMiningTaskConfig](self, "bmMiningTaskConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BMMiningTaskConfig bmMiningTaskConfig](self, "bmMiningTaskConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("interactionExtractedTopicFromAttachmentFactorInUse"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMMiningTaskConfig setInteractionExtractedTopicFromAttachmentFactorInUse:](self, "setInteractionExtractedTopicFromAttachmentFactorInUse:", objc_msgSend(v10, "BOOLValue"));

    BMLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[BMMiningTaskConfig bmMiningTaskConfig](self, "bmMiningTaskConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_2147C2000, v11, OS_LOG_TYPE_INFO, "Loaded bmMiningTaskConfig with contents:%@, loaded from path:%@", buf, 0x16u);

    }
  }
  else
  {
    BMLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMMiningTaskConfig loadBMMiningTaskConfig:].cold.1((uint64_t)v4, (uint64_t)v7, v11);
  }

  return v8 != 0;
}

- (NSString)trialID
{
  return self->_trialID;
}

- (void)setTrialID:(id)a3
{
  objc_storeStrong((id *)&self->_trialID, a3);
}

- (BOOL)interactionExtractedTopicFromAttachmentFactorInUse
{
  return self->_interactionExtractedTopicFromAttachmentFactorInUse;
}

- (void)setInteractionExtractedTopicFromAttachmentFactorInUse:(BOOL)a3
{
  self->_interactionExtractedTopicFromAttachmentFactorInUse = a3;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (TRITrackingId)trialTrackingID
{
  return self->_trialTrackingID;
}

- (void)setTrialTrackingID:(id)a3
{
  objc_storeStrong((id *)&self->_trialTrackingID, a3);
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (void)setTreatmentID:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentID, a3);
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
  objc_storeStrong((id *)&self->_experimentID, a3);
}

- (int)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(int)a3
{
  self->_deploymentID = a3;
}

- (NSDictionary)bmMiningTaskConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBmMiningTaskConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmMiningTaskConfig, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_trialID, 0);
}

- (void)updateFactorLevelsFromFilePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2147C2000, a1, a3, "Failed to load override config, fallback to default config", a5, a6, a7, a8, 0);
}

- (void)loadBMMiningTaskConfig:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2147C2000, log, OS_LOG_TYPE_ERROR, "Failed to load trial config with path:%@, with error：%@", (uint8_t *)&v3, 0x16u);
}

@end
