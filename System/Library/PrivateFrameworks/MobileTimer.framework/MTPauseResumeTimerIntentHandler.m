@implementation MTPauseResumeTimerIntentHandler

- (void)resolveTargetTimerForPauseTimer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[MTPauseResumeTimerIntentHandler resolveTargetTimerForPauseTimer:withCompletion:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    objc_msgSend(v6, "targetTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUpdateTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3A05E50);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pauseMultiple");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__MTPauseResumeTimerIntentHandler_resolveTargetTimerForPauseTimer_withCompletion___block_invoke;
    v15[3] = &unk_1E39CB2D8;
    v16 = v10;
    v17 = v7;
    v14 = v10;
    -[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:](self, "_genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:", v14, v13, v11, v15);

  }
}

void __82__MTPauseResumeTimerIntentHandler_resolveTargetTimerForPauseTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
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

- (void)resolvePauseMultipleForPauseTimer:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[MTPauseResumeTimerIntentHandler resolvePauseMultipleForPauseTimer:withCompletion:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CBD780];
    objc_msgSend(v5, "pauseMultiple");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);

  }
}

- (void)confirmPauseTimer:(id)a3 completion:(id)a4
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
    v10 = "-[MTPauseResumeTimerIntentHandler confirmPauseTimer:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  -[MTPauseResumeTimerIntentHandler _handlePauseTimer:dryRun:completion:](self, "_handlePauseTimer:dryRun:completion:", v6, 1, v7);

}

- (void)handlePauseTimer:(id)a3 completion:(id)a4
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
    v10 = "-[MTPauseResumeTimerIntentHandler handlePauseTimer:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  -[MTPauseResumeTimerIntentHandler _handlePauseTimer:dryRun:completion:](self, "_handlePauseTimer:dryRun:completion:", v6, 0, v7);

}

- (void)_handlePauseTimer:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "targetTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUpdateTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v10, objc_msgSend(v11, "state"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pauseMultiple");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__MTPauseResumeTimerIntentHandler__handlePauseTimer_dryRun_completion___block_invoke_3;
  v17[3] = &unk_1E39CB340;
  v18 = v8;
  v19 = v9;
  v17[4] = self;
  v20 = v6;
  v15 = v8;
  v16 = v9;
  -[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:](self, "_updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:", v12, v6, v14, 1, &__block_literal_global, &__block_literal_global_7, v17);

}

BOOL __71__MTPauseResumeTimerIntentHandler__handlePauseTimer_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 3;
}

uint64_t __71__MTPauseResumeTimerIntentHandler__handlePauseTimer_dryRun_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setState:", 2);
  return 0;
}

void __71__MTPauseResumeTimerIntentHandler__handlePauseTimer_dryRun_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_responseToPauseTimerIntent:withPausedTimers:error:dryRun:", *(_QWORD *)(a1 + 40), a2, a3, *(unsigned __int8 *)(a1 + 56));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (void)resolveTargetTimerForResumeTimer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[MTPauseResumeTimerIntentHandler resolveTargetTimerForResumeTimer:withCompletion:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  objc_msgSend(v6, "targetTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3A05C78, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeMultiple");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__MTPauseResumeTimerIntentHandler_resolveTargetTimerForResumeTimer_withCompletion___block_invoke;
  v15[3] = &unk_1E39CB2D8;
  v16 = v9;
  v17 = v7;
  v13 = v7;
  v14 = v9;
  -[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:](self, "_genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:", v14, v12, v10, v15);

}

void __83__MTPauseResumeTimerIntentHandler_resolveTargetTimerForResumeTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
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

- (void)resolveResumeMultipleForResumeTimer:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[MTPauseResumeTimerIntentHandler resolveResumeMultipleForResumeTimer:withCompletion:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CBD780];
    objc_msgSend(v5, "resumeMultiple");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);

  }
}

- (void)confirmResumeTimer:(id)a3 completion:(id)a4
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
    v10 = "-[MTPauseResumeTimerIntentHandler confirmResumeTimer:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  -[MTPauseResumeTimerIntentHandler _handleResumeTimer:dryRun:completion:](self, "_handleResumeTimer:dryRun:completion:", v6, 1, v7);

}

- (void)handleResumeTimer:(id)a3 completion:(id)a4
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
    v10 = "-[MTPauseResumeTimerIntentHandler handleResumeTimer:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  -[MTPauseResumeTimerIntentHandler _handleResumeTimer:dryRun:completion:](self, "_handleResumeTimer:dryRun:completion:", v6, 0, v7);

}

- (void)_handleResumeTimer:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "targetTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUpdateTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v10, objc_msgSend(v11, "state"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "resumeMultiple");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__MTPauseResumeTimerIntentHandler__handleResumeTimer_dryRun_completion___block_invoke_3;
  v17[3] = &unk_1E39CB340;
  v18 = v8;
  v19 = v9;
  v17[4] = self;
  v20 = v6;
  v15 = v8;
  v16 = v9;
  -[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:](self, "_updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:", v12, v6, v14, 1, &__block_literal_global_9, &__block_literal_global_10, v17);

}

