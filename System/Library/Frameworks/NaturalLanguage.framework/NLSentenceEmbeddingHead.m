@implementation NLSentenceEmbeddingHead

- (NLSentenceEmbeddingHead)initWithModelURL:(id)a3
{
  id v5;
  NLSentenceEmbeddingHead *v6;
  NLSentenceEmbeddingHead *v7;
  MLModelConfiguration *v8;
  MLModelConfiguration *configuration;
  MLModel *model;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLSentenceEmbeddingHead;
  v6 = -[NLSentenceEmbeddingHead init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelURL, a3);
    v8 = (MLModelConfiguration *)objc_alloc_init(MEMORY[0x1E0C9E958]);
    configuration = v7->_configuration;
    v7->_configuration = v8;

    -[MLModelConfiguration setComputeUnits:](v7->_configuration, "setComputeUnits:", 0);
    -[MLModelConfiguration setExperimentalMLE5EngineUsage:](v7->_configuration, "setExperimentalMLE5EngineUsage:", 0);
    model = v7->_model;
    v7->_model = 0;

    v7->_inputDimension = 0;
    v7->_outputDimension = 0;
  }

  return v7;
}

- (BOOL)load
{
  BOOL v3;
  void *v4;
  NSURL *modelURL;
  MLModelConfiguration *configuration;
  MLModel *v7;
  id v8;
  MLModel *model;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (-[NLSentenceEmbeddingHead isLoaded](self, "isLoaded"))
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  modelURL = self->_modelURL;
  configuration = self->_configuration;
  v52 = 0;
  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", modelURL, configuration, &v52);
  v7 = (MLModel *)objc_claimAutoreleasedReturnValue();
  v8 = v52;
  model = self->_model;
  self->_model = v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v4);
  v12 = v11;

  v13 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "internal");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    NLGetLogIdentifier(self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f ms spent loading head"), v12 * 1000.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v16;
    v55 = 2114;
    v56 = v17;
    _os_log_impl(&dword_1A36A7000, v15, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  if (self->_model)
  {
    -[NLSentenceEmbeddingHead model](self, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "modelDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "inputDescriptionsByName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("input"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "multiArrayConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "count") == 3
      && (objc_msgSend(v23, "objectAtIndexedSubscript:", 2),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v25 = objc_opt_isKindOfClass(),
          v24,
          (v25 & 1) != 0))
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      self->_inputDimension = objc_msgSend(v26, "unsignedIntValue");

      -[NLSentenceEmbeddingHead model](self, "model");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "modelDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "outputDescriptionsByName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("output"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "multiArrayConstraint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shape");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v32, "count") == 3
        && (objc_msgSend(v32, "objectAtIndexedSubscript:", 2),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v33,
            (isKindOfClass & 1) != 0))
      {
        objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        self->_outputDimension = objc_msgSend(v35, "unsignedIntValue");
        v3 = 1;
      }
      else
      {
        v46 = (void *)MEMORY[0x1A8592E0C]();
        NLGetLogCategory(self);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "internal");
        v48 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          NLGetLogIdentifier(self);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model load failed: unexpected output shape"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v49;
          v55 = 2114;
          v56 = v50;
          _os_log_impl(&dword_1A36A7000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v46);
        v3 = 0;
        v35 = self->_model;
        self->_model = 0;
      }

    }
    else
    {
      v36 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(self);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "internal");
      v38 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        NLGetLogIdentifier(self);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model load failed: unexpected input shape"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v39;
        v55 = 2114;
        v56 = v40;
        _os_log_impl(&dword_1A36A7000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      v3 = 0;
      v32 = self->_model;
      self->_model = 0;
    }

  }
  else
  {
    v41 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "internal");
    v43 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model load failed: %@"), v8);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v44;
      v55 = 2114;
      v56 = v45;
      _os_log_impl(&dword_1A36A7000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v41);
    v3 = 0;
  }

  return v3;
}

- (BOOL)isLoaded
{
  void *v2;
  BOOL v3;

  -[NLSentenceEmbeddingHead model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)getSentenceEmbeddingFromPooledTokenEmbeddings:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  MLModel *model;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C9E8F8]);
  v43 = CFSTR("input");
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v10 = (void *)objc_msgSend(v7, "initWithDictionary:error:", v9, &v38);
  v11 = v38;

  if (v11 || !v10)
  {
    v28 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "internal");
    v30 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create modelInput: %@"), v11);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v31;
      v41 = 2114;
      v42 = v32;
      _os_log_impl(&dword_1A36A7000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    if (a4)
    {
      v11 = objc_retainAutorelease(v11);
      v27 = 0;
      *a4 = v11;
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    model = self->_model;
    v37 = 0;
    -[MLModel predictionFromFeatures:error:](model, "predictionFromFeatures:error:", v10, &v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v37;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;

    v17 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "internal");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      NLGetLogIdentifier(self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f ms spent running head inference"), v16 * 1000.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v20;
      v41 = 2114;
      v42 = v21;
      _os_log_impl(&dword_1A36A7000, v19, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    if (v11)
    {
      v22 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(self);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "internal");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        NLGetLogIdentifier(self);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model prediction failed: %@"), v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v25;
        v41 = 2114;
        v42 = v26;
        _os_log_impl(&dword_1A36A7000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v27 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      v33 = v36;
    }
    else
    {
      v33 = v36;
      objc_msgSend(v36, "featureValueForName:", CFSTR("output"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "multiArrayValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v27;
}

+ (id)logCategory
{
  return +[NLLogCategory categoryWithName:](NLLogCategory, "categoryWithName:", CFSTR("NLSentenceEmbeddingHead"));
}

- (unint64_t)inputDimension
{
  return self->_inputDimension;
}

- (unint64_t)outputDimension
{
  return self->_outputDimension;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end
