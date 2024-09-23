@implementation _DPSymmetricRAPPORWithOHE

- (_DPSymmetricRAPPORWithOHE)initWithBatchSize:(unsigned int)a3 localEpsilon:(double)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  NSObject *v11;
  _DPSymmetricRAPPORWithOHE *v12;
  _DPSymmetricRAPPORWithOHE *v13;
  objc_super v15;

  if (!+[_DPApproximateDP isValidEpsilon:error:](_DPApproximateDP, "isValidEpsilon:error:", a5))
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (a4 > 16.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Local epsilon %f exceeds the maximum allowed local epsilon %f."), *(_QWORD *)&a4, 0x4030000000000000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _DPPrivacyBudgetError(1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DPLog framework](_DPLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    goto LABEL_11;
  }
  if (!a3)
  {
    _DPPrivacyBudgetError(1, CFSTR("Batch size must be greater than 0."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPLog framework](_DPLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
LABEL_10:
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();
LABEL_11:

    if (a5)
      *a5 = objc_retainAutorelease(v10);

    goto LABEL_14;
  }
  v15.receiver = self;
  v15.super_class = (Class)_DPSymmetricRAPPORWithOHE;
  v12 = -[_DPSymmetricRAPPORWithOHE init](&v15, sel_init);
  if (v12)
  {
    v12->_batchSize = a3;
    v12->_localEpsilon = a4;
  }
  self = v12;
  v13 = self;
LABEL_15:

  return v13;
}

- (id)exceedApproximateDPBudget:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "delta");
  -[_DPSymmetricRAPPORWithOHE approximateDPBudgetForDelta:error:](self, "approximateDPBudgetForDelta:error:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "exceed:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)renyiDPBudgetsForAlphas:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unsigned int v12;
  NSObject *v13;
  long double v14;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  unint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t j;
  void *v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  _DPRenyiDP *v48;
  _DPRenyiDP *v49;
  id v50;
  id v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v60;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v60 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "doubleValue");
          if (!+[_DPRenyiDP isValidAlpha:error:](_DPRenyiDP, "isValidAlpha:error:", a4))
          {
            v50 = 0;
            v51 = v7;
            goto LABEL_46;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        if (v9)
          continue;
        break;
      }
    }

    v12 = -[_DPSymmetricRAPPORWithOHE batchSize](self, "batchSize");
    if (v12 > 0x989680)
    {
      +[_DPLog framework](_DPLog, "framework");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[_DPSymmetricRAPPORWithOHE renyiDPBudgetsForAlphas:error:].cold.3(v13);

      v12 = 10000000;
    }
    v58 = v6;
    -[_DPSymmetricRAPPORWithOHE localEpsilon](self, "localEpsilon");
    v15 = exp(v14);
    -[_DPSymmetricRAPPORWithOHE localEpsilon](self, "localEpsilon");
    v17 = v15 / (exp(v16) + 1.0);
    v18 = objc_msgSend(v7, "count");
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * v18);
    v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v57, "bytes");
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * v18);
    v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v56, "bytes");
    v21 = v20;
    if (v18)
    {
      v22 = (_QWORD *)v20;
      v23 = (_QWORD *)v19;
      v24 = v18;
      do
      {
        *v22++ = 0xFFF0000000000000;
        *v23++ = 0xFFF0000000000000;
        --v24;
      }
      while (v24);
    }
    v25 = 0;
    v26 = 1.0 - v17;
    v27 = v12 - 1;
    v28 = v12 + 1;
    v29 = 0.0;
    v30 = 0.0;
    do
    {
      v31 = v29;
      if (v25 <= v27)
      {
        +[_DPSymmetricRAPPORWithOHE logBinomialCoefForN:x:prevLogBinomCoef:](_DPSymmetricRAPPORWithOHE, "logBinomialCoefForN:x:prevLogBinomCoef:", v27, v25, v30);
        v30 = v32;
        +[_DPSymmetricRAPPORWithOHE binomialPMFForN:p:x:logBinomCoef:](_DPSymmetricRAPPORWithOHE, "binomialPMFForN:p:x:logBinomCoef:", v27, v25, 1.0 - v17, v32);
        v29 = v33;
      }
      else
      {
        v29 = 0.0;
      }
      v34 = v26 * v31 + v17 * v29;
      if (v34 != 0.0)
      {
        v35 = v17 * v31 + v26 * v29;
        if (v35 != 0.0)
        {
          v36 = log(v34);
          v34 = log(v35);
          if (v18)
          {
            v37 = v34;
            for (j = 0; j != v18; ++j)
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:", j);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              v41 = v40;

              *(long double *)(v19 + 8 * j) = logaddexp(*(double *)(v19 + 8 * j), v37 * v41 + (1.0 - v41) * v36);
              v34 = logaddexp(*(double *)(v21 + 8 * j), v36 * v41 + (1.0 - v41) * v37);
              *(double *)(v21 + 8 * j) = v34;
            }
          }
        }
      }
      ++v25;
    }
    while (v25 != v28);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18, v34);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v43 = 0;
      while (1)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        v46 = v45;

        v47 = *(double *)(v19 + 8 * v43);
        if (v47 <= *(double *)(v21 + 8 * v43))
          v47 = *(double *)(v21 + 8 * v43);
        v48 = -[_DPRenyiDP initWithAlpha:tau:error:]([_DPRenyiDP alloc], "initWithAlpha:tau:error:", a4, v46, v47 / (v46 + -1.0) + v47 / (v46 + -1.0));
        if (!v48)
          break;
        v49 = v48;
        objc_msgSend(v42, "addObject:", v48);

        if (v18 == ++v43)
          goto LABEL_33;
      }
      _DPPrivacyBudgetError(2, CFSTR("Failed to analyze Renyi-DP tau. The computed tau is not a finite value."));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPLog framework](_DPLog, "framework");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

      v51 = v57;
      if (a4)
        *a4 = objc_retainAutorelease(v53);

      v50 = 0;
    }
    else
    {
LABEL_33:
      v50 = v42;
      v51 = v57;
    }

    v6 = v58;
  }
  else
  {
    _DPPrivacyBudgetError(1, CFSTR("Renyi-DP alpha list cannot be empty"));
    v51 = (id)objc_claimAutoreleasedReturnValue();
    +[_DPLog framework](_DPLog, "framework");
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

    if (a4)
    {
      v51 = objc_retainAutorelease(v51);
      v50 = 0;
      *a4 = v51;
    }
    else
    {
      v50 = 0;
    }
  }
