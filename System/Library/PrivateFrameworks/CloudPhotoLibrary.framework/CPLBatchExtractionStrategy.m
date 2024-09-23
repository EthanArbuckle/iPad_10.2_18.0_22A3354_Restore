@implementation CPLBatchExtractionStrategy

- (CPLBatchExtractionStrategy)initWithName:(id)a3 storage:(id)a4 scopeIdentifier:(id)a5 steps:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CPLBatchExtractionStrategy *v14;
  uint64_t v15;
  NSString *strategyName;
  uint64_t v17;
  NSString *scopeIdentifier;
  uint64_t v19;
  NSArray *steps;
  uint64_t v21;
  NSString *name;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CPLBatchExtractionStrategy;
  v14 = -[CPLBatchExtractionStrategy init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    strategyName = v14->_strategyName;
    v14->_strategyName = (NSString *)v15;

    objc_storeWeak((id *)&v14->_storage, v11);
    v17 = objc_msgSend(v12, "copy");
    scopeIdentifier = v14->_scopeIdentifier;
    v14->_scopeIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    steps = v14->_steps;
    v14->_steps = (NSArray *)v19;

    v21 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v21;

  }
  return v14;
}

- (BOOL)_hasChanges
{
  CPLBatchExtractionStrategy *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "hasChangesInScopeWithIdentifier:", v2->_scopeIdentifier);

  return (char)v2;
}

- (void)_computeNextStep
{
  CPLBatchExtractionStep *currentStep;
  NSEnumerator *v4;
  NSEnumerator *stepEnumerator;
  CPLBatchExtractionStep *v6;
  CPLBatchExtractionStep *v7;
  CPLBatchExtractionStep *v8;
  CPLBatchExtractionStep *v9;

  currentStep = self->_currentStep;
  if (currentStep)
    -[CPLBatchExtractionStep reset](currentStep, "reset");
  if (!self->_stepEnumerator)
  {
    -[NSArray objectEnumerator](self->_steps, "objectEnumerator");
    v4 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    stepEnumerator = self->_stepEnumerator;
    self->_stepEnumerator = v4;

  }
  self->_loggedForThisStep = 0;
  if (-[CPLBatchExtractionStrategy _hasChanges](self, "_hasChanges"))
  {
    -[NSEnumerator nextObject](self->_stepEnumerator, "nextObject");
    v6 = (CPLBatchExtractionStep *)objc_claimAutoreleasedReturnValue();
    v7 = self->_currentStep;
    self->_currentStep = v6;

    v8 = self->_currentStep;
    if (v8)
      -[CPLBatchExtractionStep reset](v8, "reset");
  }
  else
  {
    v9 = self->_currentStep;
    self->_currentStep = 0;

  }
}

