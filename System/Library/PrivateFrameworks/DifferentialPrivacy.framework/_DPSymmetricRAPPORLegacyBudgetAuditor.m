@implementation _DPSymmetricRAPPORLegacyBudgetAuditor

- (_DPSymmetricRAPPORLegacyBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  _DPSymmetricRAPPORWithOHE *v17;
  NSObject *v18;
  _DPSymmetricRAPPORLegacyBudgetAuditor *v19;
  void *v20;
  NSObject *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DefaultMinBatchSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed parameter (%@) in plist, expected numbers."), CFSTR("DefaultMinBatchSize"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _DPPrivacyBudgetError(7, v20);
    v17 = (_DPSymmetricRAPPORWithOHE *)objc_claimAutoreleasedReturnValue();

    +[_DPLog framework](_DPLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[_DPDediscoError logAndStoreInError:].cold.1((uint64_t)v17, v21);

    if (a5)
    {
      v17 = objc_retainAutorelease(v17);
      v19 = 0;
      *a5 = v17;
      goto LABEL_11;
    }
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DefaultMinBatchSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("epsilon"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = -[_DPSymmetricRAPPORWithOHE initWithBatchSize:localEpsilon:error:]([_DPSymmetricRAPPORWithOHE alloc], "initWithBatchSize:localEpsilon:error:", v13, a5, v16);
  if (!v17)
    goto LABEL_10;
  +[_DPLog framework](_DPLog, "framework");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[_DPSymmetricRAPPORLegacyBudgetAuditor initWithMetadata:plistParameters:error:].cold.1(v13, v18, v16);

  v23.receiver = self;
  v23.super_class = (Class)_DPSymmetricRAPPORLegacyBudgetAuditor;
  self = -[_DPBudgetAuditor initWithMetadata:plistParameters:targetADP:maxADP:analysis:error:](&v23, sel_initWithMetadata_plistParameters_targetADP_maxADP_analysis_error_, v8, v9, 0, 0, v17, a5);
  v19 = self;
LABEL_11:

  return v19;
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
  _os_log_debug_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_DEBUG, "Symmetric RAPPOR legacy budget auditor uses min batch size = %d, local epsilon = %f", (uint8_t *)v3, 0x12u);
}

@end
