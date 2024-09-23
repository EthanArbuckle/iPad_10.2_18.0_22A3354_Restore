@implementation LTLanguageAvailability

void __31___LTLanguageAvailability_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  os_unfair_lock_s *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *(*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __31___LTLanguageAvailability_init__block_invoke_cold_1(v5, v3);
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    v18 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v9 = __31___LTLanguageAvailability_init__block_invoke_2;
    v10 = &unk_250693780;
    v12 = &v13;
    v11 = WeakRetained;
    v6 = v8;
    os_unfair_lock_lock(WeakRetained + 2);
    v9((uint64_t)v6);

    os_unfair_lock_unlock(WeakRetained + 2);
    v7 = v14[5];
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

    _Block_object_dispose(&v13, 8);
  }

}

void __31___LTLanguageAvailability_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

}

void __60___LTLanguageAvailability_supportedLanguagesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "_uniqueLocalesFromSupportedPairs:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __68___LTLanguageAvailability_statusFromLanguage_toLanguage_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_235438000, v5, OS_LOG_TYPE_INFO, "Got an error when checking status so returning unsupported: %@", (uint8_t *)&v7, 0xCu);
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  _LTPreflightConfiguration *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v14[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x24BDBD1A8];
    }
    v6 = -[_LTPreflightConfiguration initWithSourceStrings:supportedLocalePairs:]([_LTPreflightConfiguration alloc], "initWithSourceStrings:supportedLocalePairs:", v5, v3);
    -[_LTPreflightConfiguration setRequestedSourceLocale:](v6, "setRequestedSourceLocale:", *(_QWORD *)(a1 + 40));
    -[_LTPreflightConfiguration setRequestedTargetLocale:](v6, "setRequestedTargetLocale:", *(_QWORD *)(a1 + 48));
    v7 = (void *)WeakRetained[6];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2;
    v8[3] = &unk_250693898;
    objc_copyWeak(&v13, (id *)(a1 + 64));
    v12 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = v3;
    objc_msgSend(v7, "preflightConfiguration:completion:", v6, v8);

    objc_destroyWeak(&v13);
  }

}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 11, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        v11 = objc_msgSend(v6, "code");
        v12 = objc_msgSend(v8, "code");

        if (v11 == v12)
        {
          v13 = _LTOSLogTextAPI();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_235438000, v13, OS_LOG_TYPE_INFO, "Preflight checks determined the language pairing isn't supported; returning unsupported rather than an error",
              buf,
              2u);
          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          goto LABEL_35;
        }
      }
      else
      {

      }
      v24 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_cold_2((uint64_t)v6, v24, v25, v26, v27, v28, v29, v30);
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "nextStep") != 1)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 21, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_cold_1((uint64_t)v8, v31, v32, v33, v34, v35, v36, v37);
LABEL_22:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_35:

      goto LABEL_36;
    }
    objc_msgSend(v5, "resolvedSourceLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedTargetLocale");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _LTOSLogTextAPI();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (!v8 || !v46)
    {
      if (v15)
      {
        v38 = *(void **)(a1 + 32);
        v39 = v14;
        objc_msgSend(v38, "_ltLocaleIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_ltLocaleIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v40;
        v57 = 2114;
        v58 = v41;
        _os_log_impl(&dword_235438000, v39, OS_LOG_TYPE_INFO, "Unable to determine language status since source ('%{public}@') or target ('%{public}@') language isn't supported", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_34;
    }
    if (v15)
    {
      v16 = v14;
      objc_msgSend(v8, "_ltLocaleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "_ltLocaleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v17;
      v57 = 2114;
      v58 = v18;
      _os_log_impl(&dword_235438000, v16, OS_LOG_TYPE_INFO, "Checking language status for validated locales of source '%{public}@' and target '%{public}@'", buf, 0x16u);

    }
    v19 = *(void **)(a1 + 48);
    v20 = MEMORY[0x24BDAC760];
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_8;
    v52[3] = &unk_250693820;
    v21 = v8;
    v53 = v21;
    v22 = v46;
    v54 = v22;
    if ((objc_msgSend(v19, "lt_hasObjectPassingTest:", v52) & 1) != 0)
    {
      if (!objc_msgSend(WeakRetained, "allowOnlineTranslation") || !_LTIsInternalInstall())
      {
        v47[0] = v20;
        v47[1] = 3221225472;
        v47[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_10;
        v47[3] = &unk_250693870;
        objc_copyWeak(&v51, (id *)(a1 + 64));
        v48 = v21;
        v49 = v22;
        v50 = *(id *)(a1 + 56);
        objc_msgSend(WeakRetained, "_installedLocalesWithCompletion:", v47);

        objc_destroyWeak(&v51);
        goto LABEL_33;
      }
      v23 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235438000, v23, OS_LOG_TYPE_INFO, "Not checking installed locales since online translation is allowed, just reporting the pairing is installed", buf, 2u);
      }
    }
    else
    {
      v42 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = v42;
        objc_msgSend(v21, "_ltLocaleIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_ltLocaleIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v44;
        v57 = 2114;
        v58 = v45;
        _os_log_impl(&dword_235438000, v43, OS_LOG_TYPE_INFO, "Returning unsupported language pairing since there's no supported pairing from '%{public}@' to '%{public}@'", buf, 0x16u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
LABEL_36:

}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "sourceLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_ltEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "targetLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_ltEqual:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void (*v26)(void);
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v8 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_11;
    v40[3] = &unk_250693848;
    v41 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v5, "lt_hasObjectPassingTest:", v40);
    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_3;
    v38[3] = &unk_250693848;
    v39 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v5, "lt_hasObjectPassingTest:", v38);
    v11 = v10;
    if (v9 && v10)
    {
      v12 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = *(void **)(a1 + 32);
        v14 = v12;
        objc_msgSend(v13, "_ltLocaleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_ltLocaleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v15;
        v44 = 2114;
        v45 = v16;
        _os_log_impl(&dword_235438000, v14, OS_LOG_TYPE_INFO, "Both source ('%{public}@') and target ('%{public}@') languages are installed", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v36[0] = v8;
      v36[1] = 3221225472;
      v36[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_13;
      v36[3] = &unk_250693848;
      v37 = *(id *)(a1 + 32);
      v17 = objc_msgSend(v6, "lt_hasObjectPassingTest:", v36);
      v31 = v8;
      v32 = 3221225472;
      v33 = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_14;
      v34 = &unk_250693848;
      v35 = *(id *)(a1 + 40);
      v18 = objc_msgSend(v6, "lt_hasObjectPassingTest:", &v31);
      v19 = v17 | v9;
      v20 = _LTOSLogTextAPI();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if (v19 == 1 && v18 | v11)
      {
        if (v21)
        {
          v22 = *(void **)(a1 + 32);
          v23 = v20;
          objc_msgSend(v22, "_ltLocaleIdentifier", v31, v32, v33, v34);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "_ltLocaleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v24;
          v44 = 2114;
          v45 = v25;
          _os_log_impl(&dword_235438000, v23, OS_LOG_TYPE_INFO, "Both source ('%{public}@') and target ('%{public}@') languages are at least downloading, saying this pairing is downloading", buf, 0x16u);

        }
        v26 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      }
      else
      {
        if (v21)
        {
          v27 = *(void **)(a1 + 32);
          v28 = v20;
          objc_msgSend(v27, "_ltLocaleIdentifier", v31, v32, v33, v34);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "_ltLocaleIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v29;
          v44 = 2114;
          v45 = v30;
          _os_log_impl(&dword_235438000, v28, OS_LOG_TYPE_INFO, "Either source ('%{public}@') and/or target ('%{public}@') language isn't installed or downloading, saying this pairing is supported but not installed or downloading", buf, 0x16u);

        }
        v26 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      }
      v26();

    }
  }

}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_ltEqual:", *(_QWORD *)(a1 + 32));
}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_ltEqual:", *(_QWORD *)(a1 + 32));
}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_ltEqual:", *(_QWORD *)(a1 + 32));
}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_ltEqual:", *(_QWORD *)(a1 + 32));
}

