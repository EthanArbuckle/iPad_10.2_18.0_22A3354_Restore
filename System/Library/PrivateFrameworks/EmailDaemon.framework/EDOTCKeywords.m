@implementation EDOTCKeywords

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__EDOTCKeywords_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_60 != -1)
    dispatch_once(&log_onceToken_60, block);
  return (id)log_log_60;
}

void __20__EDOTCKeywords_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_60;
  log_log_60 = (uint64_t)v1;

}

+ (id)localizedExpressionStrings
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EDOTCKeywords_localizedExpressionStrings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localizedExpressionStrings_onceToken != -1)
    dispatch_once(&localizedExpressionStrings_onceToken, block);
  return (id)localizedExpressionStrings_otcKeywordsArray;
}

void __43__EDOTCKeywords_localizedExpressionStrings__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("EDOTCLocalizationKeywords"), CFSTR("json"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v2, 0, &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_16;
    v14 = &unk_1E949F220;
    v6 = v5;
    v15 = v6;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v11);
    objc_msgSend(v6, "allObjects", v11, v12, v13, v14);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)localizedExpressionStrings_otcKeywordsArray;
    localizedExpressionStrings_otcKeywordsArray = v7;

  }
  else
  {
    +[EDOTCKeywords log](EDOTCKeywords, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_cold_1(v10, (uint64_t)v4, buf, v9);
    }

    v6 = (id)localizedExpressionStrings_otcKeywordsArray;
    localizedExpressionStrings_otcKeywordsArray = MEMORY[0x1E0C9AA60];
  }

}

void __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  objc_msgSend(v8, "valueForKey:", CFSTR("expressions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("properties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_2;
    v9[3] = &unk_1E949F1F8;
    v10 = v5;
    objc_msgSend(v4, "ef_map:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

  }
}

id __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("no-word-boundaries"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "BOOLValue"))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\b%@\\b"), v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

void __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "JSON localized keywords file returned empty, check previous logs to see potential issue: %@. Error: %@", buf, 0x16u);

}

@end
