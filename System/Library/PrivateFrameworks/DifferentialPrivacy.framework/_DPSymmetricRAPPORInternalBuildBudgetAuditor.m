@implementation _DPSymmetricRAPPORInternalBuildBudgetAuditor

- (_DPSymmetricRAPPORInternalBuildBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  _DPSymmetricRAPPORInternalBuildBudgetAuditor *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _DPSymmetricRAPPORWithOHE *v29;
  NSObject *v30;
  void *v31;
  unsigned int v33;
  id *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MinBatchSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v11 <= 5)
    v12 = 5;
  else
    v12 = v11;
  v38 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("epsilon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("DPConfig"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v17;
  v37 = v16;
  if (!v17)
  {
    v34 = a5;
    v35 = 0;
    v21 = v15;
LABEL_11:
    v24 = (void *)objc_msgSend(v7, "mutableCopy");
    v25 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("MinBatchSize"));

    v41 = CFSTR("LocalEpsilon");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("DPConfig"));

    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("DediscoTaskConfig"));
    v7 = v24;
    goto LABEL_12;
  }
  v33 = v12;
  v18 = v17;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("LocalEpsilon"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  if (!+[_DPBudgetAuditor checkMetadataLocalEpsilon:defaultLocalEpsilon:error:](_DPBudgetAuditor, "checkMetadataLocalEpsilon:defaultLocalEpsilon:error:", a5, v21, v15)|| (+[_DPBudgetAuditor targetApproximateDPFromDPConfig:error:](_DPBudgetAuditor, "targetApproximateDPFromDPConfig:error:", v18, a5), (v22 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v23 = 0;
    goto LABEL_18;
  }
  v34 = a5;
  v35 = (void *)v22;
  v12 = v33;
  if (v11 <= 4)
    goto LABEL_11;
LABEL_12:
  v29 = -[_DPSymmetricRAPPORWithOHE initWithBatchSize:localEpsilon:error:]([_DPSymmetricRAPPORWithOHE alloc], "initWithBatchSize:localEpsilon:error:", v12, v34, v21);
  if (v29)
  {
    +[_DPLog framework](_DPLog, "framework");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[_DPSymmetricRAPPORInternalBuildBudgetAuditor initWithMetadata:plistParameters:error:].cold.1(v12, v30, v21);

    v40.receiver = self;
    v40.super_class = (Class)_DPSymmetricRAPPORInternalBuildBudgetAuditor;
    v31 = v35;
    v23 = -[_DPBudgetAuditor initWithMetadata:plistParameters:targetADP:maxADP:analysis:error:](&v40, sel_initWithMetadata_plistParameters_targetADP_maxADP_analysis_error_, v7, v38, v35, 0, v29, v34);
    self = v23;
  }
  else
  {
    v23 = 0;
    v31 = v35;
  }

LABEL_18:
  return v23;
}

- (void)initWithMetadata:(int)a1 plistParameters:(NSObject *)a2 error:(double)a3 .cold.1(int a1, NSObject *a2, double a3)
{
  _DWORD v3[2];
  __int16 v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 2048;
  v5 = a3;
  _os_log_debug_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_DEBUG, "Symmetric RAPPOR internal build budget auditor uses min batch size = %d, local epsilon = %f", (uint8_t *)v3, 0x12u);
}

@end