- (BOOL)extractBatch:(id *)a3 maximumResourceSize:(unint64_t)a4 error:(id *)a5
{
  CPLBatchExtractionStrategy *v5;
  BOOL v6;
  unint64_t v8;
  id *p_storage;
  id WeakRetained;
  CPLExtractedBatch *v12;
  void *v13;
  __int128 v14;
  uint64_t maximumRecordCountPerBatch;
  unint64_t v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  CPLExtractedBatch *v21;
  unint64_t v22;
  void *v23;
  id *v24;
  id *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  NSObject *v34;
  void *v35;
  void *v36;
  __int128 v37;
  id *v38;
  CPLBatchExtractionStrategy *v39;
  unint64_t v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v5 = self;
  v43 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_ERROR, "can't extract batches with no size", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStrategy.m");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, v36, 274, CFSTR("can't extract batches with no size"));

    abort();
  }
  if (self->_finished)
    return 1;
  v8 = a4;
  if (!self->_currentStep)
  {
    if (!-[CPLBatchExtractionStrategy _hasChanges](self, "_hasChanges"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLStrategyOSLogDomain();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_DEBUG, "No changes to extract, finishing immediately", buf, 2u);
        }

      }
      v6 = 1;
      v5->_finished = 1;
      return v6;
    }
    if (!v5->_currentStep)
      -[CPLBatchExtractionStrategy _computeNextStep](v5, "_computeNextStep");
  }
  v38 = a3;
  *a3 = 0;
  p_storage = (id *)&v5->_storage;
  WeakRetained = objc_loadWeakRetained((id *)&v5->_storage);
  objc_msgSend(WeakRetained, "beginExtractingBatch");

  v12 = objc_alloc_init(CPLExtractedBatch);
  -[CPLExtractedBatch batch](v12, "batch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  maximumRecordCountPerBatch = v5->_maximumRecordCountPerBatch;
  if (!maximumRecordCountPerBatch)
    maximumRecordCountPerBatch = _CPLMaximumBatchSize;
  v40 = maximumRecordCountPerBatch;
  if (v5->_currentStep)
  {
    *(_QWORD *)&v14 = 138543362;
    v37 = v14;
    v39 = v5;
    while (1)
    {
      v16 = objc_msgSend(v13, "count", v37);
      v17 = objc_loadWeakRetained(p_storage);
      v18 = -[CPLExtractedBatch effectiveResourceSizeToUploadUsingStorage:](v12, "effectiveResourceSizeToUploadUsingStorage:", v17);

      if (v40 <= v16 || (v19 = v8 - v18, v8 <= v18))
      {
        -[CPLExtractedBatch setFull:](v12, "setFull:", 1);
        goto LABEL_39;
      }
      if (!_CPLSilentLogging)
      {
        __CPLStrategyOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[CPLBatchExtractionStep shortDescription](v5->_currentStep, "shortDescription");
          v21 = v12;
          v22 = v8;
          v23 = v13;
          v24 = a5;
          v25 = p_storage;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v42 = v26;
          _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEBUG, "Will extract changes to batch with %@", buf, 0xCu);

          p_storage = v25;
          a5 = v24;
          v13 = v23;
          v8 = v22;
          v12 = v21;
          v5 = v39;
        }

      }
      if (!-[CPLBatchExtractionStep extractToBatch:maximumCount:maximumResourceSize:error:](v5->_currentStep, "extractToBatch:maximumCount:maximumResourceSize:error:", v12, v40 - v16, v19, a5))break;
      if (!v5->_loggedForThisStep && objc_msgSend(v13, "count") > v16)
      {
        v5->_loggedForThisStep = 1;
        if (!_CPLSilentLogging)
        {
          __CPLStrategyOSLogDomain();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            -[CPLBatchExtractionStep shortDescription](v5->_currentStep, "shortDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v37;
            v42 = v28;
            _os_log_impl(&dword_1B03C2000, v27, OS_LOG_TYPE_DEFAULT, "Extracting batches with %{public}@", buf, 0xCu);

          }
        }
      }
      if (!-[CPLExtractedBatch isFull](v12, "isFull"))
      {
        -[CPLBatchExtractionStrategy _computeNextStep](v5, "_computeNextStep");
        if (v5->_currentStep)
          continue;
        if (!_CPLSilentLogging)
        {
          __CPLStrategyOSLogDomain();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_DEFAULT, "Done extracting batches", buf, 2u);
          }

        }
        -[CPLBatchExtractionStrategy reset](v5, "reset");
        v5->_finished = 1;
        if (v5->_currentStep)
          continue;
      }
      goto LABEL_39;
    }
    v6 = 0;
  }
  else
  {
LABEL_39:
    if (objc_msgSend(v13, "count"))
      *v38 = objc_retainAutorelease(v12);
    v6 = 1;
  }
  v31 = objc_loadWeakRetained(p_storage);
  objc_msgSend(v31, "cleanupAfterExtractingBatch");

  return v6;
}

- (void)reset
{
  CPLBatchExtractionStep *currentStep;
  CPLBatchExtractionStep *v4;
  NSEnumerator *stepEnumerator;

  currentStep = self->_currentStep;
  if (currentStep)
  {
    -[CPLBatchExtractionStep reset](currentStep, "reset");
    v4 = self->_currentStep;
  }
  else
  {
    v4 = 0;
  }
  self->_currentStep = 0;

  stepEnumerator = self->_stepEnumerator;
  self->_stepEnumerator = 0;

  *(_WORD *)&self->_loggedForThisStep = 0;
}

