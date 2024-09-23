@implementation LTTextSession

void __38___LTTextSession_synchronizationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.translation.TextSession", 0);
  v1 = (void *)synchronizationQueue_synchronizationQueue;
  synchronizationQueue_synchronizationQueue = (uint64_t)v0;

}

void __52___LTTextSession_translateString_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __24___LTTextSession_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_235438000, v2, OS_LOG_TYPE_INFO, "Attempting to cancel pending work from session", v3, 2u);
    }
    *((_BYTE *)WeakRetained + 32) = 1;
    objc_msgSend(*((id *)WeakRetained + 2), "cancelPendingWork");
  }

}

void __34___LTTextSession__prepareRequest___block_invoke(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  _BYTE *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_invocationStartedSELFLogging:", *(_QWORD *)(a1 + 32));
    if (v4[32])
    {
      v5 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __34___LTTextSession__prepareRequest___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 22, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "didReceiveError:forInput:", v13, 0);

    }
    else
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __34___LTTextSession__prepareRequest___block_invoke_10;
      v16[3] = &unk_2506940B8;
      objc_copyWeak(&v20, v2);
      v17 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 48);
      v18 = v14;
      v19 = v15;
      objc_msgSend(v4, "_supportedLocalePairsWithCompletionHandler:", v16);

      objc_destroyWeak(&v20);
    }
  }

}

void __34___LTTextSession__prepareRequest___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  char v6;
  _LTPreflightConfiguration *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "batch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "lt_hasObjectPassingTest:", &__block_literal_global_12);

    if ((v6 & 1) != 0 || (objc_msgSend(*(id *)(a1 + 40), "isForDownloadRequest") & 1) != 0)
    {
      v7 = -[_LTPreflightConfiguration initWithSession:request:supportedLocalePairs:]([_LTPreflightConfiguration alloc], "initWithSession:request:supportedLocalePairs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);
      objc_msgSend(*(id *)(a1 + 40), "logIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTPreflightConfiguration setSelfLoggingID:](v7, "setSelfLoggingID:", v8);

      objc_msgSend(WeakRetained, "preflightChecker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __34___LTTextSession__prepareRequest___block_invoke_14;
      v18[3] = &unk_250694090;
      v19 = *(id *)(a1 + 32);
      objc_copyWeak(&v21, (id *)(a1 + 56));
      v20 = *(id *)(a1 + 40);
      objc_msgSend(v9, "preflightConfiguration:completion:", v7, v18);

      objc_destroyWeak(&v21);
    }
    else
    {
      v10 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __34___LTTextSession__prepareRequest___block_invoke_10_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 3, 0);
      v7 = (_LTPreflightConfiguration *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "didReceiveError:forInput:", v7, 0);
    }

  }
}

BOOL __34___LTTextSession__prepareRequest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "sourceText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

void __34___LTTextSession__prepareRequest___block_invoke_14(uint64_t a1, void *a2, void *a3)
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
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34___LTTextSession__prepareRequest___block_invoke_2_15;
  v10[3] = &unk_250694068;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v11 = v6;
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __34___LTTextSession__prepareRequest___block_invoke_2_15(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = _LTOSLogTextAPI();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __34___LTTextSession__prepareRequest___block_invoke_2_15_cold_2(a1 + 32, v5, v6, v7, v8, v9, v10, v11);
      objc_msgSend(*(id *)(a1 + 40), "didReceiveError:forInput:", *(_QWORD *)(a1 + 32), 0);
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __34___LTTextSession__prepareRequest___block_invoke_2_15_cold_1(a1, v5);
      objc_msgSend(*(id *)(a1 + 48), "resolvedSourceLocale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setResolvedSourceLocale:", v12);

      objc_msgSend(*(id *)(a1 + 48), "resolvedTargetLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setResolvedTargetLocale:", v13);

      objc_msgSend(WeakRetained, "_beginBatchRequest:", *(_QWORD *)(a1 + 40));
    }
  }

}

void __37___LTTextSession__beginBatchRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v8)
    {
      v10 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __37___LTTextSession__beginBatchRequest___block_invoke_cold_1((uint64_t)v8, a3, v10);
      objc_msgSend(*(id *)(a1 + 40), "didReceiveError:forInput:", v8, 0);
    }
    else
    {
      objc_msgSend(v7, "targetText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = v12;
        v16 = 134218240;
        v17 = a3;
        v18 = 2048;
        v19 = objc_msgSend(v11, "length");
        _os_log_impl(&dword_235438000, v13, OS_LOG_TYPE_INFO, "Received result for item at index %zu; targetText length: %zu",
          (uint8_t *)&v16,
          0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "batch");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "didTranslateInput:withResult:", v15, v7);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

uint64_t __37___LTTextSession__beginBatchRequest___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = _LTOSLogTextAPI();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_235438000, v2, OS_LOG_TYPE_INFO, "Finished translating all %zu inputs", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "didComplete");
}

