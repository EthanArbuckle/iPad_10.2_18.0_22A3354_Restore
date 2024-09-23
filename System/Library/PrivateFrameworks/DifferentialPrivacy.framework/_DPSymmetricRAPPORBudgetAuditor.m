@implementation _DPSymmetricRAPPORBudgetAuditor

- (_DPSymmetricRAPPORBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  unsigned int v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  id *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _DPSymmetricRAPPORBudgetAuditor *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _DPSymmetricRAPPORWithOHE *v40;
  NSObject *v41;
  _DPSymmetricRAPPORBudgetAuditor *v42;
  void *v44;
  void *v45;
  id *v46;
  _DPSymmetricRAPPORBudgetAuditor *v47;
  objc_super v48;
  _QWORD v49[3];
  _QWORD v50[4];

  v50[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DefaultMinBatchSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DefaultMinBatchSize"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("epsilon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    +[_DPBudgetAuditor maxApproximateDPFromPlist:error:](_DPBudgetAuditor, "maxApproximateDPFromPlist:error:", v9, a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v46 = a5;
      v47 = self;
      objc_msgSend(v8, "objectForKeyedSubscript:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MinBatchSize"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntValue");

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DPConfig"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v17;
      if (v21)
      {
        v22 = v8;
        v23 = v18;
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("LocalEpsilon"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        v27 = v46;
        if (+[_DPBudgetAuditor checkMetadataLocalEpsilon:defaultLocalEpsilon:error:](_DPBudgetAuditor, "checkMetadataLocalEpsilon:defaultLocalEpsilon:error:", v46, v26, v16))
        {
          +[_DPBudgetAuditor targetApproximateDPFromDPConfig:error:](_DPBudgetAuditor, "targetApproximateDPFromDPConfig:error:", v21, v46);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            v45 = v21;
            v16 = v26;
LABEL_16:
            v40 = -[_DPSymmetricRAPPORWithOHE initWithBatchSize:localEpsilon:error:]([_DPSymmetricRAPPORWithOHE alloc], "initWithBatchSize:localEpsilon:error:", v20, v27, v16);
            if (v40)
            {
              +[_DPLog framework](_DPLog, "framework");
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                -[_DPSymmetricRAPPORBudgetAuditor initWithMetadata:plistParameters:error:].cold.1(v20, v41, v16);

              v48.receiver = v47;
              v48.super_class = (Class)_DPSymmetricRAPPORBudgetAuditor;
              v42 = -[_DPBudgetAuditor initWithMetadata:plistParameters:targetADP:maxADP:analysis:error:](&v48, sel_initWithMetadata_plistParameters_targetADP_maxADP_analysis_error_, v22, v9, v28, v17, v40, v27);
              if (v42)
                v42->_auditedFromPlist = v45 == 0;
              v31 = v42;
              v47 = v31;
            }
            else
            {
              v31 = 0;
            }

            v21 = v45;
            goto LABEL_25;
          }
          v31 = 0;
        }
        else
        {
          v31 = 0;
          v28 = v17;
        }
LABEL_25:

        self = v47;
        v8 = v22;
        goto LABEL_26;
      }
      v45 = 0;
      if (v20 <= v13)
        v20 = v13;
      else
        v20 = v20;
      v44 = (void *)objc_msgSend(v8, "mutableCopy");
      v32 = (void *)objc_msgSend(v18, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("MinBatchSize"));

      v49[0] = CFSTR("LocalEpsilon");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v34;
      v49[1] = CFSTR("TargetCentralEpsilon");
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v17, "epsilon");
      objc_msgSend(v35, "numberWithDouble:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v36;
      v49[2] = CFSTR("TargetCentralDelta");
      v37 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v17, "delta");
      objc_msgSend(v37, "numberWithDouble:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v39, CFSTR("DPConfig"));

      v22 = v44;
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v32, CFSTR("DediscoTaskConfig"));

      v28 = v17;
      v23 = v18;
      v27 = v46;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed parameter (%@) in plist, expected numbers."), CFSTR("DefaultMinBatchSize"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _DPPrivacyBudgetError(7, v29);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  +[_DPLog framework](_DPLog, "framework");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    -[_DPDediscoError logAndStoreInError:].cold.1((uint64_t)v17, v30);

  if (!a5)
  {
LABEL_11:
    v31 = 0;
    goto LABEL_26;
  }
  v17 = objc_retainAutorelease(v17);
  v31 = 0;
  *a5 = v17;
LABEL_26:

  return v31;
}

- (id)auditedMetadataWithError:(id *)a3
{
  void *v5;
  objc_super v7;

  if (-[_DPSymmetricRAPPORBudgetAuditor auditedFromPlist](self, "auditedFromPlist"))
  {
    -[_DPBudgetAuditor metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_DPSymmetricRAPPORBudgetAuditor;
    -[_DPBudgetAuditor auditedMetadataWithError:](&v7, sel_auditedMetadataWithError_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)auditedFromPlist
{
  return self->_auditedFromPlist;
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
  _os_log_debug_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_DEBUG, "Symmetric RAPPOR budget auditor uses min batch size = %d, local epsilon = %f", (uint8_t *)v3, 0x12u);
}

@end