- (void)resetConditionallyFromNewIncomingChange:(id)a3
{
  id v4;
  NSObject *v5;
  id *p_currentStep;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_finished)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStrategyOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Resetting finished strategy because of %@", (uint8_t *)&v14, 0xCu);
      }

    }
    -[CPLBatchExtractionStrategy reset](self, "reset");
  }
  else
  {
    p_currentStep = (id *)&self->_currentStep;
    if (self->_currentStep)
    {
      -[NSArray objectEnumerator](self->_steps, "objectEnumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      while (1)
      {
        v9 = v8;
        objc_msgSend(v7, "nextObject");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (!v8 || v8 == *p_currentStep)
          break;
        if (objc_msgSend(v8, "shouldResetFromThisStepWithIncomingChange:", v4))
        {
          objc_msgSend(*p_currentStep, "reset");
          objc_storeStrong((id *)&self->_currentStep, v8);
          objc_msgSend(*p_currentStep, "reset");
          if (!_CPLSilentLogging)
          {
            __CPLStrategyOSLogDomain();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(*p_currentStep, "shortDescription");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = 138412546;
              v15 = v11;
              v16 = 2112;
              v17 = v4;
              _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Resetting strategy to %@ because of %@", (uint8_t *)&v14, 0x16u);

            }
          }
          objc_storeStrong((id *)&self->_stepEnumerator, v7);
          goto LABEL_22;
        }
      }
      if (!_CPLSilentLogging)
      {
        __CPLStrategyOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*p_currentStep, "shortDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412546;
          v15 = v13;
          v16 = 2112;
          v17 = v4;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "Resetting %@ conditionnally because of %@", (uint8_t *)&v14, 0x16u);

        }
      }
      objc_msgSend(*p_currentStep, "resetConditionallyFromNewIncomingChange:", v4);
LABEL_22:

    }
  }

}

- (NSString)currentStepDescription
{
  CPLBatchExtractionStep *currentStep;
  __CFString *v4;

  currentStep = self->_currentStep;
  if (currentStep)
  {
    -[CPLBatchExtractionStep shortDescription](currentStep, "shortDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_finished)
      return (NSString *)CFSTR("start");
    v4 = CFSTR("end");
  }
  return (NSString *)v4;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[CPLBatchExtractionStrategy name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@>"), v4, v5);

  return v6;
}

- (NSString)stepsDescription
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_steps, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_steps;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "shortDescription", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(">"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)cplFullDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[CPLBatchExtractionStrategy name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLBatchExtractionStrategy stepsDescription](self, "stepsDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@ %@>"), v4, v5, v6);

  return v7;
}

- (NSString)strategyName
{
  return self->_strategyName;
}

- (CPLBatchExtractionStrategyStorage)storage
{
  return (CPLBatchExtractionStrategyStorage *)objc_loadWeakRetained((id *)&self->_storage);
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (unint64_t)maximumRecordCountPerBatch
{
  return self->_maximumRecordCountPerBatch;
}

- (void)setMaximumRecordCountPerBatch:(unint64_t)a3
{
  self->_maximumRecordCountPerBatch = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_strategyName, 0);
  objc_storeStrong((id *)&self->_currentStep, 0);
  objc_storeStrong((id *)&self->_stepEnumerator, 0);
  objc_storeStrong((id *)&self->_steps, 0);
}

+ (void)setMaximumRecordCountPerBatch:(unint64_t)a3
{
  unint64_t v3;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = 100;
  if (a3)
    v3 = a3;
  if (v3 <= 1)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Maximum record count is too low", v9, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStrategy.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v8, 61, CFSTR("Maximum record count is too low"));

    abort();
  }
  _CPLMaximumBatchSize = v3;
}

+ (unint64_t)maximumRecordCountPerBatch
{
  return _CPLMaximumBatchSize;
}

+ (unint64_t)minimumRecordCountPerBatch
{
  return 10;
}

+ (unint64_t)maximumAlbumsPerBatch
{
  if ((unint64_t)_maximumAlbumsPerBatch <= 1)
    return 1;
  else
    return _maximumAlbumsPerBatch;
}

+ (void)setMaximumAlbumsPerBatch:(unint64_t)a3
{
  _maximumAlbumsPerBatch = a3;
}

