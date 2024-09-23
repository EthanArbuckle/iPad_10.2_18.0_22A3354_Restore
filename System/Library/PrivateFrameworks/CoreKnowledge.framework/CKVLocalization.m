@implementation CKVLocalization

- (CKVLocalization)initWithSiriLanguageCode:(id)a3
{
  id v4;
  CKVLocalization *v5;
  uint64_t v6;
  NSString *siriLanguageCode;
  NSSet *dictationLanguageCodes;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVLocalization;
  v5 = -[CKVLocalization init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    siriLanguageCode = v5->_siriLanguageCode;
    v5->_siriLanguageCode = (NSString *)v6;

    dictationLanguageCodes = v5->_dictationLanguageCodes;
    v5->_dictationLanguageCodes = 0;

    v5->_assetRequestCount = 0;
    v5->_assetResolved = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("CKVLocalization", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

  }
  return v5;
}

- (CKVLocalization)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_siriLanguageCode, CFSTR("l"));
}

- (CKVLocalization)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CKVLocalization *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("l"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[CKVLocalization initWithSiriLanguageCode:](self, "initWithSiriLanguageCode:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CKVLocalization *v4;
  CKVLocalization *v5;
  BOOL v6;

  v4 = (CKVLocalization *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CKVLocalization isEqualToLocalization:](self, "isEqualToLocalization:", v5);

  return v6;
}

- (BOOL)isEqualToLocalization:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKVLocalization siriLanguageCode](self, "siriLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (id)siriLanguageCode
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__522;
  v10 = __Block_byref_object_dispose__523;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CKVLocalization_siriLanguageCode__block_invoke;
  v5[3] = &unk_1E4D29298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)dictationLanguageCodes
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__522;
  v10 = __Block_byref_object_dispose__523;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__CKVLocalization_dictationLanguageCodes__block_invoke;
  v5[3] = &unk_1E4D29298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)refresh
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CKVLocalization_refresh__block_invoke;
  block[3] = &unk_1E4D294D8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)allLanguageCodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[CKVLocalization dictationLanguageCodes](self, "dictationLanguageCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKVLocalization siriLanguageCode](self, "siriLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);

  return v5;
}

