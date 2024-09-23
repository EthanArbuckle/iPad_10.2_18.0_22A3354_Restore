@implementation MTCreateSingleTimerIntentHandler

- (void)resolveLabelForCreateTimer:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject **v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (NSObject **)MEMORY[0x1E0CBD670];
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[MTCreateSingleTimerIntentHandler resolveLabelForCreateTimer:withCompletion:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CBD840], "notRequired");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 136315650;
      v12 = "-[MTCreateSingleTimerIntentHandler resolveLabelForCreateTimer:withCompletion:]";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_INFO, "%s Handled resolve label for intent: %@ with result: %@", (uint8_t *)&v11, 0x20u);
    }
    v6[2](v6, v9);

  }
}

- (void)resolveDurationForCreateTimer:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  os_log_t *v8;
  NSObject *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(id, void *);
  id v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, void *);
  _QWORD v22[4];
  id v23;
  void (**v24)(id, void *);
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (os_log_t *)MEMORY[0x1E0CBD670];
  v9 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[MTCreateSingleTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]";
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    objc_msgSend(v6, "duration");
    if (v10 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CBDC80], "needsValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "-[MTCreateSingleTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]";
        v27 = 2112;
        v28 = v6;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_INFO, "%s Handled resolve duration for intent: %@ with result: %@", buf, 0x20u);
      }
      v7[2](v7, v11);
    }
    else
    {
      -[MTTimerIntentHandler _timerManager](self, "_timerManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke;
      v22[3] = &unk_1E39CB538;
      v14 = v6;
      v23 = v14;
      v15 = v7;
      v24 = v15;
      v16 = (id)objc_msgSend(v12, "addSuccessBlock:", v22);
      v19[0] = v13;
      v19[1] = 3221225472;
      v19[2] = __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke_2;
      v19[3] = &unk_1E39CBF18;
      v20 = v14;
      v21 = v15;
      v17 = (id)objc_msgSend(v12, "addFailureBlock:", v19);

    }
  }

}

void __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");
  v5 = (void *)MEMORY[0x1E0CBDC80];
  objc_msgSend(*(id *)(a1 + 32), "duration");
  if (v4 == 3)
    objc_msgSend(v5, "confirmationRequiredWithTimeIntervalToConfirm:");
  else
    objc_msgSend(v5, "successWithResolvedTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 136315650;
    v10 = "-[MTCreateSingleTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]_block_invoke";
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_INFO, "%s Handled resolve duration for intent: %@ with result: %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  v4 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  objc_msgSend(MEMORY[0x1E0CBDC80], "unsupported");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

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
    v10 = "-[MTCreateSingleTimerIntentHandler confirmCreateTimer:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  if (v7)
    -[MTCreateSingleTimerIntentHandler _createTimerWithIntent:dryRun:completion:](self, "_createTimerWithIntent:dryRun:completion:", v6, 1, v7);

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
    v10 = "-[MTCreateSingleTimerIntentHandler handleCreateTimer:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  -[MTCreateSingleTimerIntentHandler _createTimerWithIntent:dryRun:completion:](self, "_createTimerWithIntent:dryRun:completion:", v6, 0, v7);

}

- (void)_createTimerWithIntent:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  double v10;
  double v11;
  MTMutableTimer *v12;
  MTMutableTimer *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void (**v27)(id, void *);
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(id, void *);
  char v34;
  _QWORD v35[5];
  id v36;
  void (**v37)(id, void *);
  char v38;
  _QWORD v39[4];
  id v40;
  id v41;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  objc_msgSend(v8, "duration");
  if (v10 <= 0.0)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = 2;
    goto LABEL_8;
  }
  objc_msgSend(v8, "duration");
  if (v11 >= 86400.0)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = 3;
