@implementation LTPreflightChecker

void __35___LTPreflightChecker__sharedQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.translation.TextSession.PreflightChecker", 0);
  v1 = (void *)_sharedQueue_sharedQueue;
  _sharedQueue_sharedQueue = (uint64_t)v0;

}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v4 = a1[4];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2;
    v5[3] = &unk_250693E00;
    objc_copyWeak(&v9, v2);
    v6 = a1[5];
    v7 = a1[4];
    v8 = a1[6];
    objc_msgSend(WeakRetained, "_checkTranslationSupportForConfiguration:completion:", v4, v5);

    objc_destroyWeak(&v9);
  }

}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if ((a2 & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2;
      v12[3] = &unk_250693DD8;
      objc_copyWeak(&v16, v4);
      v13 = *(id *)(a1 + 32);
      v14 = *(id *)(a1 + 40);
      v15 = *(id *)(a1 + 48);
      objc_msgSend(WeakRetained, "_resolveSourceLocaleIfNeeded:completion:", v6, v12);

      objc_destroyWeak(&v16);
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(*(id *)(a1 + 40), "effectiveSourceLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "effectiveTargetLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lt_unsupportedPairingErrorWithSource:target:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }

}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    v5 = *(void **)(a1 + 40);
    if (v3)
    {
      objc_msgSend(v5, "setResolvedSourceLocale:", v3);
      v6 = *(_QWORD *)(a1 + 40);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_3;
      v16[3] = &unk_250693DD8;
      objc_copyWeak(&v20, (id *)(a1 + 56));
      v17 = *(id *)(a1 + 32);
      v18 = *(id *)(a1 + 40);
      v19 = *(id *)(a1 + 48);
      objc_msgSend(WeakRetained, "_resolveTargetLocaleIfNeeded:completion:", v6, v16);

      objc_destroyWeak(&v20);
      goto LABEL_14;
    }
    objc_msgSend(v5, "requestedSourceLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2_cold_1((void **)(a1 + 40), v8);
      v9 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(*(id *)(a1 + 40), "requestedSourceLocale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lt_unsupportedSourceLanguageError:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 21, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sourceStrings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      v14 = _LTOSLogTextAPI();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_235438000, v15, OS_LOG_TYPE_DEFAULT, "Failed to identify source text, asking delegate to resolve it", buf, 2u);
        }
        objc_msgSend(WeakRetained, "_callDelegateOrGiveError:forConfiguration:completion:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235438000, v15, OS_LOG_TYPE_INFO, "Failed to identify source text because there aren't any source strings, returning LID failed error", buf, 2u);
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_13:

  }
LABEL_14:

}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "setResolvedTargetLocale:", v3);
      v5 = *(_QWORD *)(a1 + 40);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_4;
      v10[3] = &unk_250693DB0;
      objc_copyWeak(&v14, (id *)(a1 + 56));
      v11 = *(id *)(a1 + 32);
      v13 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "_resolveLocalePairingForConfiguration:completion:", v5, v10);

      objc_destroyWeak(&v14);
    }
    else
    {
      v6 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_3_cold_1();
      v7 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(*(id *)(a1 + 40), "effectiveTargetLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lt_unsupportedTargetLanguageError:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v3)
    {
      v5 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_4_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 13, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_5;
      v8[3] = &unk_250693D88;
      objc_copyWeak(&v12, (id *)(a1 + 56));
      v9 = *(id *)(a1 + 32);
      v10 = *(id *)(a1 + 40);
      v11 = *(id *)(a1 + 48);
      objc_msgSend(WeakRetained, "_callDelegateOrGiveError:forConfiguration:completion:", v6, v7, v8);

      objc_destroyWeak(&v12);
    }
  }

}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void (*v11)(void);
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v6)
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "isForDownloadApprovalOnly");
      v9 = _LTOSLogTextAPI();
      v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v12 = 138412290;
          v13 = v6;
          _os_log_impl(&dword_235438000, v10, OS_LOG_TYPE_INFO, "Download-only request got error, but ignoring it since it's likely the user cancelled: %@", (uint8_t *)&v12, 0xCu);
        }
        v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_5_cold_1();
        v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      }
    }
    else
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v11();
  }

}

