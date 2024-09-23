@implementation NSArray(INIntentResolutionResultDataProviding)

- (id)resolutionResultDataForIntent:()INIntentResolutionResultDataProviding intentSlotDescription:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _INPBIntentSlotResolutionMulticardinalResult *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "facadePropertyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
  }
  v12 = objc_alloc_init(_INPBIntentSlotResolutionMulticardinalResult);
  v13 = objc_msgSend(v11, "count");
  if (objc_msgSend(a1, "count") || !v13)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = a1;
    v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v32;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v24), "_buildIntentSlotResolutionResultWithIntentSlotDescription:", v9);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INPBIntentSlotResolutionMulticardinalResult addResolutionResults:](v12, "addResolutionResults:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v22);
    }
    goto LABEL_15;
  }
  v14 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v28 = v14;
    objc_msgSend(v9, "facadePropertyName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v39 = "-[NSArray(INIntentResolutionResultDataProviding) resolutionResultDataForIntent:intentSlotDescription:error:]";
    v40 = 2114;
    v41 = v29;
    v42 = 2114;
    v43 = v30;
    _os_log_error_impl(&dword_18BEBC000, v28, OS_LOG_TYPE_ERROR, "%s There should be at least 1 resolution result returned for the .%{public}@ property of %{public}@, since there was at least 1 input value.", buf, 0x20u);

    if (!a5)
      goto LABEL_16;
    goto LABEL_7;
  }
  if (a5)
  {
LABEL_7:
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "facadePropertyName");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("There should be at least 1 resolution result returned for the .%@ property of %@, since there was at least 1 input value."), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("INIntentResolutionResultErrorDomain"), 1000, v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
  }
LABEL_16:
  -[_INPBIntentSlotResolutionMulticardinalResult data](v12, "data");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_JSONDictionaryRepresentationForIntent:()INIntentResolutionResultDataProviding parameterName:
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = a1;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "_JSONDictionaryRepresentationForIntent:parameterName:", v6, v7, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v11);
  }

  v22 = CFSTR("resolutionResults");
  v15 = (void *)objc_msgSend(v8, "copy");
  v23 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)transformResolutionResultForIntent:()INIntentResolutionResultDataProviding intentSlotDescription:withOptionsProvider:completion:
{
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  INResolutionResultTransformationOperation *v14;
  uint64_t v15;
  uint64_t v16;
  INResolutionResultTransformationOperation *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v26 = a4;
  v25 = a5;
  v23 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v11, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v11, "setSuspended:", 1);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a1;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v34;
    do
    {
      v16 = 0;
      v17 = v14;
      do
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(obj);
        v14 = -[INResolutionResultTransformationOperation initWithResult:intent:intentSlotDescription:optionsProvider:]([INResolutionResultTransformationOperation alloc], "initWithResult:intent:intentSlotDescription:optionsProvider:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v16), v27, v26, v25);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __138__NSArray_INIntentResolutionResultDataProviding__transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke;
        v31[3] = &unk_1E22908D8;
        v32 = v10;
        -[INResolutionResultTransformationOperation setReturnBlock:](v14, "setReturnBlock:", v31);
        if (v17)
          -[INResolutionResultTransformationOperation addDependency:](v14, "addDependency:", v17);
        objc_msgSend(v11, "addOperation:", v14);

        ++v16;
        v17 = v14;
      }
      while (v13 != v16);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v18 = (void *)MEMORY[0x1E0CB34C8];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __138__NSArray_INIntentResolutionResultDataProviding__transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke_2;
  v28[3] = &unk_1E2293BE8;
  v29 = v10;
  v30 = v23;
  v19 = v10;
  v20 = v23;
  objc_msgSend(v18, "blockOperationWithBlock:", v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v14)
    objc_msgSend(v21, "addDependency:", v14);
  objc_msgSend(v11, "addOperation:", v22);
  objc_msgSend(v11, "setSuspended:", 0);

}

@end