+ (id)usualStrategyWithStorage:(id)a3 coveringScopeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  CPLByClassExtractionStep *v68;
  uint64_t v69;
  id v70;
  id v71;
  CPLDeleteChainedRecordExtractionStep *v72;
  uint64_t v73;
  id v74;
  id v75;
  CPLByClassExtractionStep *v76;
  uint64_t v77;
  id v78;
  id v79;
  CPLByClassExtractionStep *v80;
  uint64_t v81;
  id v82;
  id v83;
  CPLDeleteChainedRecordExtractionStep *v84;
  id v85;
  id v86;
  CPLByClassExtractionStep *v87;
  void *v88;
  id v89;
  CPLByClassExtractionStep *v91;
  CPLByClassExtractionStep *v92;
  CPLByClassExtractionStep *v93;
  CPLByClassExtractionStep *v94;
  CPLByClassExtractionStep *v95;
  CPLByClassExtractionStep *v96;
  CPLByClassExtractionStep *v97;
  CPLByClassExtractionStep *v98;
  CPLByClassExtractionStep *v99;
  CPLByClassExtractionStep *v100;
  CPLByClassExtractionStep *v101;
  CPLByClassExtractionStep *v102;
  CPLByClassExtractionStep *v103;
  CPLByClassExtractionStep *v104;
  CPLByClassExtractionStep *v105;
  CPLNewChainedRecordExtractionStep *v106;
  CPLByClassExtractionStep *v107;
  id v108;
  CPLNewAssetExtractionStep *v109;
  CPLNewChainedRecordExtractionStep *v110;
  id v111;
  id v112;
  _QWORD v113[27];

  v113[25] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (usualStrategyWithStorage_coveringScopeIdentifier__onceToken != -1)
    dispatch_once(&usualStrategyWithStorage_coveringScopeIdentifier__onceToken, &__block_literal_global_3485);
  if (usualStrategyWithStorage_coveringScopeIdentifier__forceOverQuotaStrategy)
  {
    objc_msgSend(a1, "overQuotaStrategyWithStorage:coveringScopeIdentifier:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v108 = objc_alloc((Class)a1);
    v9 = objc_opt_class();
    v10 = v6;
    v112 = v6;
    v11 = v7;
    v110 = -[CPLNewChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLNewChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v10, v9, CFSTR("Person"), v11, -1);

    v113[0] = v110;
    v109 = -[CPLNewAssetExtractionStep initWithStorage:scopeIdentifier:maximumCount:]([CPLNewAssetExtractionStep alloc], "initWithStorage:scopeIdentifier:maximumCount:", v10, v11, -1);
    v113[1] = v109;
    v12 = objc_opt_class();
    v13 = v10;
    v14 = v11;
    v107 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v13, v14, CFSTR("New(Master)"), v12, -1, CPLStepNew);

    v113[2] = v107;
    v111 = v7;
    v15 = objc_opt_class();
    v16 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch](CPLBatchExtractionStrategy, "maximumAlbumsPerBatch");
    v17 = v13;
    v18 = v14;
    v106 = -[CPLNewChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLNewChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v17, v15, CFSTR("Album"), v18, v16);

    v113[3] = v106;
    v19 = objc_opt_class();
    v20 = v17;
    v21 = v18;
    v105 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v20, v21, CFSTR("NotDeleted(Person)"), v19, -1, CPLStepNotDeleted);

    v113[4] = v105;
    v22 = objc_opt_class();
    v23 = v20;
    v24 = v21;
    v104 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v23, v24, CFSTR("NotDeleted(FaceCrop)"), v22, 10, CPLStepNotDeleted);

    v113[5] = v104;
    v25 = objc_opt_class();
    v26 = v23;
    v27 = v24;
    v103 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v26, v27, CFSTR("NotDeleted(Asset)"), v25, -1, CPLStepNotDeleted);

    v113[6] = v103;
    v28 = objc_opt_class();
    v29 = v26;
    v30 = v27;
    v102 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v29, v30, CFSTR("New(ContainerRelation)"), v28, -1, CPLStepNew);

    v113[7] = v102;
    v31 = objc_opt_class();
    v32 = v29;
    v33 = v30;
    v101 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v32, v33, CFSTR("NotDeleted(Master)"), v31, -1, CPLStepNotDeleted);

    v113[8] = v101;
    v34 = objc_opt_class();
    v35 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch](CPLBatchExtractionStrategy, "maximumAlbumsPerBatch");
    v36 = v32;
    v37 = v33;
    v100 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v36, v37, CFSTR("NotDeleted(Album)"), v34, v35, CPLStepNotDeleted);

    v113[9] = v100;
    v38 = objc_opt_class();
    v39 = v36;
    v40 = v37;
    v99 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v39, v40, CFSTR("NotDeleted(Container)"), v38, -1, CPLStepNotDeleted);

    v113[10] = v99;
    v41 = objc_opt_class();
    v42 = v39;
    v43 = v40;
    v98 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v42, v43, CFSTR("NotDeleted(ContainerRelation)"), v41, -1, CPLStepNotDeleted);

    v113[11] = v98;
    v44 = objc_opt_class();
    v45 = v42;
    v46 = v43;
    v97 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v45, v46, CFSTR("NotDeleted(SocialGroup)"), v44, 5, CPLStepNotDeleted);

    v113[12] = v97;
    v47 = objc_opt_class();
    v48 = v45;
    v49 = v46;
    v96 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v48, v49, CFSTR("Deleted(SocialGroup)"), v47, -1, CPLStepDeleted);

    v113[13] = v96;
    v50 = objc_opt_class();
    v51 = v48;
    v52 = v49;
    v95 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v51, v52, CFSTR("NotDeleted(Memory)"), v50, 5, CPLStepNotDeleted);

    v113[14] = v95;
    v53 = objc_opt_class();
    v54 = v51;
    v55 = v52;
    v94 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v54, v55, CFSTR("Deleted(Memory)"), v53, -1, CPLStepDeleted);

    v113[15] = v94;
    v56 = objc_opt_class();
    v57 = v54;
    v58 = v55;
    v93 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v57, v58, CFSTR("NotDeleted(Suggestion)"), v56, 5, CPLStepNotDeleted);

    v113[16] = v93;
    v59 = objc_opt_class();
    v60 = v57;
    v61 = v58;
    v92 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v60, v61, CFSTR("Deleted(Suggestion)"), v59, -1, CPLStepDeleted);

    v113[17] = v92;
    v62 = objc_opt_class();
    v63 = v60;
    v64 = v61;
    v91 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v63, v64, CFSTR("Deleted(FaceCrop)"), v62, -1, CPLStepDeleted);

    v113[18] = v91;
    v65 = objc_opt_class();
    v66 = v63;
    v67 = v64;
    v68 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v66, v67, CFSTR("Deleted(ContainerRelation)"), v65, -1, CPLStepDeleted);

    v113[19] = v68;
    v69 = objc_opt_class();
    v70 = v66;
    v71 = v67;
    v72 = -[CPLDeleteChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLDeleteChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v70, v69, CFSTR("Album"), v71, -1);

    v113[20] = v72;
    v73 = objc_opt_class();
    v74 = v70;
    v75 = v71;
    v76 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v74, v75, CFSTR("Deleted(Asset)"), v73, -1, CPLStepDeleted);

    v113[21] = v76;
    v77 = objc_opt_class();
    v78 = v74;
    v79 = v75;
    v80 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v78, v79, CFSTR("Deleted(Master)"), v77, -1, CPLStepDeleted);

    v113[22] = v80;
    v81 = objc_opt_class();
    v82 = v78;
    v83 = v79;
    v84 = -[CPLDeleteChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLDeleteChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v82, v81, CFSTR("Person"), v83, -1);

    v113[23] = v84;
    v85 = v82;
    v86 = v83;
    v87 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v85, v86, CFSTR("All"), 0, -1, CPLStepAllChanges);

    v113[24] = v87;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 25);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v86;
    v7 = v111;
    v8 = (void *)objc_msgSend(v108, "initWithName:storage:scopeIdentifier:steps:", CFSTR("usual"), v85, v89, v88);

    v6 = v112;
  }

  return v8;
}