LABEL_46:

  return v50;
}

- (id)approximateDPBudgetForDelta:(double)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (+[_DPApproximateDP isValidDelta:error:](_DPApproximateDP, "isValidDelta:error:"))
  {
    +[_DPRenyiDP defaultAlphas](_DPRenyiDP, "defaultAlphas");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPSymmetricRAPPORWithOHE renyiDPBudgetsForAlphas:error:](self, "renyiDPBudgetsForAlphas:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "approximateDPForDelta:error:", a4, a3, (_QWORD)v23);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v15)
            {

              v21 = 0;
              goto LABEL_20;
            }
            v16 = v15;
            if (!v12 || (objc_msgSend(v15, "epsilon"), v18 = v17, objc_msgSend(v12, "epsilon"), v18 < v19))
            {
              v20 = v16;

              v12 = v20;
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v11)
            continue;
          break;
        }
      }
      else
      {
        v12 = 0;
      }

      v12 = v12;
      v21 = v12;
LABEL_20:

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }
  return v21;
}

+ (double)logBinomialCoefForN:(unint64_t)a3 x:(unint64_t)a4 prevLogBinomCoef:(double)a5
{
  double result;
  long double v9;

  result = 0.0;
  if (a4)
  {
    if (a4 < a3)
    {
      v9 = a5 - log((double)a4);
      return v9 + log((double)(a3 - a4 + 1));
    }
  }
  return result;
}

+ (double)binomialPMFForN:(unint64_t)a3 p:(double)a4 x:(unint64_t)a5 logBinomCoef:(double)a6
{
  long double v9;
  long double v10;

  v9 = a6 + (double)a5 * log(a4);
  v10 = v9 + (double)(a3 - a5) * log(1.0 - a4);
  return exp(v10);
}

- (unsigned)batchSize
{
  return self->_batchSize;
}

- (double)localEpsilon
{
  return self->_localEpsilon;
}

- (void)renyiDPBudgetsForAlphas:(os_log_t)log error:.cold.3(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 10000000;
  _os_log_debug_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_DEBUG, "Cap batch size at %u to keep computation time of symmetric RAPPOR analysis in reasonable range.", (uint8_t *)v1, 8u);
}

@end
