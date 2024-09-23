@implementation _DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor

- (_DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  _DPSymmetricRAPPORWithOHE *v29;
  _DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor *v30;
  void *v31;
  _DPHistogramWithAggregatorDiscreteGaussian *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor *v41;
  _DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor *v42;
  void *v43;
  NSObject *v44;
  void *v46;
  _DPSymmetricRAPPORWithOHE *v47;
  _DPHistogramWithAggregatorDiscreteGaussian *v48;
  unsigned int v49;
  void *v50;
  void *v52;
  id v53;
  objc_super v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  unsigned int v65;
  _QWORD v66[2];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v53 = a4;
  v50 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v66[0] = CFSTR("SigmaAfterNormalizing");
  v66[1] = CFSTR("LocalEpsilon");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v57 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed parameter (%@.%@.%@) in metadata, expected numbers."), CFSTR("DediscoTaskConfig"), CFSTR("DPConfig"), v13);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          _DPPrivacyBudgetError(8, v43);
          v17 = (id)objc_claimAutoreleasedReturnValue();

          +[_DPLog framework](_DPLog, "framework");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            -[_DPDediscoError logAndStoreInError:].cold.1((uint64_t)v17, v44);

          v18 = v52;
          v16 = v53;
          v31 = v50;
          v30 = self;
          if (a5)
          {
            v17 = objc_retainAutorelease(v17);
            v42 = 0;
            *a5 = v17;
          }
          else
          {
            v42 = 0;
          }
          goto LABEL_31;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = v53;
  +[_DPBudgetAuditor maxApproximateDPFromPlist:error:](_DPBudgetAuditor, "maxApproximateDPFromPlist:error:", v53, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[_DPBudgetAuditor targetApproximateDPFromDPConfig:error:](_DPBudgetAuditor, "targetApproximateDPFromDPConfig:error:", v7, a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v52;
    if (!v17)
      goto LABEL_25;
    objc_msgSend(v52, "objectForKeyedSubscript:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v19, "unsignedIntValue");

    v20 = v20 <= 5 ? 5 : v20;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SigmaAfterNormalizing"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LocalEpsilon"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("epsilon"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    LODWORD(v24) = +[_DPBudgetAuditor checkMetadataLocalEpsilon:defaultLocalEpsilon:error:](_DPBudgetAuditor, "checkMetadataLocalEpsilon:defaultLocalEpsilon:error:", a5, v26, v28);

    if ((_DWORD)v24)
    {
      v49 = v20;
      v29 = -[_DPSymmetricRAPPORWithOHE initWithBatchSize:localEpsilon:error:]([_DPSymmetricRAPPORWithOHE alloc], "initWithBatchSize:localEpsilon:error:", v20, a5, v26);
      v31 = v50;
      v30 = self;
      if (v29)
      {
        v32 = -[_DPHistogramWithAggregatorDiscreteGaussian initWithSigma:rappor:error:]([_DPHistogramWithAggregatorDiscreteGaussian alloc], "initWithSigma:rappor:error:", v29, a5, v23);
        if (v32)
        {
          v47 = v29;
          v48 = v32;
          +[_DPLog framework](_DPLog, "framework");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218496;
            v61 = v23;
            v62 = 2048;
            v63 = v26;
            v64 = 1024;
            v65 = v49;
            _os_log_debug_impl(&dword_1D3FAA000, v33, OS_LOG_TYPE_DEBUG, "Histogram with aggregator discrete Gaussian uses sigma = %f, symmetric RAPPOR local epsilon = %f, min batch size = %d", buf, 0x1Cu);
          }

          v46 = (void *)objc_msgSend(v50, "mutableCopy");
          objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v34, "mutableCopy");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v49);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, CFSTR("MinBatchSize"));

          v37 = (void *)objc_msgSend(v7, "mutableCopy");
          v38 = (void *)MEMORY[0x1E0CB37E8];
          -[_DPHistogramWithAggregatorDiscreteGaussian squaredL2Sensitivity](v48, "squaredL2Sensitivity");
          objc_msgSend(v38, "numberWithDouble:");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, CFSTR("SquaredL2Sensitivity"));

          objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("DPConfig"));
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v35, CFSTR("DediscoTaskConfig"));
          v40 = v46;

          v55.receiver = self;
          v55.super_class = (Class)_DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor;
          v41 = -[_DPBudgetAuditor initWithMetadata:plistParameters:targetADP:maxADP:analysis:error:](&v55, sel_initWithMetadata_plistParameters_targetADP_maxADP_analysis_error_, v40, v53, v17, v8, v48, a5);

          v30 = v41;
          v32 = v48;
          v31 = v40;
          v42 = v30;
          v29 = v47;
        }
        else
        {
          v42 = 0;
        }

      }
      else
      {
        v42 = 0;
      }

    }
    else
    {
LABEL_25:
      v42 = 0;
      v31 = v50;
      v30 = self;
    }
LABEL_31:

  }
  else
  {
    v42 = 0;
    v30 = self;
    v18 = v52;
    v31 = v50;
  }

  return v42;
}

@end