void __61___LTTextSession_translateRequest_forSession_perItemHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  void *v7;
  int v8;
  _LTTextResult *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _LTTextResult *v14;
  void *v15;
  _LTMultiParagraphTranslationRequest *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _LTMultiParagraphTranslationRequest *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31[2];

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(v5, "sourceText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "lt_isWhiteSpaceOnlyString");

    if (v8)
    {
      v9 = [_LTTextResult alloc];
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "sourceText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_LTTextResult initWithLocalePair:sourceText:targetText:clientIdentifier:](v9, "initWithLocalePair:sourceText:targetText:clientIdentifier:", v10, v11, v12, v13);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = [_LTMultiParagraphTranslationRequest alloc];
      objc_msgSend(v5, "sourceText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v23 = MEMORY[0x24BDAC760];
      v24 = 3221225472;
      v25 = __61___LTTextSession_translateRequest_forSession_perItemHandler___block_invoke_2;
      v26 = &unk_250694130;
      objc_copyWeak(v31, (id *)(a1 + 56));
      v27 = *(id *)(a1 + 32);
      v28 = v5;
      v30 = *(id *)(a1 + 48);
      v31[1] = a3;
      v19 = v15;
      v29 = v19;
      v20 = -[_LTMultiParagraphTranslationRequest initWithText:localePair:completionHandler:](v16, "initWithText:localePair:completionHandler:", v17, v18, &v23);

      v21 = *(void **)(a1 + 40);
      -[_LTMultiParagraphTranslationRequest paragraphRequests](v20, "paragraphRequests", v23, v24, v25, v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v22);

      objc_msgSend(WeakRetained[5], "setObject:forKeyedSubscript:", v20, v19);
      objc_destroyWeak(v31);

    }
  }

}

void __61___LTTextSession_translateRequest_forSession_perItemHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _LTTextResult *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _LTTextResult *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v14)
    {
      objc_msgSend(v14, "translatedText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = [_LTTextResult alloc];
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "sourceText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_LTTextResult initWithLocalePair:sourceText:targetText:clientIdentifier:](v9, "initWithLocalePair:sourceText:targetText:clientIdentifier:", v10, v11, v8, v12);

    }
    else
    {
      v13 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(WeakRetained, "_didFinishMultiParagraphRequestWithUUID:", *(_QWORD *)(a1 + 48));

  }
}

void __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_235438000, v3, OS_LOG_TYPE_INFO, "Preflight checker got to step that needs user intervention, asking delegate to respond", v4, 2u);
    }
    objc_msgSend(WeakRetained, "_callDelegateOrGiveError:forConfiguration:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_27(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (a2)
    {
      v5 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235438000, v5, OS_LOG_TYPE_INFO, "All assets are already installed, proceeding with translation", buf, 2u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 20, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_28;
      v8[3] = &unk_250694180;
      v7 = *(_QWORD *)(a1 + 40);
      v9 = *(id *)(a1 + 48);
      objc_msgSend(WeakRetained, "_callDelegateOrGiveError:forConfiguration:completion:", v6, v7, v8);

    }
  }

}

void __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v5 = a3;
  v6 = a2;
  v7 = _LTOSLogTextAPI();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_28_cold_1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_DEFAULT, "Finished waiting on download sheet, continuing with translation", v15, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 3);
    objc_msgSend(a1[4], "resolvedSourceLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "resolvedTargetLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke_2;
    v8[3] = &unk_2506941F8;
    v9 = a1[5];
    objc_copyWeak(&v12, v2);
    v10 = a1[4];
    v11 = a1[6];
    objc_msgSend(v5, "statusFromLanguage:toLanguage:completion:", v6, v7, v8);

    objc_destroyWeak(&v12);
  }

}

void __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8[2];

  v4 = *(NSObject **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke_3;
  v5[3] = &unk_2506941D0;
  objc_copyWeak(v8, (id *)(a1 + 56));
  v8[1] = a2;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);

  objc_destroyWeak(v8);
}

void __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (*(_QWORD *)(a1 + 56) == 1)
      objc_msgSend(*(id *)(a1 + 32), "isForDownloadApprovalOnly");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

void __61___LTTextSession__supportedLocalePairsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61___LTTextSession__supportedLocalePairsWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_250694220;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __61___LTTextSession__supportedLocalePairsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __51___LTTextSession__translateRequest_perItemHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = a2;
  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51___LTTextSession__translateRequest_perItemHandler___block_invoke_2;
  v12[3] = &unk_250694270;
  v9 = *(NSObject **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = a3;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

uint64_t __51___LTTextSession__translateRequest_perItemHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[7], a1[5]);
}

void __58___LTTextSession__didFinishMultiParagraphRequestWithUUID___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[5], "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __34___LTTextSession__prepareRequest___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_235438000, a1, a3, "Refusing new translation request because text session has already been cancelled", a5, a6, a7, a8, 0);
}

void __34___LTTextSession__prepareRequest___block_invoke_10_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_235438000, a1, a3, "Unable to translate since there's no content to translate", a5, a6, a7, a8, 0);
}

void __34___LTTextSession__prepareRequest___block_invoke_2_15_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 48);
  v4 = a2;
  objc_msgSend(v3, "resolvedSourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ltLocaleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "resolvedTargetLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_ltLocaleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543618;
  v11 = v6;
  v12 = 2114;
  v13 = v8;
  OUTLINED_FUNCTION_3_2(&dword_235438000, v4, v9, "Resolved preflight information, using source locale %{public}@, target locale %{public}@", (uint8_t *)&v10);

}

void __34___LTTextSession__prepareRequest___block_invoke_2_15_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Failed to determine all preflight information, won't proceed with translation: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __37___LTTextSession__beginBatchRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_235438000, log, OS_LOG_TYPE_ERROR, "Failed to translate input %zu; returning error: %@",
    (uint8_t *)&v3,
    0x16u);
  OUTLINED_FUNCTION_1();
}

void __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_28_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Failed to finish waiting on downloads: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