void __45___LTLanguageAvailability_setLocaleProvider___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

void __46___LTLanguageAvailability__updateCachedValues__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __46___LTLanguageAvailability__updateCachedValues__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  _QWORD *v6;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  os_unfair_lock_s *v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v8 = __46___LTLanguageAvailability__updateCachedValues__block_invoke_3;
    v9 = &unk_250693910;
    v10 = WeakRetained;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    v11 = v3;
    v6 = v7;
    os_unfair_lock_lock(v5 + 2);
    v8((uint64_t)v6);

    os_unfair_lock_unlock(v5 + 2);
    -[os_unfair_lock_s _didUpdateCachedValues](v5, "_didUpdateCachedValues");

    objc_destroyWeak(&v12);
  }

}

void __46___LTLanguageAvailability__updateCachedValues__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained == v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

  }
}

void __49___LTLanguageAvailability__didUpdateCachedValues__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 16));
  v2 = _Block_copy(*(const void **)(a1[4] + 24));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = a1[4];
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = 0;

}

void __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

void __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = _Block_copy(*((const void **)WeakRetained + 3));
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke_3;
    aBlock[3] = &unk_250693988;
    objc_copyWeak(&v12, v2);
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    v6 = v5;
    v7 = _Block_copy(aBlock);
    v8 = (void *)v4[3];
    v4[3] = v7;

    objc_destroyWeak(&v12);
  }

}

