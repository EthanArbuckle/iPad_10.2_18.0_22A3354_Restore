@implementation LNActionDefaultValueProvider

- (id)loadStaticDefaultValueForBundleIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  LNConnectionPolicySignals *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  -[LNActionDefaultValueProvider loadActionMetadataWithRetry:error:](self, "loadActionMetadataWithRetry:error:", 1, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_10817);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke_2;
    v14[3] = &unk_1E45DE008;
    v15 = v8;
    v9 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
    v10 = objc_alloc_init(LNConnectionPolicySignals);
    -[LNConnectionPolicySignals setShouldExecuteActionOnApplicationBasedOnMetadata:](v10, "setShouldExecuteActionOnApplicationBasedOnMetadata:", 0);
    +[LNConnectionPolicy policyWithActionMetadata:signals:](LNConnectionPolicy, "policyWithActionMetadata:signals:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "actionWithParameters:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

void __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v3 = a2;
  objc_msgSend(v3, "typeSpecificMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D43AD8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v3, "valueType");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if ((isKindOfClass & 1) != 0)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v14 = v9;

    objc_msgSend(v14, "memberValueType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = v15;
    }
    else
    {
      objc_msgSend(v3, "valueType");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke_3;
    v22[3] = &unk_1E45DDFE0;
    v23 = v17;
    v13 = v17;
    objc_msgSend(v5, "if_map:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43E30]), "initWithValues:memberValueType:", v18, v13);

    goto LABEL_14;
  }
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();

  v11 = 0;
  if ((v10 & 1) == 0 && v5)
  {
    v12 = objc_alloc(MEMORY[0x1E0D43E30]);
    objc_msgSend(v3, "valueType");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "initWithValue:valueType:", v5, v13);
LABEL_14:

  }
  v19 = objc_alloc(MEMORY[0x1E0D43DA0]);
  objc_msgSend(v3, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithIdentifier:value:", v20, v11);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v21);
}

BOOL __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dynamicOptionsSupport") == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (LNActionDefaultValueProvider)initWithActionIdentifier:(id)a3 actionMetadata:(id)a4
{
  id v8;
  id v9;
  LNActionDefaultValueProvider *v10;
  LNActionDefaultValueProvider *v11;
  LNActionDefaultValueProvider *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionDefaultValueProvider.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

  }
  v15.receiver = self;
  v15.super_class = (Class)LNActionDefaultValueProvider;
  v10 = -[LNActionDefaultValueProvider init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_actionIdentifier, a3);
    objc_storeStrong((id *)&v11->_actionMetadata, a4);
    v12 = v11;
  }

  return v11;
}