+ (id)overQuotaStrategyWithStorage:(id)a3 coveringScopeIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  CPLByClassExtractionStep *v67;
  uint64_t v68;
  id v69;
  id v70;
  CPLByClassExtractionStep *v71;
  uint64_t v72;
  id v73;
  id v74;
  CPLDeleteChainedRecordExtractionStep *v75;
  uint64_t v76;
  id v77;
  id v78;
  CPLByClassExtractionStep *v79;
  uint64_t v80;
  id v81;
  id v82;
  CPLDeleteChainedRecordExtractionStep *v83;
  id v84;
  id v85;
  CPLByClassExtractionStep *v86;
  void *v87;
  void *v88;
  CPLByClassExtractionStep *v90;
  CPLByClassExtractionStep *v91;
  CPLByClassExtractionStep *v92;
  CPLByClassExtractionStep *v93;
  CPLByClassExtractionStep *v94;
  CPLByClassExtractionStep *v95;
  CPLByClassExtractionStep *v96;
  CPLByClassExtractionStep *v97;
  CPLByClassExtractionStep *v98;
  CPLByClassExtractionStep *v99;
  CPLByClassExtractionStep *v100;
  CPLByClassExtractionStep *v101;
  CPLByClassExtractionStep *v102;
  CPLNewChainedRecordExtractionStep *v103;
  CPLByClassExtractionStep *v104;
  CPLNewAssetExtractionStep *v105;
  CPLTrashedAssetExtractionStep *v106;
  CPLByClassExtractionStep *v107;
  id v108;
  CPLByClassExtractionStep *v109;
  CPLNewChainedRecordExtractionStep *v110;
  _QWORD v111[28];

  v111[26] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v108 = objc_alloc((Class)a1);
  v8 = objc_opt_class();
  v9 = v6;
  v10 = v7;
  v110 = -[CPLNewChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLNewChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v9, v8, CFSTR("Person"), v10, -1);

  v111[0] = v110;
  v11 = objc_opt_class();
  v12 = v9;
  v13 = v10;
  v109 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v12, v13, CFSTR("Deleted(ContainerRelation)"), v11, -1, CPLStepDeleted);

  v111[1] = v109;
  v14 = objc_opt_class();
  v15 = v12;
  v16 = v13;
  v107 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v15, v16, CFSTR("Deleted(Asset)"), v14, -1, CPLStepDeleted);

  v111[2] = v107;
  v106 = -[CPLTrashedAssetExtractionStep initWithStorage:scopeIdentifier:maximumCount:]([CPLTrashedAssetExtractionStep alloc], "initWithStorage:scopeIdentifier:maximumCount:", v15, v16, -1);
  v111[3] = v106;
  v105 = -[CPLNewAssetExtractionStep initWithStorage:scopeIdentifier:maximumCount:]([CPLNewAssetExtractionStep alloc], "initWithStorage:scopeIdentifier:maximumCount:", v15, v16, -1);
  v111[4] = v105;
  v17 = objc_opt_class();
  v18 = v15;
  v19 = v16;
  v104 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v18, v19, CFSTR("New(Master)"), v17, -1, CPLStepNew);

  v111[5] = v104;
  v20 = objc_opt_class();
  v21 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch](CPLBatchExtractionStrategy, "maximumAlbumsPerBatch");
  v22 = v18;
  v23 = v19;
  v103 = -[CPLNewChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLNewChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v22, v20, CFSTR("Album"), v23, v21);

  v111[6] = v103;
  v24 = objc_opt_class();
  v25 = v22;
  v26 = v23;
  v102 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v25, v26, CFSTR("NotDeleted(Person)"), v24, -1, CPLStepNotDeleted);

  v111[7] = v102;
  v27 = objc_opt_class();
  v28 = v25;
  v29 = v26;
  v101 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v28, v29, CFSTR("NotDeleted(FaceCrop)"), v27, 10, CPLStepNotDeleted);

  v111[8] = v101;
  v30 = objc_opt_class();
  v31 = v28;
  v32 = v29;
  v100 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v31, v32, CFSTR("NotDeleted(Asset)"), v30, -1, CPLStepNotDeleted);

  v111[9] = v100;
  v33 = objc_opt_class();
  v34 = v31;
  v35 = v32;
  v99 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v34, v35, CFSTR("NotDeleted(Master)"), v33, -1, CPLStepNotDeleted);

  v111[10] = v99;
  v36 = objc_opt_class();
  v37 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch](CPLBatchExtractionStrategy, "maximumAlbumsPerBatch");
  v38 = v34;
  v39 = v35;
  v98 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v38, v39, CFSTR("NotDeleted(Album)"), v36, v37, CPLStepNotDeleted);

  v111[11] = v98;
  v40 = objc_opt_class();
  v41 = v38;
  v42 = v39;
  v97 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v41, v42, CFSTR("NotDeleted(Container)"), v40, -1, CPLStepNotDeleted);

  v111[12] = v97;
  v43 = objc_opt_class();
  v44 = v41;
  v45 = v42;
  v96 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v44, v45, CFSTR("New(ContainerRelation)"), v43, -1, CPLStepNew);

  v111[13] = v96;
  v46 = objc_opt_class();
  v47 = v44;
  v48 = v45;
  v95 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v47, v48, CFSTR("NotDeleted(ContainerRelation)"), v46, -1, CPLStepNotDeleted);

  v111[14] = v95;
  v49 = objc_opt_class();
  v50 = v47;
  v51 = v48;
  v94 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v50, v51, CFSTR("NotDeleted(SocialGroup)"), v49, 5, CPLStepNotDeleted);

  v111[15] = v94;
  v52 = objc_opt_class();
  v53 = v50;
  v54 = v51;
  v93 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v53, v54, CFSTR("Deleted(SocialGroup)"), v52, -1, CPLStepDeleted);

  v111[16] = v93;
  v55 = objc_opt_class();
  v56 = v53;
  v57 = v54;
  v92 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v56, v57, CFSTR("NotDeleted(Memory)"), v55, 5, CPLStepNotDeleted);

  v111[17] = v92;
  v58 = objc_opt_class();
  v59 = v56;
  v60 = v57;
  v91 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v59, v60, CFSTR("Deleted(Memory)"), v58, -1, CPLStepDeleted);

  v111[18] = v91;
  v61 = objc_opt_class();
  v62 = v59;
  v63 = v60;
  v90 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v62, v63, CFSTR("NotDeleted(Suggestion)"), v61, 5, CPLStepNotDeleted);

  v111[19] = v90;
  v64 = objc_opt_class();
  v65 = v62;
  v66 = v63;
  v67 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v65, v66, CFSTR("Deleted(Suggestion)"), v64, -1, CPLStepDeleted);

  v111[20] = v67;
  v68 = objc_opt_class();
  v69 = v65;
  v70 = v66;
  v71 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v69, v70, CFSTR("Deleted(FaceCrop)"), v68, -1, CPLStepDeleted);

  v111[21] = v71;
  v72 = objc_opt_class();
  v73 = v69;
  v74 = v70;
  v75 = -[CPLDeleteChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLDeleteChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v73, v72, CFSTR("Album"), v74, -1);

  v111[22] = v75;
  v76 = objc_opt_class();
  v77 = v73;
  v78 = v74;
  v79 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v77, v78, CFSTR("Deleted(Master)"), v76, -1, CPLStepDeleted);

  v111[23] = v79;
  v80 = objc_opt_class();
  v81 = v77;
  v82 = v78;
  v83 = -[CPLDeleteChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLDeleteChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v81, v80, CFSTR("Person"), v82, -1);

  v111[24] = v83;
  v84 = v81;
  v85 = v82;
  v86 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v84, v85, CFSTR("All"), 0, -1, CPLStepAllChanges);

  v111[25] = v86;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 26);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v108, "initWithName:storage:scopeIdentifier:steps:", CFSTR("overQuota"), v84, v85, v87);

  return v88;
}