void __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cachedStatus");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = _Block_copy(*((const void **)WeakRetained + 4));
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke_3;
    aBlock[3] = &unk_250693988;
    objc_copyWeak(&v12, v2);
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    v6 = v5;
    v7 = _Block_copy(aBlock);
    v8 = (void *)v4[4];
    v4[4] = v7;

    objc_destroyWeak(&v12);
  }

}

void __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  os_unfair_lock_s *v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v5 = a2;
  v6 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v12 = __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke_3;
    v13 = &unk_2506939D8;
    v14 = WeakRetained;
    v15 = &v17;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    v9 = v11;
    os_unfair_lock_lock(v8 + 2);
    v12((uint64_t)v9);

    os_unfair_lock_unlock(v8 + 2);
    v10 = *(_QWORD *)(a1 + 32);
    if (*((_BYTE *)v18 + 24))
      -[os_unfair_lock_s _installedLocalesWithCompletion:](v8, "_installedLocalesWithCompletion:", v10);
    else
      (*(void (**)(_QWORD, id, id))(v10 + 16))(*(_QWORD *)(a1 + 32), v5, v6);
    objc_destroyWeak(&v16);
    _Block_object_dispose(&v17, 8);
  }

}

void __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = WeakRetained != v2;

}

uint64_t __62___LTLanguageAvailability_supportedLocalePairsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67___LTLanguageAvailability_currentlyInstalledLocalesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v8)
      goto LABEL_14;
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "status", (_QWORD)v19);
        if (v13 == 1)
        {
          objc_msgSend(v12, "locale");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v6;
        }
        else
        {
          if (v13 != 2)
            continue;
          objc_msgSend(v12, "locale");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v5;
        }
        objc_msgSend(v15, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v9)
      {
LABEL_14:

        v16 = *(_QWORD *)(a1 + 32);
        v17 = (void *)objc_msgSend(v5, "copy");
        v18 = (void *)objc_msgSend(v6, "copy");
        (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v18);

        break;
      }
    }
  }

}

void __31___LTLanguageAvailability_init__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = 134217984;
  v5 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_235438000, v3, OS_LOG_TYPE_DEBUG, "Got updated list of %zu language statuses", (uint8_t *)&v4, 0xCu);

}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Unexpected next step after preflight configuration; assuming LID was unclear, but we can't present UI from availabil"
    "ity checking, so returning an error: %@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Encountered an error doing preflight checking for checking language status, returning the error: %@", a5, a6, a7, a8, 2u);
}

@end
