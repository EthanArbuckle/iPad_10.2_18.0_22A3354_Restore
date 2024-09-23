@implementation CNAutocompleteStewieSearch

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke;
  v14[3] = &unk_1E70DEEE0;
  v15 = v5;
  v16 = v6;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v9, "performCancelableBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char **__ptr32 *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  double v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stewie");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmergencyEnabled");

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stewie");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAvocetEnabled");

  if ((v4 & 1) != 0 || (v7 & 1) != 0)
  {
    CNALoggingContextDebug();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v42 = v9;
      _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Executing request %p against Stewie contacts", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    v12 = MEMORY[0x1E0C809B0];
    v13 = &off_1B999B000;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stewie");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "emergencyTerms");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = &off_1B999B000;
      v39[0] = v12;
      v39[1] = 3221225472;
      v39[2] = __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke_3;
      v39[3] = &unk_1E70DEEB8;
      v40 = *(id *)(a1 + 32);
      objc_msgSend(v16, "_cn_filter:", v39);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        +[CNAutocompleteResultValue resultValueWithAddress:addressType:](CNAutocompleteResultValue, "resultValueWithAddress:addressType:", CFSTR("stewie:emergency:112911"), 4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_SERVICES"), &stru_1E70E0E70, CFSTR("Localized-Stewie"));
        v19 = v11;
        v20 = v16;
        v21 = v10;
        v22 = a1;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNAutocompleteResult contactResultWithDisplayName:value:nameComponents:identifier:](CNAutocompleteStewieResult, "contactResultWithDisplayName:value:nameComponents:identifier:", v23, v36, 0, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        a1 = v22;
        v10 = v21;
        v16 = v20;
        v11 = v19;

        v12 = MEMORY[0x1E0C809B0];
        objc_msgSend(v24, "setSourceType:", 512);
        objc_msgSend(v19, "addObject:", v24);

        v13 = &off_1B999B000;
      }

    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stewie");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "avocetTerms");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v37[0] = v12;
      v37[1] = *((_QWORD *)v13 + 258);
      v37[2] = __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke_2;
      v37[3] = &unk_1E70DEEB8;
      v38 = *(id *)(a1 + 32);
      objc_msgSend(v27, "_cn_filter:", v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
      {
        +[CNAutocompleteResultValue resultValueWithAddress:addressType:](CNAutocompleteResultValue, "resultValueWithAddress:addressType:", CFSTR("stewie:roadside:0:autocomplete:"), 5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("ROADSIDE_ASSISTANCE"), &stru_1E70E0E70, CFSTR("Localized-Avocet"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNAutocompleteResult contactResultWithDisplayName:value:nameComponents:identifier:](CNAutocompleteStewieResult, "contactResultWithDisplayName:value:nameComponents:identifier:", v31, v29, 0, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "setSourceType:", 512);
        objc_msgSend(v11, "addObject:", v32);

      }
    }
    CNALoggingContextPerformance();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceNow");
      *(_DWORD *)buf = 138412546;
      v42 = v34;
      v43 = 2048;
      v44 = v35 * -1000.0;
      _os_log_impl(&dword_1B9950000, v33, OS_LOG_TYPE_INFO, "Time to fetch %@ Stewie contacts: %.3fms", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], 0);
  }
}

uint64_t __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cn_hasPrefix:", v4);

  return v5;
}

uint64_t __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(*(id *)(a1 + 32), "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 <= 4)
  {
    v7 = objc_msgSend(v3, "isEqualToString:", v5);
LABEL_6:
    v9 = v7;

    goto LABEL_7;
  }
  v8 = objc_msgSend(v5, "length");

  if (v8 >= 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "_cn_hasPrefix:", v6);
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

@end
