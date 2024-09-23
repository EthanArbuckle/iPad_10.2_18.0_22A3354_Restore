@implementation LTTranslationSession

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = *(unsigned __int8 *)(a1 + 48);
    v4 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2;
    v9[3] = &unk_2506944F8;
    v5 = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_4;
    v6[3] = &unk_250694548;
    objc_copyWeak(&v8, &location);
    v7 = *(id *)(a1 + 40);
    +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", v5, v3, v9, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setService:", v5);

  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v8, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2_5;
  v10[3] = &unk_250694520;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "configInfoForLocale:otherLocale:completion:", 0, 0, v10);

  objc_destroyWeak(&v12);
}

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _LTRateLimiter *v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RateLimitingMaximumPageLoadRequests"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RateLimitingMaximumDynamicContentRequests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntValue");
  v8 = -[_LTRateLimiter initWithMaximumPageLoadRequest:maximumDynamicContentRequests:]([_LTRateLimiter alloc], "initWithMaximumPageLoadRequest:maximumDynamicContentRequests:", v5, v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setRateLimiter:", v8);

  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "translationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_3;
  block[3] = &unk_250693F80;
  v13 = *(id *)(a1 + 32);
  dispatch_async(v11, block);

}

uint64_t __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  dispatch_queue_t *WeakRetained;
  id v11;
  id *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  _LTSafariLatencyLoggingRequest *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  id *from;
  id *froma;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_cold_2(a1, v4);
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v5 = (id *)*(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v56 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "completionHandler");
          v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v3);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v6);
    }
  }
  else
  {
    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
    v5 = (id *)WeakRetained;
    if (WeakRetained)
    {
      dispatch_assert_queue_V2(WeakRetained[10]);
      v11 = v5[9];
      if (v11
        && (v12 = (id *)(a1 + 32),
            (objc_msgSend(v11, "allowedForRequests:", objc_msgSend(*(id *)(a1 + 32), "count")) & 1) == 0))
      {
        v33 = _LTOSLogXPC();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_cold_1((uint64_t)v12, v33);
        v34 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("RATE_LIMIT_EXCEEDED_ERROR_DESCRIPTION"), &stru_250695360, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lt_errorWithCode:description:userInfo:", 15, v36, 0);
        v32 = (id)objc_claimAutoreleasedReturnValue();

        v53 = 0u;
        v54 = 0u;
        v52 = 0u;
        v51 = 0u;
        v26 = *v12;
        v37 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
        if (v37)
        {
          v38 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v37; ++j)
            {
              if (*(_QWORD *)v52 != v38)
                objc_enumerationMutation(v26);
              objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "completionHandler");
              v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, _QWORD, id))v40)[2](v40, 0, v32);

            }
            v37 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
          }
          while (v37);
        }
      }
      else
      {
        from = (id *)(a1 + 40);
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v13 = *(id *)(a1 + 32);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v48;
          do
          {
            for (k = 0; k != v14; ++k)
            {
              if (*(_QWORD *)v48 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
              v18 = v5[1];
              objc_msgSend(v17, "uniqueID", from);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
          }
          while (v14);
        }

        objc_msgSend(*(id *)(a1 + 32), "_ltCompactMap:", &__block_literal_global_13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = _LTOSLogXPC();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = *(void **)(a1 + 32);
          v23 = v21;
          v24 = objc_msgSend(v22, "count");
          *(_DWORD *)buf = 134217984;
          v60 = v24;
          _os_log_impl(&dword_235438000, v23, OS_LOG_TYPE_INFO, "Session sending %zd requests", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 32), "firstObject", from);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "requestContext");
        v26 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5[3], "UUIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setSessionID:", v27);

        objc_msgSend(v26, "setLogIdentifier:", v5[6]);
        if (!v5[2])
        {
          objc_msgSend(v26, "setSourceURL:", v5[5]);
          v28 = objc_alloc_init(_LTSafariLatencyLoggingRequest);
          objc_msgSend(v26, "localePair");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[_LTSafariLatencyLoggingRequest setLocalePair:](v28, "setLocalePair:", v29);

          v30 = v5[2];
          v5[2] = v28;

        }
        objc_msgSend(v5, "service");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_18;
        v43[3] = &unk_2506945E0;
        objc_copyWeak(&v46, froma);
        v32 = v20;
        v44 = v32;
        v45 = *(id *)(a1 + 32);
        objc_msgSend(v31, "translateParagraphs:withContext:completion:", v32, v26, v43);

        objc_destroyWeak(&v46);
      }

    }
  }

}