LABEL_8:
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), v19, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[MTCreateSingleTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:](self, "_responseToCreateTimerIntent:withCreatedTimer:error:dryRun:", v8, 0, v20, v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v21);

    }
    goto LABEL_11;
  }
  if (!v6)
  {
    -[MTTimerIntentHandler _timerManager](self, "_timerManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke;
    v39[3] = &unk_1E39CC7C0;
    v25 = v8;
    v40 = v25;
    v41 = v22;
    v20 = v22;
    objc_msgSend(v23, "flatMap:", v39);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = v24;
    v35[1] = 3221225472;
    v35[2] = __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3;
    v35[3] = &unk_1E39CDBC8;
    v27 = v9;
    v37 = v27;
    v35[4] = self;
    v28 = v25;
    v36 = v28;
    v38 = 0;
    v29 = (id)objc_msgSend(v26, "addSuccessBlock:", v35);
    v31[0] = v24;
    v31[1] = 3221225472;
    v31[2] = __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4;
    v31[3] = &unk_1E39CC810;
    v33 = v27;
    v31[4] = self;
    v32 = v28;
    v34 = 0;
    v30 = (id)objc_msgSend(v26, "addFailureBlock:", v31);

LABEL_11:
    goto LABEL_12;
  }
  if (v9)
  {
    v12 = [MTMutableTimer alloc];
    objc_msgSend(v8, "duration");
    v13 = -[MTTimer initWithState:duration:](v12, "initWithState:duration:", 3);
    objc_msgSend(v8, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "spokenPhrase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimer setTitle:](v13, "setTitle:", v15);

    MTIntentsTimerForTimer(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCreateSingleTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:](self, "_responseToCreateTimerIntent:withCreatedTimer:error:dryRun:", v8, v16, 0, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v17);

  }
LABEL_12:

}

id __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (v4)
  {
    objc_msgSend(v4, "setState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "duration");
    objc_msgSend(v4, "setDuration:");
    objc_msgSend(v4, "setState:", 3);
    objc_msgSend(*(id *)(a1 + 40), "updateTimer:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2;
    v9[3] = &unk_1E39CC748;
    v10 = v4;
    objc_msgSend(v5, "flatMap:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), 4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

void __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3(uint64_t a1, void *a2)
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

void __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_responseToCreateTimerIntent:withCreatedTimer:error:dryRun:", *(_QWORD *)(a1 + 40), 0, a2, *(unsigned __int8 *)(a1 + 56));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (id)_responseToCreateTimerIntent:(id)a3 withCreatedTimer:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const __CFString *v29;
  int v30;
  const char *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v6 = a6;
  v41[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3B10], "mtUserActivityWithActivityType:", CFSTR("com.apple.clock.timer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("identifier");
  objc_msgSend(v9, "identifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E39CF258;
  v40[1] = CFSTR("duration");
  v41[0] = v15;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "duration");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInfo:", v18);

  if (v10 && !v11)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD838]), "initWithCode:userActivity:", 3, v12);
    objc_msgSend(v19, "setCreatedTimer:", v10);
    v20 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v21 = CFSTR("handled");
      v30 = 136315906;
      v31 = "-[MTCreateSingleTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:]";
      v32 = 2112;
      if (v6)
        v21 = CFSTR("confirmed");
      v33 = v21;
      v34 = 2112;
      v35 = v9;
      v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_INFO, "%s Successfully %@ create timer intent %@ with response %@", (uint8_t *)&v30, 0x2Au);
    }
    goto LABEL_20;
  }
  objc_msgSend(v11, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain")))
  {
    v23 = objc_msgSend(v11, "code");

    if (v23 == 2)
      goto LABEL_18;
  }
  else
  {

  }
  objc_msgSend(v11, "domain");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain")))
  {
    v25 = objc_msgSend(v11, "code");

    if (v25 == 3)
    {
      v26 = 7;
      goto LABEL_19;
    }
  }
  else
  {

  }
LABEL_18:
  v26 = 4;
LABEL_19:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD838]), "initWithCode:userActivity:", v26, v12);
  v27 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v29 = CFSTR("handle");
    v30 = 136316162;
    v31 = "-[MTCreateSingleTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:]";
    v32 = 2112;
    if (v6)
      v29 = CFSTR("confirm");
    v33 = v29;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v19;
    v38 = 2112;
    v39 = v11;
    _os_log_error_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_ERROR, "%s Failed to %@ create timer intent %@ with response: %@, error: %@", (uint8_t *)&v30, 0x34u);
  }
LABEL_20:

  return v19;
}

void __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[MTCreateSingleTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%s Failed to fetch timers for intent: %@, error: %@", (uint8_t *)&v4, 0x20u);
}

@end