- (void)loadDefaultValuesWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  LNConnectionPolicySignals *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  void (**v19)(id, void *, _QWORD);
  id v20;
  id v21;
  id v22;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v22 = 0;
  -[LNActionDefaultValueProvider loadActionMetadataWithRetry:error:](self, "loadActionMetadataWithRetry:error:", 1, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  if (v5)
  {
    -[LNActionDefaultValueProvider actionIdentifier](self, "actionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    -[LNActionDefaultValueProvider loadStaticDefaultValueForBundleIdentifier:error:](self, "loadStaticDefaultValueForBundleIdentifier:error:", v8, &v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;

    if (v9)
    {
      objc_msgSend(v5, "parameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "if_objectsPassingTest:", &__block_literal_global_22_10813);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "count");
      if (v13 == objc_msgSend(v12, "count"))
      {
        v4[2](v4, v9, 0);
      }
      else
      {
        v14 = objc_alloc_init(LNConnectionPolicySignals);
        -[LNConnectionPolicySignals setShouldExecuteActionOnApplicationBasedOnMetadata:](v14, "setShouldExecuteActionOnApplicationBasedOnMetadata:", 0);
        +[LNConnectionPolicy policyWithActionMetadata:signals:](LNConnectionPolicy, "policyWithActionMetadata:signals:", v5, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = 0;
        objc_msgSend(v15, "connectionWithError:", &v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v20;
        if (v17)
        {
          ((void (**)(id, void *, id))v4)[2](v4, 0, v17);
        }
        else
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __71__LNActionDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_2;
          v18[3] = &unk_1E45DE050;
          v19 = v4;
          objc_msgSend(v16, "fetchOptionsDefaultValueForAction:completionHandler:", v9, v18);

        }
      }

    }
    else
    {
      ((void (**)(id, void *, id))v4)[2](v4, 0, v10);
    }

  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v6);
  }

}

- (void)loadSuggestedFocusActionsWithSuggestionContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(25, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__LNActionDefaultValueProvider_loadSuggestedFocusActionsWithSuggestionContext_completion___block_invoke;
  block[3] = &unk_1E45DE0A0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)loadActionMetadataWithRetry:(BOOL)a3 error:(id *)a4
{
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[LNActionDefaultValueProvider actionMetadata](self, "actionMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[LNActionDefaultValueProvider actionMetadata](self, "actionMetadata");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_opt_new();
    -[LNActionDefaultValueProvider actionIdentifier](self, "actionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionDefaultValueProvider actionIdentifier](self, "actionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v9, "actionForBundleIdentifier:andActionIdentifier:error:", v11, v13, &v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v28;

    if (v14)
      goto LABEL_4;
    getLNLogCategoryMetadata();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[LNActionDefaultValueProvider actionIdentifier](self, "actionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_1A18F6000, v17, OS_LOG_TYPE_ERROR, "Failed to load metadata for actionIdentifier %{public}@: %{public}@", buf, 0x16u);

    }
    if (a4 && v15)
      *a4 = objc_retainAutorelease(v15);
    getLNLogCategoryMetadata();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[LNActionDefaultValueProvider actionIdentifier](self, "actionIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v20;
      v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_1A18F6000, v19, OS_LOG_TYPE_ERROR, "Failed to load metadata for actionIdentifier %{public}@: %{public}@", buf, 0x16u);

    }
    if (!v15)
    {
LABEL_4:
      -[LNActionDefaultValueProvider setActionMetadata:](self, "setActionMetadata:", v14);
      v16 = v14;
    }
    else if (a3)
    {
      -[LNActionDefaultValueProvider actionIdentifier](self, "actionIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend(v9, "registerBundleWithIdentifier:error:", v22, &v27);
      v23 = v27;

      if (v23)
      {
        getLNLogCategoryMetadata();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          -[LNActionDefaultValueProvider actionIdentifier](self, "actionIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bundleIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v26;
          v31 = 2114;
          v32 = v23;
          _os_log_impl(&dword_1A18F6000, v24, OS_LOG_TYPE_ERROR, "Failed to register %{public}@: %{public}@", buf, 0x16u);

        }
        v16 = 0;
        *a4 = objc_retainAutorelease(v23);
      }
      else
      {
        -[LNActionDefaultValueProvider loadActionMetadataWithRetry:error:](self, "loadActionMetadataWithRetry:error:", 0, a4);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v16 = 0;
      *a4 = objc_retainAutorelease(v15);
    }

    return v16;
  }
}

- (LNFullyQualifiedActionIdentifier)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_actionMetadata, a3);
}

void __90__LNActionDefaultValueProvider_loadSuggestedFocusActionsWithSuggestionContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v2, "loadActionMetadataWithRetry:error:", 1, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3)
  {
    +[LNConnectionPolicy policyWithActionMetadata:](LNConnectionPolicy, "policyWithActionMetadata:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v5, "connectionWithError:", &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __90__LNActionDefaultValueProvider_loadSuggestedFocusActionsWithSuggestionContext_completion___block_invoke_2;
      v9[3] = &unk_1E45DE078;
      v8 = *(_QWORD *)(a1 + 40);
      v10 = *(id *)(a1 + 48);
      objc_msgSend(v6, "fetchSuggestedFocusActionsForActionMetadata:suggestionContext:completionHandler:", v3, v8, v9);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __90__LNActionDefaultValueProvider_loadSuggestedFocusActionsWithSuggestionContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__LNActionDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL __71__LNActionDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dynamicOptionsSupport") == 0;
}

id __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D43E30];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithValue:valueType:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

@end