uint64_t __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "translationParagraph");
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_18(id *a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  NSObject **v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[10];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_2;
    v7[3] = &unk_2506945B8;
    v8 = v3;
    v9 = a1[4];
    v10 = a1[5];
    v11 = v5;
    dispatch_async(v6, v7);

  }
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = _LTOSLogTranslationEngine();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_2_cold_1(a1, v5);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "completionHandler", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "completionHandler");
            v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v13[2](v13, 0, *v2);

          }
          v14 = *(void **)(*(_QWORD *)(a1 + 56) + 8);
          objc_msgSend(v11, "uniqueID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectForKey:", v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v16 = *(void **)(a1 + 40);
    v17 = v5;
    *(_DWORD *)buf = 134217984;
    v23 = objc_msgSend(v16, "count");
    _os_log_impl(&dword_235438000, v17, OS_LOG_TYPE_INFO, "Finished sending %zu paragraphs", buf, 0xCu);

  }
}

void __42___LTTranslationSession_cancelPendingWork__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v2 = _LTOSLogXPC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __42___LTTranslationSession_cancelPendingWork__block_invoke_cold_1(v2);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "sessionID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 138543362;
        v9 = v5;
        _os_log_impl(&dword_235438000, v6, OS_LOG_TYPE_INFO, "Client requested to cancel pending work for sessionID %{public}@", (uint8_t *)&v8, 0xCu);
      }
      objc_msgSend(v4, "service");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attemptToCancelRequestsWithSessionID:", v5);

    }
  }
}

void __41___LTTranslationSession_provideFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __41___LTTranslationSession_provideFeedback___block_invoke_cold_1();
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v6 = _LTOSLogUserFeedback();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_235438000, v6, OS_LOG_TYPE_DEFAULT, "Session sending feedback", v10, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "localePair");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(WeakRetained[2], "localePair");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setLocalePair:", v8);

      }
      objc_msgSend(WeakRetained[3], "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSessionID:", v9);

      objc_msgSend(WeakRetained[7], "log:", *(_QWORD *)(a1 + 32));
    }

  }
}

void __51___LTTranslationSession_markFirstParagraphComplete__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[2], "markFirstParagraphComplete");
    WeakRetained = v2;
  }

}

void __41___LTTranslationSession_markProgressDone__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[2], "markProgressDone");
    WeakRetained = v2;
  }

}

void __41___LTTranslationSession_markPageComplete__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[9], "markPageLoaded");
    objc_msgSend(v2[2], "markPageComplete");
    objc_msgSend(v2[7], "log:", v2[2]);
    WeakRetained = v2;
  }

}

void __59___LTTranslationSession_paragraphTranslation_result_error___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained[2], "markResponse");
    objc_msgSend(v7[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "completionHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "completionHandler");
        v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v6[2](v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      }
      objc_msgSend(v7[1], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    }

    WeakRetained = v7;
  }

}

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v0, v1, "Error ensuring service connection %@", v2);
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v2, v4, "Translation rate limit reached, ignoring %zu requests", v5);

  OUTLINED_FUNCTION_6_0();
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v2, v4, "Translation XPC connection failure, ignoring %zu requests", v5);

  OUTLINED_FUNCTION_6_0();
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 40);
  v3 = a2;
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_2();
  v6 = 2114;
  v7 = v4;
  _os_log_error_impl(&dword_235438000, v3, OS_LOG_TYPE_ERROR, "Error sending %zd paragraphs %{public}@", v5, 0x16u);

}

void __42___LTTranslationSession_cancelPendingWork__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_235438000, log, OS_LOG_TYPE_ERROR, "Failed to make XPC connection, can't cancel pending work", v1, 2u);
}

void __41___LTTranslationSession_provideFeedback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_235438000, v0, v1, "Translation XPC connection failure, abort sending session feedback: %@", v2);
}

@end
