@implementation FHTrialModel

- (FHTrialModel)initWithModelName:(id)a3 namespaceName:(id)a4 modelFactorName:(id)a5 defaultModel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FHExperiment *v14;
  FHTrialModel *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[FHExperiment initWithClient:namespaceName:setRefresh:delegate:]([FHExperiment alloc], "initWithClient:namespaceName:setRefresh:delegate:", 0, v12, 1, self);

  v15 = -[FHTrialModel initWithModelName:fhExperiment:modelFactorName:defaultModel:](self, "initWithModelName:fhExperiment:modelFactorName:defaultModel:", v13, v14, v11, v10);
  return v15;
}

- (FHTrialModel)initWithModelName:(id)a3 fhExperiment:(id)a4 modelFactorName:(id)a5 defaultModel:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSString *v17;
  NSString *trialId;
  NSObject *v19;
  NSString *v20;
  FHTrialModel *v21;
  void *v22;
  NSObject *v23;
  NSString *v24;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_storeStrong((id *)&self->_fhExperiment, a4);
  v14 = a3;
  objc_storeStrong((id *)&self->_modelFactorName, a5);
  -[FHExperiment getFilePathForFactor:](self->_fhExperiment, "getFilePathForFactor:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v15);
    -[FHExperiment getTrialIdForFactor:](self->_fhExperiment, "getTrialIdForFactor:", v12);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    trialId = self->_trialId;
    self->_trialId = v17;

  }
  else
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[FHTrialModel initWithModelName:fhExperiment:modelFactorName:defaultModel:]";
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_23B4A2000, v19, OS_LOG_TYPE_DEBUG, "%s Loading default model %@", buf, 0x16u);
    }

    v16 = v13;
    v20 = self->_trialId;
    self->_trialId = (NSString *)&stru_250C67C70;

  }
  v26.receiver = self;
  v26.super_class = (Class)FHTrialModel;
  v21 = -[FHModel initWithModelURL:modelName:](&v26, sel_initWithModelURL_modelName_, v16, v14);

  if (v21)
  {
    -[FHModel mlModel](v21, "mlModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[FHTrialModel initWithModelName:fhExperiment:modelFactorName:defaultModel:]";
        v29 = 2112;
        v30 = v13;
        _os_log_impl(&dword_23B4A2000, v23, OS_LOG_TYPE_DEBUG, "%s Loading default model %@", buf, 0x16u);
      }

      v24 = v21->_trialId;
      v21->_trialId = (NSString *)&stru_250C67C70;

      -[FHModel _loadModel:](v21, "_loadModel:", v13);
    }
  }

  return v21;
}

- (void)updateFactors
{
  NSObject *v3;
  NSString *modelFactorName;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSString *v9;
  NSString *trialId;
  int v11;
  const char *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    modelFactorName = self->_modelFactorName;
    v11 = 136315394;
    v12 = "-[FHTrialModel updateFactors]";
    v13 = 2112;
    v14 = modelFactorName;
    _os_log_impl(&dword_23B4A2000, v3, OS_LOG_TYPE_DEBUG, "%s Updating trial model with factor name: %@", (uint8_t *)&v11, 0x16u);
  }

  -[FHExperiment getFilePathForFactor:](self->_fhExperiment, "getFilePathForFactor:", self->_modelFactorName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHModel compiledModelURL](self, "compiledModelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
    v8 = -[FHModel _loadModel:](self, "_loadModel:", v7);

    if (v8)
    {
      -[FHExperiment getTrialIdForFactor:](self->_fhExperiment, "getTrialIdForFactor:", self->_modelFactorName);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      trialId = self->_trialId;
      self->_trialId = v9;

      -[FHModel _deleteModelFile:](self, "_deleteModelFile:", v6);
    }
  }

}

- (NSString)trialId
{
  return self->_trialId;
}

- (void)setTrialId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialId, 0);
  objc_storeStrong((id *)&self->_modelFactorName, 0);
  objc_storeStrong((id *)&self->_fhExperiment, 0);
}

@end