uint64_t __75___LTPreflightChecker__checkTranslationSupportForConfiguration_completion___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __76___LTPreflightChecker__callDelegateOrGiveError_forConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76___LTPreflightChecker__callDelegateOrGiveError_forConfiguration_completion___block_invoke_2;
    block[3] = &unk_250693E78;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __76___LTPreflightChecker__callDelegateOrGiveError_forConfiguration_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke_2;
  v10[3] = &unk_250693F08;
  v11 = v5;
  v7 = *(NSObject **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = *(id *)(a1 + 48);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_3;
  v2 = (void *)MEMORY[0x24BDBCEA0];
  v21[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "supportedLocales");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_3:
    v6 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "_ltLocaleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48) != 0;
      v17 = 138543618;
      v18 = v9;
      v19 = 1024;
      LODWORD(v20) = v10;
      _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_INFO, "LID resolved source locale of '%{public}@' doesn't match any supportedLocales, considering the source language unsupported, and adding low confidence locales: %{BOOL}i", (uint8_t *)&v17, 0x12u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setLidUnsupportedLocale:", *(_QWORD *)(a1 + 32));
    v5 = 0;
  }
  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    objc_msgSend(v11, "_ltCompactMap:", &__block_literal_global_18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(a1 + 32);
      v15 = v13;
      objc_msgSend(v14, "_ltLocaleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_235438000, v15, OS_LOG_TYPE_INFO, "LID resolved source locale of '%{public}@', but also had low confidence locales so will need more user intervention: %{public}@", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setLowConfidenceLocales:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_ltLocaleIdentifier");
}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v4 = (void *)objc_msgSend(a1[4], "copy");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_2;
    v6[3] = &unk_250693DD8;
    objc_copyWeak(&v10, v2);
    v7 = a1[5];
    v5 = v4;
    v8 = v5;
    v9 = a1[6];
    objc_msgSend(WeakRetained, "_resolveTargetLocaleIfNeeded:completion:", v5, v6);

    objc_destroyWeak(&v10);
  }

}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "setResolvedTargetLocale:", v3);
      v5 = *(_QWORD *)(a1 + 40);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_20;
      v10[3] = &unk_250693DB0;
      objc_copyWeak(&v14, (id *)(a1 + 56));
      v11 = *(id *)(a1 + 32);
      v13 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "_resolveLocalePairingForConfiguration:completion:", v5, v10);

      objc_destroyWeak(&v14);
    }
    else
    {
      v6 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_2_cold_1();
      v7 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(*(id *)(a1 + 40), "effectiveTargetLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lt_unsupportedTargetLanguageError:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void (*v6)(void);

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v3)
    {
      v5 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_20_cold_1();
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v6();
  }

}

void __70___LTPreflightChecker_resolveSourceLocaleForConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _LTSELFLoggingInvocation *v4;
  void *v5;
  _LTSELFLoggingInvocation *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "dominantLocale");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v4 = [_LTSELFLoggingInvocation alloc];
    objc_msgSend(*(id *)(a1 + 32), "selfLoggingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_LTSELFLoggingInvocation initWithInvocationId:](v4, "initWithInvocationId:", v5);

    -[_LTSELFLoggingInvocation languageIdentificationCompletedWithInputSource:topLocale:lowConfidenceLocales:](v6, "languageIdentificationCompletedWithInputSource:topLocale:lowConfidenceLocales:", 1, v10, MEMORY[0x24BDBD1A8]);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "lowConfidenceLocales");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v10, v8);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "dominantUnsupportedLocale");
    v6 = (_LTSELFLoggingInvocation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowConfidenceLocales");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _LTSELFLoggingInvocation *, void *))(v9 + 16))(v9, v6, v8);
  }

}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v0, v1, "Translation isn't supported on the current device and the user was informed, returning error to the client: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "requestedSourceLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v3, v6, "Failed to validate requested source locale of %{public}@; reporting it's invalid",
    v7);

}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_235438000, v0, v1, "Failed to pick target language, won't proceed with translation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v0, v1, "Resolved source and target languages don't match supported locale pair, can't proceed with translation: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v0, v1, "Failed to wait for languages to finish downloading: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_235438000, v0, v1, "Failed to resolve valid target locale, won't proceed with translation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v0, v1, "Source and target locale were validated, but there's no matching supported locale pair: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
