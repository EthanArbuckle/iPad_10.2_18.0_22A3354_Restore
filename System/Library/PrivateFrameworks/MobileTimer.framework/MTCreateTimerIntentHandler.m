@implementation MTCreateTimerIntentHandler

- (void)resolveLabelForCreateTimer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MTMutableTimer *v10;
  MTMutableTimer *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  MTMutableTimer *v20;
  id v21;
  void (**v22)(_QWORD);
  _QWORD v23[4];
  void (**v24)(_QWORD);
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  MTCreateTimerIntentHandler *v29;
  MTMutableTimer *v30;
  id v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[MTCreateTimerIntentHandler resolveLabelForCreateTimer:withCompletion:]";
    v36 = 2112;
    v37 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    -[MTTimerIntentHandler _timerManager](self, "_timerManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [MTMutableTimer alloc];
    objc_msgSend(v6, "duration");
    v11 = -[MTTimer initWithState:duration:](v10, "initWithState:duration:", 3);
    if (objc_msgSend(v6, "type") == 2)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v6, "label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "spokenPhrase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[MTTimer setTitle:](v11, "setTitle:", v12);
    if (objc_msgSend(v6, "type"))
      v14 = objc_msgSend(v6, "type");
    else
      v14 = 1;
    v32 = CFSTR("MTTimerIntentSupportSiriContextTimerTypeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimer setSiriContext:](v11, "setSiriContext:", v16);

    v17 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke;
    v26[3] = &unk_1E39CC658;
    v18 = v9;
    v27 = v18;
    v19 = v6;
    v28 = v19;
    v29 = self;
    v20 = v11;
    v30 = v20;
    v21 = v7;
    v31 = v21;
    v22 = (void (**)(_QWORD))MEMORY[0x19AED0080](v26);
    if (objc_msgSend(v19, "type") == 2)
    {
      v23[0] = v17;
      v23[1] = 3221225472;
      v23[2] = __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_7;
      v23[3] = &unk_1E39CC680;
      v24 = v22;
      v25 = v21;
      -[MTCreateTimerIntentHandler _checkNowPlayingMediaState:](self, "_checkNowPlayingMediaState:", v23);

    }
    else
    {
      v22[2](v22);
    }

  }
}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "timers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_2;
  v12[3] = &unk_1E39CC630;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v13 = v4;
  v14 = v5;
  v15 = v6;
  v16 = *(id *)(a1 + 64);
  v7 = (id)objc_msgSend(v2, "addSuccessBlock:", v12);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_4;
  v9[3] = &unk_1E39CBF18;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 64);
  v8 = (id)objc_msgSend(v2, "addFailureBlock:", v9);

}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 40), "_timer:conflictsWithRunningTimersInTimers:", *(_QWORD *)(a1 + 48), v4);
  if (v5)
  {
    if (v6 && objc_msgSend(*(id *)(a1 + 48), "type") == 1)
    {
      v7 = (void *)MEMORY[0x1E0CBD840];
      objc_msgSend(*(id *)(a1 + 32), "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "confirmationRequiredWithStringToConfirm:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CBD840];
      objc_msgSend(*(id *)(a1 + 32), "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "successWithResolvedString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v9;

  }
  else
  {
    if (v6 && objc_msgSend(*(id *)(a1 + 48), "type") == 1)
    {
      objc_msgSend(MEMORY[0x1E0CBD840], "resolutionResultUnsupportedWithReason:", 1);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CBD840], "notRequired");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v12;
  }
  v13 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 136315650;
    v16 = "-[MTCreateTimerIntentHandler resolveLabelForCreateTimer:withCompletion:]_block_invoke_2";
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "%s Handled resolve label for intent: %@ with result: %@", (uint8_t *)&v15, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_4_cold_1();
  objc_msgSend(MEMORY[0x1E0CBD840], "unsupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_7(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (void *)MEMORY[0x1E0CBD840];
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC00]), "initWithSpokenPhrase:", &stru_1E39CF258);
    objc_msgSend(v3, "successWithResolvedString:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

- (void)resolveDurationForCreateTimer:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  os_log_t *v7;
  NSObject *v8;
  MTMutableTimer *v9;
  MTMutableTimer *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (os_log_t *)MEMORY[0x1E0CBD670];
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "-[MTCreateTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]";
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v20, 0x16u);
  }
  if (v6)
  {
    v9 = [MTMutableTimer alloc];
    objc_msgSend(v5, "duration");
    v10 = -[MTTimer initWithState:duration:](v9, "initWithState:duration:", 3);
    if (objc_msgSend(v5, "type") == 2)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v5, "label");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "spokenPhrase");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v5, "type") == 2)
    {
      +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", *MEMORY[0x1E0DBF788], 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTTimer setSound:](v10, "setSound:", v13);

    }
    -[MTTimer setTitle:](v10, "setTitle:", v11);
    if (objc_msgSend(v5, "type"))
      v14 = objc_msgSend(v5, "type");
    else
      v14 = 1;
    v26 = CFSTR("MTTimerIntentSupportSiriContextTimerTypeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimer setSiriContext:](v10, "setSiriContext:", v16);

    objc_msgSend(v5, "duration");
    if (v17 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CBDC80], "needsValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        v20 = 136315650;
        v21 = "-[MTCreateTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]";
        v22 = 2112;
        v23 = v5;
        v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_INFO, "%s Handled resolve duration for intent: %@ with result: %@", (uint8_t *)&v20, 0x20u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CBDC80], "successWithResolvedTimeInterval:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6[2](v6, v18);

  }
}