- (int64_t)locateMorphunAssetForSiriLanguage:(id *)a3 error:(id *)a4
{
  NSObject *queue;
  int64_t v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__522;
  v13 = __Block_byref_object_dispose__523;
  v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__CKVLocalization_locateMorphunAssetForSiriLanguage_error___block_invoke;
  v8[3] = &unk_1E4D290A0;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  v8[7] = a4;
  dispatch_sync(queue, v8);
  v6 = v16[3];
  if (a3 && v6)
  {
    *a3 = objc_retainAutorelease((id)v10[5]);
    v6 = v16[3];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)_locateMorphunAssetForLocale:(id)a3 outAssetPath:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int assetRequestCount;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  void *v28;
  dispatch_time_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D50608], "isLocaleEmbedded:", v7))
  {
    v49 = 0;
    objc_msgSend(MEMORY[0x1E0D50608], "getAssetPathForLocale:withError:", v7, &v49);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v49;
    v12 = v11;
    if (v10)
    {
      v13 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
      {
        v38 = v13;
        objc_msgSend(v7, "localeIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        v54 = 2112;
        v55 = v39;
        v56 = 2112;
        v57 = v10;
        _os_log_debug_impl(&dword_1A48B3000, v38, OS_LOG_TYPE_DEBUG, "%s Resolved asset path for locale (%@) %@", buf, 0x20u);

        if (!a4)
          goto LABEL_13;
      }
      else if (!a4)
      {
LABEL_13:
        v9 = 1;
LABEL_14:
        v15 = v12;
LABEL_15:

        goto LABEL_16;
      }
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
      goto LABEL_13;
    }
    if (objc_msgSend(v11, "code") == 1)
    {
      v14 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
      {
        v40 = v14;
        objc_msgSend(v7, "localeIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        v54 = 2112;
        v55 = v41;
        _os_log_debug_impl(&dword_1A48B3000, v40, OS_LOG_TYPE_DEBUG, "%s Locale: %@ is unsupported by MorphunAssets - proceeding without asset path", buf, 0x16u);

      }
      v10 = 0;
      goto LABEL_13;
    }
    assetRequestCount = self->_assetRequestCount;
    self->_assetRequestCount = assetRequestCount + 1;
    if (assetRequestCount)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB2D50];
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "localeIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Previous attempt to request Morphun asset failed for locale: %@ attempts: %u"), v20, self->_assetRequestCount);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.vocabulary.localization"), 2, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      KVSetAndReportError();

      LODWORD(v20) = self->_assetRequestCount;
      v24 = (void *)CKLogContextVocabulary;
      v25 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
      if ((_DWORD)v20 == 2)
      {
        if (v25)
        {
          v26 = v24;
          objc_msgSend(v7, "localeIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
          v54 = 2112;
          v55 = v27;
          _os_log_impl(&dword_1A48B3000, v26, OS_LOG_TYPE_INFO, "%s Issuing a non-blocking MorphunAssets download request for locale: %@", buf, 0x16u);

        }
        v28 = (void *)MEMORY[0x1E0D50608];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __67__CKVLocalization__locateMorphunAssetForLocale_outAssetPath_error___block_invoke;
        v46[3] = &unk_1E4D290C8;
        v47 = v7;
        objc_msgSend(v28, "onDemandDownloadForLocale:withProgress:withCompletion:", v47, 0, v46);

      }
      else if (v25)
      {
        v36 = v24;
        objc_msgSend(v7, "localeIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
        v54 = 2112;
        v55 = v37;
        _os_log_impl(&dword_1A48B3000, v36, OS_LOG_TYPE_INFO, "%s MorphunAssets download attempts exhausted for locale: %@", buf, 0x16u);

      }
      v10 = 0;
      v9 = 0;
      goto LABEL_14;
    }
    v29 = dispatch_time(0, 60000000000);
    v30 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v31 = v30;
      objc_msgSend(v7, "localeIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
      v54 = 2112;
      v55 = v32;
      v56 = 1024;
      LODWORD(v57) = 60;
      _os_log_impl(&dword_1A48B3000, v31, OS_LOG_TYPE_INFO, "%s Issuing a blocking MorphunAssets download request for locale: %@ with timeout of %d s", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x1E0D50608], "blockingOnDemandDownloadForLocale:withTimeout:withProgress:", v7, v29, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v33 = (void *)CKLogContextVocabulary;
      if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        KVSetAndReportError();
        v10 = 0;
        v9 = 0;
        goto LABEL_15;
      }
      v43 = v33;
      objc_msgSend(v7, "localeIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
      v54 = 2112;
      v55 = v44;
      v56 = 2112;
      v57 = v15;
      v45 = "%s MorphunAssets download request failed for locale: %@ error: %@";
    }
    else
    {
      v48 = 0;
      objc_msgSend(MEMORY[0x1E0D50608], "getAssetPathForLocale:withError:", v7, &v48);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v48;
      if (v10)
      {
        if (a4)
        {
          v10 = objc_retainAutorelease(v10);
          *a4 = v10;
        }
        v9 = 1;
        goto LABEL_15;
      }
      v42 = (void *)CKLogContextVocabulary;
      if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      v43 = v42;
      objc_msgSend(v7, "localeIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
      v54 = 2112;
      v55 = v44;
      v56 = 2112;
      v57 = v15;
      v45 = "%s Failed to get asset path for locale: %@ after download. error: %@";
    }
    _os_log_error_impl(&dword_1A48B3000, v43, OS_LOG_TYPE_ERROR, v45, buf, 0x20u);

    goto LABEL_26;
  }
  v8 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
  {
    v34 = v8;
    objc_msgSend(v7, "localeIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v53 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]";
    v54 = 2112;
    v55 = v35;
    _os_log_debug_impl(&dword_1A48B3000, v34, OS_LOG_TYPE_DEBUG, "%s Locale %@ is embedded.", buf, 0x16u);

  }
  v9 = 1;
LABEL_16:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedAssetPath, 0);
  objc_storeStrong((id *)&self->_dictationLanguageCodes, 0);
  objc_storeStrong((id *)&self->_siriLanguageCode, 0);
}

