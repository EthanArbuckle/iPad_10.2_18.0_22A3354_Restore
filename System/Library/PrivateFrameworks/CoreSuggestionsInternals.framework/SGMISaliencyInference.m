@implementation SGMISaliencyInference

+ (id)evaluate:(id)a3 enablePreFiltering:(BOOL)a4 config:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int64_t v23;
  NSObject *v24;
  int64_t v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v8 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(v9, "mailMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isSent"))
  {
    sgMailIntelligenceLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "messageId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v12;
      _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGMISaliencyInference: Mail %@ is a sent mail", (uint8_t *)&v28, 0xCu);

    }
    if (!a6)
      goto LABEL_17;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 1;
LABEL_16:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("SGMIError"), v14, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    objc_msgSend(v9, "defaultSaliencyOnError");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!a5)
  {
    sgMailIntelligenceLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28) = 0;
      _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "SGMISaliencyInference: Error - config shouldn't be nil when inferencing saliency", (uint8_t *)&v28, 2u);
    }

    if (!a6)
      goto LABEL_17;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 2;
    goto LABEL_16;
  }
  objc_msgSend(v9, "store");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "areSubModelsEmpty");

  if (v16)
  {
    sgMailIntelligenceLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "messageId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v18;
      _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "SGMISaliencyInference: No submodels for message ID: %@", (uint8_t *)&v28, 0xCu);

    }
    if (!a6)
      goto LABEL_17;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 3;
    goto LABEL_16;
  }
  if (v8
    && (v23 = +[SGMISaliencyModel ruleBasedInferenceFor:](SGMISaliencyModel, "ruleBasedInferenceFor:", v9),
        v23 != 2))
  {
    v25 = v23;
    sgMailIntelligenceLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "messageId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v27;
      _os_log_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEFAULT, "SGMISaliencyInference: rule based inference for message ID: %@", (uint8_t *)&v28, 0xCu);

    }
    objc_msgSend(v9, "defaultSaliencyOnOverrideFor:", v25);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v28) = 0;
      _os_log_debug_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEBUG, "SGMISaliencyInference: Performing saliency inference for e-mail message.", (uint8_t *)&v28, 2u);
    }

    +[SGMISaliencyModel saliencyForFeatureVector:](SGMISaliencyModel, "saliencyForFeatureVector:", v9);
    v20 = objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  v21 = (void *)v20;

  return v21;
}

+ (id)read:(id)a3 fromStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "messageId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saliencyForMessageId:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
