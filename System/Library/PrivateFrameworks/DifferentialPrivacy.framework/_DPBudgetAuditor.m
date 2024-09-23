@implementation _DPBudgetAuditor

+ (id)budgetAuditorFromMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:", v9, v8, +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)budgetAuditorFromMetadata:(id)a3 plistParameters:(id)a4 isInternalBuild:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _DPSymmetricRAPPORLegacyBudgetAuditor *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __objc2_class *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  if (!+[_DPBudgetAuditor isMetadataValid:plistParameters:error:](_DPBudgetAuditor, "isMetadataValid:plistParameters:error:", v9, v10, a6))goto LABEL_4;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Mechanism"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
LABEL_4:
      v15 = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DPConfig"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_9;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Mechanism"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_9;
    v20 = (void *)v19;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Mechanism"));
    v21 = v18;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("ClientSymmetricRAPPOR"));

    v18 = v21;
    if (!v23)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Mechanism"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("AggregatorDiscreteGaussianClientSymmetricRAPPOR"));

      if (!v35)
      {
        v36 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Mechanism"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("Unknown DP mechanism specified in %@.%@.%@: %@"), CFSTR("DediscoTaskConfig"), CFSTR("DPConfig"), CFSTR("Mechanism"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        _DPPrivacyBudgetError(8, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        +[_DPLog framework](_DPLog, "framework");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

        if (a6)
          *a6 = objc_retainAutorelease(v39);

        v15 = 0;
        goto LABEL_16;
      }
      v24 = _DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor;
    }
    else
    {
LABEL_9:
      if (v7)
        v24 = _DPSymmetricRAPPORInternalBuildBudgetAuditor;
      else
        v24 = _DPSymmetricRAPPORBudgetAuditor;
    }
    v15 = (_DPSymmetricRAPPORLegacyBudgetAuditor *)objc_msgSend([v24 alloc], "initWithMetadata:plistParameters:error:", v9, v10, a6);
LABEL_16:

    goto LABEL_17;
  }
  +[_DPLog framework](_DPLog, "framework");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

  v15 = -[_DPSymmetricRAPPORLegacyBudgetAuditor initWithMetadata:plistParameters:error:]([_DPSymmetricRAPPORLegacyBudgetAuditor alloc], "initWithMetadata:plistParameters:error:", v9, v10, a6);
LABEL_17:

  return v15;
}

- (_DPBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 targetADP:(id)a5 maxADP:(id)a6 analysis:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _DPBudgetAuditor *v18;
  _DPBudgetAuditor *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_DPBudgetAuditor;
  v18 = -[_DPBudgetAuditor init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_metadata, a3);
    objc_storeStrong((id *)&v19->_plistParameters, a4);
    objc_storeStrong((id *)&v19->_targetADP, a5);
    objc_storeStrong((id *)&v19->_maxADP, a6);
    objc_storeStrong((id *)&v19->_analysis, a7);
  }

  return v19;
}

- (id)auditedMetadataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;

  -[_DPBudgetAuditor targetADP](self, "targetADP");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_DPBudgetAuditor targetADP](self, "targetADP");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPBudgetAuditor analysis](self, "analysis");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceedApproximateDPBudget:error:", v6, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (!objc_msgSend(v8, "BOOLValue"))
      {
        -[_DPBudgetAuditor maxADP](self, "maxADP");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[_DPBudgetAuditor maxADP](self, "maxADP");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "exceed:", v24))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Target %@ budget exceeds the maximum allowed %@ budget."), v6, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            _DPPrivacyBudgetError(4, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            +[_DPLog framework](_DPLog, "framework");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

            if (a3)
              *a3 = objc_retainAutorelease(v26);

            v14 = 0;
          }
          else
          {
            -[_DPBudgetAuditor metadata](self, "metadata");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          -[_DPBudgetAuditor metadata](self, "metadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_23;
      }
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[_DPBudgetAuditor analysis](self, "analysis");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Privacy budget analysis %@ will exceed the target %@ budget."), objc_opt_class(), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _DPPrivacyBudgetError(5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[_DPLog framework](_DPLog, "framework");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

      if (a3)
        *a3 = objc_retainAutorelease(v12);

    }
    v14 = 0;
