@implementation MTResetTimerIntentHandler

- (void)resolveTargetTimerForResetTimer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[MTResetTimerIntentHandler resolveTargetTimerForResetTimer:withCompletion:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    objc_msgSend(v6, "targetTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUpdateTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v9, objc_msgSend(v10, "state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "type") == 2)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3A05D80, &unk_1E3A05D98, 0, v16);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3A05D80, &unk_1E3A05D98, &unk_1E3A05DB0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetMultiple");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__MTResetTimerIntentHandler_resolveTargetTimerForResetTimer_withCompletion___block_invoke;
    v17[3] = &unk_1E39CB2D8;
    v18 = v11;
    v19 = v7;
    v15 = v11;
    -[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:](self, "_genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:", v15, v14, v12, v17);

  }
}

void __76__MTResetTimerIntentHandler_resolveTargetTimerForResetTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBDC90], "successWithResolvedTimer:", *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)confirmResetTimer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[MTResetTimerIntentHandler confirmResetTimer:completion:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__MTResetTimerIntentHandler_confirmResetTimer_completion___block_invoke;
    v9[3] = &unk_1E39CD048;
    v11 = v7;
    v9[4] = self;
    v10 = v6;
    -[MTResetTimerIntentHandler _handleResetTimer:dryRun:completion:](self, "_handleResetTimer:dryRun:completion:", v10, 1, v9);

  }
}

void __58__MTResetTimerIntentHandler_confirmResetTimer_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_responseToResetTimerIntent:withResetTimers:error:dryRun:", *(_QWORD *)(a1 + 40), a2, a3, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)handleResetTimer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[MTResetTimerIntentHandler handleResetTimer:completion:]";
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__MTResetTimerIntentHandler_handleResetTimer_completion___block_invoke;
  v11[3] = &unk_1E39CD048;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[MTResetTimerIntentHandler _handleResetTimer:dryRun:completion:](self, "_handleResetTimer:dryRun:completion:", v9, 0, v11);

}

void __57__MTResetTimerIntentHandler_handleResetTimer_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_responseToResetTimerIntent:withResetTimers:error:dryRun:", *(_QWORD *)(a1 + 40), a2, a3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (void)_handleResetTimer:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "targetTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUpdateTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v10, objc_msgSend(v11, "state"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "resetMultiple");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:](self, "_updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:", v13, v5, objc_msgSend(v12, "BOOLValue"), 0, 0, &__block_literal_global_33, v8);
}

uint64_t __65__MTResetTimerIntentHandler__handleResetTimer_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setState:", 1);
  objc_msgSend(v2, "setState:", 3);

  return 0;
}

- (id)_responseToResetTimerIntent:(id)a3 withResetTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  __CFString *v21;
  __CFString *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10 || v11)
  {
    objc_msgSend(v11, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain"));

    if (!v17
      || (v18 = objc_msgSend(v12, "code"), (unint64_t)(v18 - 5) > 2)
      || (v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDAF0]), "initWithCode:userActivity:", qword_19ACFF020[v18 - 5], 0)) == 0)
    {
      v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDAF0]), "initWithCode:userActivity:", 4, 0);
    }
    v19 = (id)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = v6 ? CFSTR("confirm") : CFSTR("handle");
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("due to error %@"), v12);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = &stru_1E39CF258;
      }
      *(_DWORD *)buf = 136316162;
      v24 = "-[MTResetTimerIntentHandler _responseToResetTimerIntent:withResetTimers:error:dryRun:]";
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v13;
      _os_log_error_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_ERROR, "%s Failed to %@ reset timer intent %@ %@, response: %@", buf, 0x34u);
      if (v12)

    }
  }
  else
  {
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDAF0]), "initWithCode:userActivity:", 3, 0);
    -[__CFString setResetTimers:](v13, "setResetTimers:", v10);
    v14 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("handled");
      *(_DWORD *)buf = 136315906;
      v24 = "-[MTResetTimerIntentHandler _responseToResetTimerIntent:withResetTimers:error:dryRun:]";
      v25 = 2112;
      if (v6)
        v15 = CFSTR("confirmed");
      v26 = (__CFString *)v15;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ reset timer intent %@ with response %@", buf, 0x2Au);
    }
  }

  return v13;
}

@end