+ (id)minglingStrategyWithStorage:(id)a3 coveringScopeIdentifier:(id)a4 maximumBatchSize:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  CPLByClassExtractionStep *v55;
  uint64_t v56;
  id v57;
  id v58;
  CPLByClassExtractionStep *v59;
  uint64_t v60;
  id v61;
  id v62;
  CPLDeleteChainedRecordExtractionStep *v63;
  uint64_t v64;
  id v65;
  id v66;
  CPLByClassExtractionStep *v67;
  id v68;
  id v69;
  CPLByClassExtractionStep *v70;
  void *v71;
  void *v72;
  CPLDeleteChainedRecordExtractionStep *v74;
  CPLByClassExtractionStep *v75;
  CPLByClassExtractionStep *v76;
  CPLByClassExtractionStep *v77;
  CPLByClassExtractionStep *v78;
  CPLByClassExtractionStep *v79;
  CPLByClassExtractionStep *v80;
  CPLByClassExtractionStep *v81;
  CPLByClassExtractionStep *v82;
  CPLByClassExtractionStep *v83;
  CPLByClassExtractionStep *v84;
  CPLByClassExtractionStep *v85;
  CPLNewAssetExtractionStep *v86;
  CPLNewChainedRecordExtractionStep *v87;
  id v88;
  CPLNewChainedRecordExtractionStep *v89;
  _QWORD v91[22];

  v91[20] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v88 = objc_alloc((Class)a1);
  v9 = objc_opt_class();
  v10 = v7;
  v11 = v8;
  v89 = -[CPLNewChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLNewChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v10, v9, CFSTR("Person"), v11, -1);

  v91[0] = v89;
  v12 = objc_opt_class();
  v13 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch](CPLBatchExtractionStrategy, "maximumAlbumsPerBatch");
  v14 = v10;
  v15 = v11;
  v87 = -[CPLNewChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLNewChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v14, v12, CFSTR("Album"), v15, v13);

  v91[1] = v87;
  v86 = -[CPLNewAssetExtractionStep initWithStorage:scopeIdentifier:maximumCount:]([CPLNewAssetExtractionStep alloc], "initWithStorage:scopeIdentifier:maximumCount:", v14, v15, -1);
  v91[2] = v86;
  v16 = objc_opt_class();
  v17 = v14;
  v18 = v15;
  v85 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v17, v18, CFSTR("New(Master)"), v16, -1, CPLStepNew);

  v91[3] = v85;
  v19 = objc_opt_class();
  v20 = v17;
  v21 = v18;
  v84 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v20, v21, CFSTR("New(ContainerRelation)"), v19, -1, CPLStepNew);

  v91[4] = v84;
  v22 = objc_opt_class();
  v23 = v20;
  v24 = v21;
  v83 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v23, v24, CFSTR("New(FaceCrop)"), v22, 10, CPLStepNew);

  v91[5] = v83;
  v25 = objc_opt_class();
  v26 = v23;
  v27 = v24;
  v82 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v26, v27, CFSTR("New(SocialGroup)"), v25, 5, CPLStepNew);

  v91[6] = v82;
  v28 = objc_opt_class();
  v29 = v26;
  v30 = v27;
  v81 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v29, v30, CFSTR("Deleted(SocialGroup)"), v28, -1, CPLStepDeleted);

  v91[7] = v81;
  v31 = objc_opt_class();
  v32 = v29;
  v33 = v30;
  v80 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v32, v33, CFSTR("New(Memory)"), v31, 5, CPLStepNew);

  v91[8] = v80;
  v34 = objc_opt_class();
  v35 = v32;
  v36 = v33;
  v79 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v35, v36, CFSTR("Deleted(Memory)"), v34, -1, CPLStepDeleted);

  v91[9] = v79;
  v37 = objc_opt_class();
  v38 = v35;
  v39 = v36;
  v78 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v38, v39, CFSTR("New(Suggestion)"), v37, 5, CPLStepNew);

  v91[10] = v78;
  v40 = objc_opt_class();
  v41 = v38;
  v42 = v39;
  v77 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v41, v42, CFSTR("Deleted(Suggestion)"), v40, -1, CPLStepDeleted);

  v91[11] = v77;
  v43 = objc_opt_class();
  v44 = v41;
  v45 = v42;
  v76 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v44, v45, CFSTR("Deleted(FaceCrop)"), v43, -1, CPLStepDeleted);

  v91[12] = v76;
  v46 = objc_opt_class();
  v47 = v44;
  v48 = v45;
  v75 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v47, v48, CFSTR("Deleted(ContainerRelation)"), v46, -1, CPLStepDeleted);

  v91[13] = v75;
  v49 = objc_opt_class();
  v50 = v47;
  v51 = v48;
  v74 = -[CPLDeleteChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLDeleteChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v50, v49, CFSTR("Album"), v51, -1);

  v91[14] = v74;
  v52 = objc_opt_class();
  v53 = v50;
  v54 = v51;
  v55 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v53, v54, CFSTR("Deleted(Asset)"), v52, -1, CPLStepDeleted);

  v91[15] = v55;
  v56 = objc_opt_class();
  v57 = v53;
  v58 = v54;
  v59 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v57, v58, CFSTR("Deleted(Master)"), v56, -1, CPLStepDeleted);

  v91[16] = v59;
  v60 = objc_opt_class();
  v61 = v57;
  v62 = v58;
  v63 = -[CPLDeleteChainedRecordExtractionStep initWithStorage:class:classDescription:scopeIdentifier:maximumCount:]([CPLDeleteChainedRecordExtractionStep alloc], "initWithStorage:class:classDescription:scopeIdentifier:maximumCount:", v61, v60, CFSTR("Person"), v62, -1);

  v91[17] = v63;
  v64 = objc_opt_class();
  v65 = v61;
  v66 = v62;
  v67 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v65, v66, CFSTR("Deleted(Record)"), v64, -1, CPLStepDeleted);

  v91[18] = v67;
  v68 = v65;
  v69 = v66;
  v70 = -[CPLByClassExtractionStep initWithStorage:scopeIdentifier:description:class:maximumCount:query:]([CPLByClassExtractionStep alloc], "initWithStorage:scopeIdentifier:description:class:maximumCount:query:", v68, v69, CFSTR("All"), 0, -1, CPLStepAllChanges);

  v91[19] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 20);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v88, "initWithName:storage:scopeIdentifier:steps:", CFSTR("mingling"), v68, v69, v71);

  if (a5)
    objc_msgSend(v72, "setMaximumRecordCountPerBatch:");

  return v72;
}

void __79__CPLBatchExtractionStrategy_usualStrategyWithStorage_coveringScopeIdentifier___block_invoke()
{
  void *v0;
  BOOL v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  usualStrategyWithStorage_coveringScopeIdentifier__forceOverQuotaStrategy = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPLForceOverQuotaStrategy"));

  if (usualStrategyWithStorage_coveringScopeIdentifier__forceOverQuotaStrategy)
    v1 = _CPLSilentLogging == 0;
  else
    v1 = 0;
  if (v1)
  {
    __CPLStrategyOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Forcing over quota stragegy", v3, 2u);
    }

  }
}

@end