LABEL_23:

    return v14;
  }
  +[_DPLog framework](_DPLog, "framework");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[_DPBudgetAuditor auditedMetadataWithError:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  -[_DPBudgetAuditor metadata](self, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (id)getSymmetricRAPPORLocalEpsilonWithError:(id *)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  -[_DPBudgetAuditor analysis](self, "analysis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[_DPBudgetAuditor analysis](self, "analysis");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localEpsilon");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    return v9;
  }
  -[_DPBudgetAuditor analysis](self, "analysis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) != 0)
  {
    -[_DPBudgetAuditor analysis](self, "analysis");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rappor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "rappor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localEpsilon");
      objc_msgSend(v13, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }

  }
  _DPPrivacyBudgetError(6, CFSTR("Symmetric RAPPOR is not configured in privacy budget analysis while it is expected to be."));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPLog framework](_DPLog, "framework");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

  if (a3)
    *a3 = objc_retainAutorelease(v15);

  v9 = 0;
  return v9;
}

+ (id)targetApproximateDPFromDPConfig:(id)a3 error:(id *)a4
{
  id v5;
  _DPApproximateDP *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  _DPApproximateDP *v12;
  id v13;
  _DPApproximateDP *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v5 = a3;
  v6 = [_DPApproximateDP alloc];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TargetCentralEpsilon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TargetCentralDelta"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v24 = 0;
  v12 = -[_DPApproximateDP initWithEpsilon:delta:error:](v6, "initWithEpsilon:delta:error:", &v24, v9, v11);
  v13 = v24;

  if (v12)
  {
    v14 = v12;
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[_DPBudgetAuditor targetApproximateDPFromDPConfig:error:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    if (a4)
    {
      _DPPrivacyBudgetErrorWithUnderlyingError(8, CFSTR("Malformed target central DP parameters in metadata."), v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

+ (id)maxApproximateDPFromPlist:(id)a3 error:(id *)a4
{
  id v5;
  _DPApproximateDP *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  _DPApproximateDP *v12;
  id v13;
  _DPApproximateDP *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v5 = a3;
  v6 = [_DPApproximateDP alloc];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxCentralEpsilon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxCentralDelta"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v24 = 0;
  v12 = -[_DPApproximateDP initWithEpsilon:delta:error:](v6, "initWithEpsilon:delta:error:", &v24, v9, v11);
  v13 = v24;

  if (v12)
  {
    v14 = v12;
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[_DPBudgetAuditor maxApproximateDPFromPlist:error:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    if (a4)
    {
      _DPPrivacyBudgetErrorWithUnderlyingError(7, CFSTR("Malformed max central DP parameters in plist."), v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

+ (BOOL)checkMetadataLocalEpsilon:(double)a3 defaultLocalEpsilon:(double)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  NSObject *v10;

  if (a3 > a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Local epsilon specified in metadata (%f) cannot exceed the default local epsilon (%f) in the plist."), *(_QWORD *)&a3, *(_QWORD *)&a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _DPPrivacyBudgetError(8, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DPLog framework](_DPLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

    if (a5)
      *a5 = objc_retainAutorelease(v9);

  }
  return a3 <= a4;
}

+ (BOOL)isMetadataValid:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  BOOL v36;
  void *v37;
  NSObject *v38;
  id *v39;
  id v40;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  id obj;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[3];
  _BYTE v64[128];
  _QWORD v65[3];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v6 = a4;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v65[0] = CFSTR("MaxCentralEpsilon");
  v65[1] = CFSTR("MaxCentralDelta");
  v65[2] = CFSTR("epsilon");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v60;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v11);
      objc_msgSend(v6, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed parameter (%@) in plist, expected numbers."), v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _DPPrivacyBudgetError(7, v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DPLog framework](_DPLog, "framework");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

    v39 = a5;
    v15 = v54;
    if (a5)
    {
      v40 = objc_retainAutorelease(v24);
      goto LABEL_29;
    }
    goto LABEL_30;
  }
LABEL_9:

  v15 = v54;
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v36 = 1;
    goto LABEL_33;
  }
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed parameter (%@) in metadata, expected a dictionary."), CFSTR("DediscoTaskConfig"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    _DPPrivacyBudgetError(8, v42);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    +[_DPLog framework](_DPLog, "framework");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

    if (a5)
    {
      v7 = objc_retainAutorelease(v7);
      v36 = 0;
      *a5 = v7;
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MinBatchSize"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed parameter (%@.%@) in metadata, expected numbers."), CFSTR("DediscoTaskConfig"), CFSTR("MinBatchSize"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    _DPPrivacyBudgetError(8, v44);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DPLog framework](_DPLog, "framework");
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_44;
LABEL_43:
    +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();
LABEL_44:

    v39 = a5;
    if (a5)
    {
      v40 = objc_retainAutorelease(v24);
      v24 = v40;
LABEL_29:
      *v39 = v40;
    }
    goto LABEL_30;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DPConfig"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v36 = 1;
    goto LABEL_32;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DPConfig"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v23 = objc_opt_isKindOfClass();

  if ((v23 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed parameter (%@.%@) in metadata, expected a dictionary."), CFSTR("DediscoTaskConfig"), CFSTR("DPConfig"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    _DPPrivacyBudgetError(8, v46);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DPLog framework](_DPLog, "framework");
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_44;
    goto LABEL_43;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DPConfig"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v63[0] = CFSTR("LocalEpsilon");
  v63[1] = CFSTR("TargetCentralEpsilon");
  v63[2] = CFSTR("TargetCentralDelta");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v56;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v56 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v24, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v31 = objc_opt_isKindOfClass();

        if ((v31 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed parameter (%@.%@.%@) in metadata, expected numbers."), CFSTR("DediscoTaskConfig"), CFSTR("DPConfig"), v29);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          _DPPrivacyBudgetError(8, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          +[_DPLog framework](_DPLog, "framework");
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

          v15 = v54;
          if (a5)
            *a5 = objc_retainAutorelease(v48);

          goto LABEL_51;
        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      if (v26)
        continue;
      break;
    }
  }

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Mechanism"));
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Mechanism"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = objc_opt_isKindOfClass();

    if ((v35 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed parameter (%@.%@.%@) in metadata, expected a string."), CFSTR("DediscoTaskConfig"), CFSTR("DPConfig"), CFSTR("Mechanism"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      _DPPrivacyBudgetError(8, v50);
      obj = (id)objc_claimAutoreleasedReturnValue();

      +[_DPLog framework](_DPLog, "framework");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

      if (a5)
      {
        obj = objc_retainAutorelease(obj);
        *a5 = obj;
      }
      v15 = v54;
LABEL_51:

LABEL_30:
LABEL_31:
      v36 = 0;
      goto LABEL_32;
    }
  }

  v36 = 1;
  v15 = v54;
LABEL_32:

LABEL_33:
  return v36;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDictionary)plistParameters
{
  return self->_plistParameters;
}

- (_DPPrivacyBudgetAnalysis)analysis
{
  return self->_analysis;
}

- (_DPApproximateDP)targetADP
{
  return self->_targetADP;
}

- (_DPApproximateDP)maxADP
{
  return self->_maxADP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxADP, 0);
  objc_storeStrong((id *)&self->_targetADP, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_plistParameters, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

+ (void)budgetAuditorFromMetadata:(uint64_t)a3 plistParameters:(uint64_t)a4 isInternalBuild:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1D3FAA000, a1, a3, "Unable to infer DP budget auditor from donation metadata, using default symmetric RAPPOR legacy auditor.", a5, a6, a7, a8, 0);
}

+ (void)budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)auditedMetadataWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1D3FAA000, a1, a3, "DP budget auditing is bypassed.", a5, a6, a7, a8, 0);
}

+ (void)targetApproximateDPFromDPConfig:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)maxApproximateDPFromPlist:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