- (void)resolveTypeForCreateTimer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  MTCreateTimerIntentHandler *v22;
  id v23;
  _BYTE *v24;
  uint8_t v25[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0CBD670];
  v9 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[MTCreateTimerIntentHandler resolveTypeForCreateTimer:withCompletion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x1E0CBDC98], "successWithResolvedTimerType:", objc_msgSend(v6, "type"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke;
    v20[3] = &unk_1E39CC6D0;
    v11 = v6;
    v21 = v11;
    v22 = self;
    v24 = buf;
    v12 = v7;
    v23 = v12;
    v13 = (void *)MEMORY[0x19AED0080](v20);
    if (objc_msgSend(v11, "type") == 2)
    {
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke_3;
      v16[3] = &unk_1E39CC6F8;
      v18 = v13;
      v19 = v12;
      v17 = v11;
      -[MTCreateTimerIntentHandler _checkNowPlayingMediaState:](self, "_checkNowPlayingMediaState:", v16);

    }
    else
    {
      v14 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v25 = 136315650;
        v26 = "-[MTCreateTimerIntentHandler resolveTypeForCreateTimer:withCompletion:]";
        v27 = 2112;
        v28 = v11;
        v29 = 2112;
        v30 = v15;
        _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_INFO, "%s Handled resolve type for intent: %@ with result: %@", v25, 0x20u);
      }
      (*((void (**)(id, _QWORD))v12 + 2))(v12, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    }

    _Block_object_dispose(buf, 8);
  }

}

void __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC88]), "initWithLabel:duration:remainingTime:identifier:state:type:", 0, 0, 0, objc_msgSend(*(id *)(a1 + 32), "type"), -1.0, -1.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke_2;
  v4[3] = &unk_1E39CC6A8;
  v7 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_matchTimersFromIntentsTimer:excludeStoppedTimers:completion:", v2, 1, v4);

}

uint64_t __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (objc_msgSend(a2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CBDC98], "confirmationRequiredWithTimerTypeToConfirm:", objc_msgSend(*(id *)(a1 + 32), "type"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(id *)(v6 + 40);
    v5 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CBDC98], "successWithResolvedTimerType:", objc_msgSend(*(id *)(a1 + 32), "type"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)confirmCreateTimer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[MTCreateTimerIntentHandler confirmCreateTimer:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  if (v7)
    -[MTCreateTimerIntentHandler _createTimerWithIntent:dryRun:completion:](self, "_createTimerWithIntent:dryRun:completion:", v6, 1, v7);

}

- (void)handleCreateTimer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[MTCreateTimerIntentHandler handleCreateTimer:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  -[MTCreateTimerIntentHandler _createTimerWithIntent:dryRun:completion:](self, "_createTimerWithIntent:dryRun:completion:", v6, 0, v7);

}

- (void)_checkNowPlayingMediaState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;
  void (*v10)(id, _QWORD *);
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__MTCreateTimerIntentHandler__checkNowPlayingMediaState___block_invoke;
  v11[3] = &unk_1E39CC720;
  v11[4] = self;
  v7 = v4;
  v12 = v7;
  v8 = v5;
  v9 = v11;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v10 = (void (*)(id, _QWORD *))getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_ptr;
  v17 = getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_ptr;
  if (!getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_ptr)
  {
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_block_invoke;
    v13[3] = &unk_1E39CB690;
    v13[4] = &v14;
    __getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_block_invoke((uint64_t)v13);
    v10 = (void (*)(id, _QWORD *))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v10)
    -[MTCreateTimerIntentHandler _checkNowPlayingMediaState:].cold.1();
  v10(v8, v9);

}