void __67__CKVLocalization__locateMorphunAssetForLocale_outAssetPath_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "-[CKVLocalization _locateMorphunAssetForLocale:outAssetPath:error:]_block_invoke";
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = a2;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_INFO, "%s MorphunAssets download completion invoked for locale: %@ result: %d error: %@", (uint8_t *)&v10, 0x26u);

  }
  if (v5)
    KVSetAndReportError();

}

void __59__CKVLocalization_locateMorphunAssetForSiriLanguage_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (*(_BYTE *)(v2 + 36))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(v2 + 24));
LABEL_3:
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend((id)objc_opt_class(), "supportedLocaleFromLanguageCode:", *(_QWORD *)(a1[4] + 8));
    return;
  }
  objc_msgSend((id)objc_opt_class(), "supportedNSLocaleFromLanguageCode:", *(_QWORD *)(a1[4] + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)a1[4];
    v5 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v5 + 40);
    v6 = objc_msgSend(v4, "_locateMorphunAssetForLocale:outAssetPath:error:", v3, &obj, a1[7]);
    objc_storeStrong((id *)(v5 + 40), obj);
    if ((v6 & 1) != 0)
    {
      *(_BYTE *)(a1[4] + 36) = 1;
      objc_storeStrong((id *)(a1[4] + 24), *(id *)(*(_QWORD *)(a1[5] + 8) + 40));

      goto LABEL_3;
    }
  }
  else
  {
    v7 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1[4] + 8);
      *(_DWORD *)buf = 136315394;
      v17 = "-[CKVLocalization locateMorphunAssetForSiriLanguage:error:]_block_invoke";
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_INFO, "%s Unsupported Siri Language: %@", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported Siri Language: \"%@\"), *(_QWORD *)(a1[4] + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.vocabulary.localization"), 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    KVSetError();

  }
}

void __26__CKVLocalization_refresh__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[CKVAssistantSettingsBridge currentSiriLanguageCode](CKVAssistantSettingsBridge, "currentSiriLanguageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = 136315650;
    v11 = "-[CKVLocalization refresh]_block_invoke";
    v12 = 2112;
    v13 = v2;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_INFO, "%s Siri language is %@, previously %@", (uint8_t *)&v10, 0x20u);
  }
  if ((objc_msgSend(v2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), v2);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) = 0;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = 0;

  }
  +[CKVAssistantSettingsBridge currentDictationLanguageCodes](CKVAssistantSettingsBridge, "currentDictationLanguageCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v10 = 136315650;
    v11 = "-[CKVLocalization refresh]_block_invoke";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_INFO, "%s Dictation languages are %@, previously %@", (uint8_t *)&v10, 0x20u);
  }
  if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v7);

}

void __41__CKVLocalization_dictationLanguageCodes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    +[CKVAssistantSettingsBridge currentDictationLanguageCodes](CKVAssistantSettingsBridge, "currentDictationLanguageCodes");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __35__CKVLocalization_siriLanguageCode__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

+ (id)defaultLocalization
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  +[CKVAssistantSettingsBridge currentSiriLanguageCode](CKVAssistantSettingsBridge, "currentSiriLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSiriLanguageCode:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)supportedNSLocaleFromLanguageCode:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedLocaleFromLanguageCode:", v3);

  return (id)KVLocaleTypeToNSLocale();
}

+ (int64_t)supportedLocaleFromLanguageCode:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = KVLocaleTypeFromName();

  if (!v5)
  {
    v6 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "+[CKVLocalization supportedLocaleFromLanguageCode:]";
      v10 = 2112;
      v11 = v3;
      _os_log_error_impl(&dword_1A48B3000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported language code (%@)", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

+ (id)supportedLanguageCodeFromLocale:(id)a3
{
  void *v3;
  void *v4;

  if (KVLocaleTypeFromNSLocale())
  {
    KVLocaleTypeName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