BOOL __72__MTPauseResumeTimerIntentHandler__handleResumeTimer_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 2;
}

uint64_t __72__MTPauseResumeTimerIntentHandler__handleResumeTimer_dryRun_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setState:", 3);
  return 0;
}

void __72__MTPauseResumeTimerIntentHandler__handleResumeTimer_dryRun_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_responseToResumeTimerIntent:withResumedTimers:error:dryRun:", *(_QWORD *)(a1 + 40), a2, a3, *(unsigned __int8 *)(a1 + 56));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (id)_responseToPauseTimerIntent:(id)a3 withPausedTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6
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
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v6 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10 && !v11)
  {
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA38]), "initWithCode:userActivity:", 3, 0);
    -[__CFString setPausedTimers:](v13, "setPausedTimers:", v10);
    v14 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("handled");
      *(_DWORD *)buf = 136315906;
      v29 = "-[MTPauseResumeTimerIntentHandler _responseToPauseTimerIntent:withPausedTimers:error:dryRun:]";
      v30 = 2112;
      if (v6)
        v15 = CFSTR("confirmed");
      v31 = v15;
      v32 = 2112;
      v33 = v9;
      v34 = 2112;
      v35 = v13;
      _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ pause timer attribute intent %@ with response %@", buf, 0x2Au);
    }
    goto LABEL_17;
  }
  objc_msgSend(v11, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain"));

  if (v17)
  {
    v18 = objc_msgSend(v12, "code");
    switch(v18)
    {
      case 7:
        v19 = objc_alloc(MEMORY[0x1E0CBDA38]);
        v20 = 7;
LABEL_13:
        v13 = (__CFString *)objc_msgSend(v19, "initWithCode:userActivity:", v20, 0);
        if (v13)
          goto LABEL_15;
        break;
      case 6:
        v23 = objc_alloc(MEMORY[0x1E0CBDA38]);
        objc_msgSend(v9, "pauseMultiple");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "BOOLValue"))
          v25 = 9;
        else
          v25 = 8;
        v13 = (__CFString *)objc_msgSend(v23, "initWithCode:userActivity:", v25, 0);

        if (v13)
          goto LABEL_15;
        break;
      case 5:
        v19 = objc_alloc(MEMORY[0x1E0CBDA38]);
        v20 = 6;
        goto LABEL_13;
    }
  }
  v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA38]), "initWithCode:userActivity:", 4, 0);
LABEL_15:
  v21 = (id)*MEMORY[0x1E0CBD670];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v26 = v6 ? CFSTR("confirm") : CFSTR("handle");
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("due to error %@"), v12);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = &stru_1E39CF258;
    }
    *(_DWORD *)buf = 136315906;
    v29 = "-[MTPauseResumeTimerIntentHandler _responseToPauseTimerIntent:withPausedTimers:error:dryRun:]";
    v30 = 2112;
    v31 = v26;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v27;
    _os_log_error_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_ERROR, "%s Failed to %@ pause timer intent %@%@", buf, 0x2Au);
    if (v12)

  }
LABEL_17:

  return v13;
}

- (id)_responseToResumeTimerIntent:(id)a3 withResumedTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6
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
  uint64_t v19;
  void *v20;
  NSObject *v21;
  __CFString *v23;
  __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  id v30;
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

    if (v17)
    {
      v18 = objc_msgSend(v12, "code");
      switch(v18)
      {
        case 7:
          v19 = 7;
          break;
        case 6:
          objc_msgSend(v9, "resumeMultiple");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "BOOLValue"))
            v19 = 9;
          else
            v19 = 8;

          break;
        case 5:
          v19 = 6;
          break;
        default:
          v19 = 4;
          break;
      }
    }
    else
    {
      v19 = 4;
    }
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDB08]), "initWithCode:userActivity:", v19, 0);
    v21 = (id)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = v6 ? CFSTR("confirm") : CFSTR("handle");
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("due to error %@"), v12);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = &stru_1E39CF258;
      }
      *(_DWORD *)buf = 136315906;
      v26 = "-[MTPauseResumeTimerIntentHandler _responseToResumeTimerIntent:withResumedTimers:error:dryRun:]";
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v24;
      _os_log_error_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_ERROR, "%s Failed to %@ resume timer intent %@%@", buf, 0x2Au);
      if (v12)

    }
  }
  else
  {
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDB08]), "initWithCode:userActivity:", 3, 0);
    -[__CFString setResumedTimers:](v13, "setResumedTimers:", v10);
    v14 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("handled");
      *(_DWORD *)buf = 136315906;
      v26 = "-[MTPauseResumeTimerIntentHandler _responseToResumeTimerIntent:withResumedTimers:error:dryRun:]";
      v27 = 2112;
      if (v6)
        v15 = CFSTR("confirmed");
      v28 = (__CFString *)v15;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ resume timer attribute intent %@ with response %@", buf, 0x2Au);
    }
  }

  return v13;
}

@end