uint64_t __57__MTCreateTimerIntentHandler__checkNowPlayingMediaState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = objc_msgSend(*(id *)(a1 + 32), "_isPlayingMediaFromMRPlaybackState:", a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

- (void)_createTimerWithIntent:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[5];
  id v17;
  void (**v18)(_QWORD);
  id v19;
  BOOL v20;
  _QWORD v21[4];
  id v22;
  MTCreateTimerIntentHandler *v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[5];

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke;
  v27[3] = &unk_1E39CC838;
  v27[4] = self;
  v11 = (void *)MEMORY[0x19AED0080](v27);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3_30;
  v21[3] = &unk_1E39CC860;
  v12 = v8;
  v22 = v12;
  v13 = v9;
  v23 = self;
  v24 = v13;
  v26 = a4;
  v14 = v11;
  v25 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x19AED0080](v21);
  if (objc_msgSend(v12, "type") == 2)
  {
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4_31;
    v16[3] = &unk_1E39CC888;
    v18 = v15;
    v19 = v13;
    v16[4] = self;
    v17 = v12;
    v20 = a4;
    -[MTCreateTimerIntentHandler _checkNowPlayingMediaState:](self, "_checkNowPlayingMediaState:", v16);

  }
  else
  {
    v15[2](v15);
  }

}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  MTMutableTimer *v9;
  MTMutableTimer *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  char v39;
  _QWORD v40[5];
  id v41;
  id v42;
  char v43;
  _QWORD v44[4];
  MTMutableTimer *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  const __CFString *v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = [MTMutableTimer alloc];
  objc_msgSend(v7, "duration");
  v10 = -[MTTimer initWithState:duration:](v9, "initWithState:duration:", 3);
  if (objc_msgSend(v7, "type") == 2)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spokenPhrase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "type") == 2)
  {
    +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", *MEMORY[0x1E0DBF788], 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimer setSound:](v10, "setSound:", v13);

  }
  -[MTTimer setTitle:](v10, "setTitle:", v11);
  if (objc_msgSend(v7, "type"))
    v14 = objc_msgSend(v7, "type");
  else
    v14 = 1;
  v49 = CFSTR("MTTimerIntentSupportSiriContextTimerTypeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimer setSiriContext:](v10, "setSiriContext:", v16);

  if (!a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_timerManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addTimer:", v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v21 = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2;
    v47[3] = &unk_1E39CC748;
    v22 = v20;
    v48 = v22;
    objc_msgSend(v34, "flatMap:", v47);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v21;
    v44[1] = 3221225472;
    v44[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3;
    v44[3] = &unk_1E39CC7C0;
    v45 = v10;
    v46 = v22;
    v19 = v22;
    objc_msgSend(v35, "flatMap:", v44);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v21;
    v40[1] = 3221225472;
    v40[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_26;
    v40[3] = &unk_1E39CC7E8;
    v24 = v11;
    v25 = v8;
    v26 = *(_QWORD *)(a1 + 32);
    v42 = v25;
    v40[4] = v26;
    v27 = v8;
    v28 = v7;
    v41 = v28;
    v43 = 0;
    v29 = (id)objc_msgSend(v23, "addSuccessBlock:", v40);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2_28;
    v36[3] = &unk_1E39CC810;
    v30 = v25;
    v11 = v24;
    v31 = *(_QWORD *)(a1 + 32);
    v18 = v34;
    v38 = v30;
    v36[4] = v31;
    v32 = v28;
    v8 = v27;
    v37 = v32;
    v39 = 0;
    v33 = (id)objc_msgSend(v23, "addFailureBlock:", v36);

    goto LABEL_13;
  }
  if (v8)
  {
    v17 = *(void **)(a1 + 32);
    MTIntentsTimerForTimer(v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_responseToCreateTimerIntent:withCreatedTimer:error:dryRun:", v7, v18, 0, 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v8 + 2))(v8, v19);
LABEL_13:

  }
}

uint64_t __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timers");
}

id __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4;
  v19[3] = &unk_1E39CC770;
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v12 = v4;
    v13 = 3221225472;
    v14 = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_5;
    v15 = &unk_1E39CB828;
    v16 = v3;
    v7 = v5;
    v17 = v7;
    v18 = *(id *)(a1 + 40);
    dispatch_async(v6, &v12);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7, v12, v13, v14, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "timerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_6;
  v14[3] = &unk_1E39CC798;
  v3 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[MTCreateTimerIntentHandler _createTimerWithIntent:dryRun:completion:]_block_invoke_5";
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%s Attempting to remove conflicting timer: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 48), "removeTimer:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v2;
    v12[1] = 3221225472;
    v12[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_20;
    v12[3] = &unk_1E39CBE08;
    v7 = v4;
    v13 = v7;
    v8 = (id)objc_msgSend(v6, "addSuccessBlock:", v12);
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_22;
    v10[3] = &unk_1E39CC2D8;
    v11 = v7;
    v9 = (id)objc_msgSend(v6, "addFailureBlock:", v10);

  }
}

BOOL __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_6(uint64_t a1, void *a2)
{
  return MTTimerConflictsWithTimer(*(void **)(a1 + 32), a2);
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[MTCreateTimerIntentHandler _createTimerWithIntent:dryRun:completion:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "%s Successfully removed conflicting timer: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_22_cold_1();

}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    MTIntentsTimerForTimer(a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_responseToCreateTimerIntent:withCreatedTimer:error:dryRun:", v5, v7, 0, *(unsigned __int8 *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);

  }
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2_28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_responseToCreateTimerIntent:withCreatedTimer:error:dryRun:", *(_QWORD *)(a1 + 40), 0, a2, *(unsigned __int8 *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3_30(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "duration");
  if (v2 <= 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = 2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "duration");
    if (v3 < 86400.0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      return;
    }
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = 3;
  }
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    v9 = v6;
    objc_msgSend(*(id *)(a1 + 40), "_responseToCreateTimerIntent:withCreatedTimer:error:dryRun:", *(_QWORD *)(a1 + 32), 0, v6, *(unsigned __int8 *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    v6 = v9;
  }

}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4_31(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), 10, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
    {
      v6 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_responseToCreateTimerIntent:withCreatedTimer:error:dryRun:", *(_QWORD *)(a1 + 40), 0, v3, *(unsigned __int8 *)(a1 + 64));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

      v3 = v6;
    }

  }
}

- (id)_responseToCreateTimerIntent:(id)a3 withCreatedTimer:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const __CFString *v24;
  int v25;
  const char *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v6 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10 && !v11)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD838]), "initWithCode:userActivity:", 3, 0);
    objc_msgSend(v13, "setCreatedTimer:", v10);
    v14 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("handled");
      v25 = 136315906;
      v26 = "-[MTCreateTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:]";
      v27 = 2112;
      if (v6)
        v15 = CFSTR("confirmed");
      v28 = v15;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ create timer intent %@ with response %@", (uint8_t *)&v25, 0x2Au);
    }
    goto LABEL_21;
  }
  objc_msgSend(v11, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain")))
  {
    v17 = objc_msgSend(v12, "code");

    if (v17 == 2)
      goto LABEL_19;
  }
  else
  {

  }
  objc_msgSend(v12, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain")))
  {
    v19 = objc_msgSend(v12, "code");

    if (v19 == 3)
    {
      v20 = 7;
      goto LABEL_20;
    }
  }
  else
  {

  }
  objc_msgSend(v12, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain")))
  {

    goto LABEL_19;
  }
  v20 = objc_msgSend(v12, "code");

  if (v20 != 10)
LABEL_19:
    v20 = 4;
LABEL_20:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD838]), "initWithCode:userActivity:", v20, 0);
  v22 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v24 = CFSTR("handle");
    v25 = 136316162;
    v26 = "-[MTCreateTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:]";
    v27 = 2112;
    if (v6)
      v24 = CFSTR("confirm");
    v28 = v24;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = v12;
    _os_log_error_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_ERROR, "%s Failed to %@ create timer intent %@ with response: %@, error: %@", (uint8_t *)&v25, 0x34u);
  }
LABEL_21:

  return v13;
}

- (BOOL)_timer:(id)a3 conflictsWithRunningTimersInTimers:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__MTCreateTimerIntentHandler__timer_conflictsWithRunningTimersInTimers___block_invoke;
  v8[3] = &unk_1E39CC8B0;
  v9 = v5;
  v6 = v5;
  LOBYTE(a4) = objc_msgSend(a4, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)a4;
}

BOOL __72__MTCreateTimerIntentHandler__timer_conflictsWithRunningTimersInTimers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "state") == 3 && MTTimerConflictsWithTimer(*(void **)(a1 + 32), v3);

  return v4;
}

- (BOOL)_isPlayingMediaFromMRPlaybackState:(unsigned int)a3
{
  return (a3 < 6) & (0x32u >> a3);
}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19AC4E000, v0, v1, "%s Failed to fetch timers for intent: %@, error: %@", v2);
}

- (void)_checkNowPlayingMediaState:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MRMediaRemoteGetNowPlayingApplicationPlaybackState(__strong dispatch_queue_t, void (^__strong)(MRPlaybackState))");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTCreateTimerIntentHandler.m"), 34, CFSTR("%s"), dlerror());

  __break(1u);
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_22_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19AC4E000, v0, v1, "%s Failed to remove conflicting timer: %@ with error: %@", v2);
}

@end
