@implementation MTSetTimerAttributeIntentHandler

- (void)handleSetTimerAttribute:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
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
    v19 = "-[MTSetTimerAttributeIntentHandler handleSetTimerAttribute:completion:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  objc_msgSend(v6, "targetTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toDuration");
  v11 = v10;
  objc_msgSend(v6, "toLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__MTSetTimerAttributeIntentHandler_handleSetTimerAttribute_completion___block_invoke;
  v15[3] = &unk_1E39CD150;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v13 = v6;
  v14 = v7;
  -[MTSetTimerAttributeIntentHandler _updateTimer:toDuration:toLabel:dryRun:completion:](self, "_updateTimer:toDuration:toLabel:dryRun:completion:", v9, v12, 0, v15, v11);

}

void __71__MTSetTimerAttributeIntentHandler_handleSetTimerAttribute_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_responseToSetTimerAttributeIntent:withUpdatedTimer:error:dryRun:", *(_QWORD *)(a1 + 40), a2, a3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (void)confirmSetTimerAttribute:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
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
    v19 = "-[MTSetTimerAttributeIntentHandler confirmSetTimerAttribute:completion:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  objc_msgSend(v6, "targetTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toDuration");
  v11 = v10;
  objc_msgSend(v6, "toLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__MTSetTimerAttributeIntentHandler_confirmSetTimerAttribute_completion___block_invoke;
  v15[3] = &unk_1E39CD150;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v13 = v6;
  v14 = v7;
  -[MTSetTimerAttributeIntentHandler _updateTimer:toDuration:toLabel:dryRun:completion:](self, "_updateTimer:toDuration:toLabel:dryRun:completion:", v9, v12, 1, v15, v11);

}

void __72__MTSetTimerAttributeIntentHandler_confirmSetTimerAttribute_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_responseToSetTimerAttributeIntent:withUpdatedTimer:error:dryRun:", *(_QWORD *)(a1 + 40), a2, a3, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (void)resolveToDurationForSetTimerAttribute:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "-[MTSetTimerAttributeIntentHandler resolveToDurationForSetTimerAttribute:withCompletion:]";
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v14, 0x16u);
  }
  if (v6)
  {
    objc_msgSend(v5, "toLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "spokenPhrase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v5, "toDuration");
      v12 = (void *)MEMORY[0x1E0CBDC80];
      if (v13 <= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CBDC80], "needsValue");
      }
      else
      {
        objc_msgSend(v5, "toDuration");
        objc_msgSend(v12, "successWithResolvedTimeInterval:");
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6[2](v6, v11);

  }
}

- (void)resolveTargetTimerForSetTimerAttribute:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[MTSetTimerAttributeIntentHandler resolveTargetTimerForSetTimerAttribute:withCompletion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    objc_msgSend(v6, "targetTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3A05D08, &unk_1E3A05D20, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __90__MTSetTimerAttributeIntentHandler_resolveTargetTimerForSetTimerAttribute_withCompletion___block_invoke;
    v12[3] = &unk_1E39CD178;
    v13 = v9;
    v14 = v7;
    v11 = v9;
    -[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:](self, "_genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:", v11, 0, v10, v12);

  }
}

void __90__MTSetTimerAttributeIntentHandler_resolveTargetTimerForSetTimerAttribute_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (!v16)
  {
    objc_msgSend(v5, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain"));

    if (v9)
    {
      v10 = objc_msgSend(v5, "code");
      if (v10 < 5)
      {
        v11 = objc_alloc(MEMORY[0x1E0CBDBD0]);
        objc_msgSend(MEMORY[0x1E0CBDC90], "successWithResolvedTimer:", *(_QWORD *)(a1 + 32));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v11, "initWithTimerResolutionResult:", v12);

LABEL_13:
        (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7);
        goto LABEL_14;
      }
      if (v10 - 5 >= 2)
      {
        if (v10 != 7)
        {
          v7 = 0;
          goto LABEL_13;
        }
        v14 = (void *)MEMORY[0x1E0CBDBD0];
        v15 = 2;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0CBDBD0];
        v15 = 1;
      }
      objc_msgSend(v14, "unsupportedForReason:", v15);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CBDBD0], "unsupported");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v13;
    goto LABEL_13;
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDBD0]), "initWithTimerResolutionResult:", v16);
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
LABEL_14:

}

- (id)_responseToSetTimerAttributeIntent:(id)a3 withUpdatedTimer:(id)a4 error:(id)a5 dryRun:(BOOL)a6
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
  uint64_t v31;

  v6 = a6;
  v31 = *MEMORY[0x1E0C80C00];
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
      || (v18 = objc_msgSend(v12, "code"), (unint64_t)(v18 - 5) > 3)
      || (v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDBC8]), "initWithCode:userActivity:", qword_19ACFEEE8[v18 - 5], 0)) == 0)
    {
      v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDBC8]), "initWithCode:userActivity:", 4, 0);
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
      *(_DWORD *)buf = 136315906;
      v24 = "-[MTSetTimerAttributeIntentHandler _responseToSetTimerAttributeIntent:withUpdatedTimer:error:dryRun:]";
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v22;
      _os_log_error_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_ERROR, "%s Failed to %@ set timer attribute intent %@%@", buf, 0x2Au);
      if (v12)

    }
  }
  else
  {
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDBC8]), "initWithCode:userActivity:", 3, 0);
    -[__CFString setUpdatedTimer:](v13, "setUpdatedTimer:", v10);
    v14 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("handled");
      *(_DWORD *)buf = 136315906;
      v24 = "-[MTSetTimerAttributeIntentHandler _responseToSetTimerAttributeIntent:withUpdatedTimer:error:dryRun:]";
      v25 = 2112;
      if (v6)
        v15 = CFSTR("confirmed");
      v26 = (__CFString *)v15;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ set timer attribute intent %@ with response %@", buf, 0x2Au);
    }
  }

  return v13;
}

- (void)_updateTimer:(id)a3 toDuration:(double)a4 toLabel:(id)a5 dryRun:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  MTSetTimerAttributeIntentHandler *v19;
  double v20;
  BOOL v21;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__MTSetTimerAttributeIntentHandler__updateTimer_toDuration_toLabel_dryRun_completion___block_invoke;
  v16[3] = &unk_1E39CD1A0;
  v21 = v8;
  v17 = v13;
  v18 = v12;
  v19 = self;
  v20 = a4;
  v14 = v12;
  v15 = v13;
  -[MTUpdateTimerIntentHandler _updateTimer:dryRun:updateBlock:completion:](self, "_updateTimer:dryRun:updateBlock:completion:", v14, v8, v16, a7);

}

id __86__MTSetTimerAttributeIntentHandler__updateTimer_toDuration_toLabel_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  objc_msgSend(v3, "setState:", 1);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "spokenPhrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  if (v6 == v8)
  {
    v10 = objc_msgSend(v6, "isEqualToString:", v6);
    if (!v9)
      goto LABEL_10;
  }
  else
  {
    v10 = 0;
    if (!v9)
      goto LABEL_10;
  }
  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    if (*(_BYTE *)(a1 + 64))
      v13 = CFSTR(" (dry-run)");
    else
      v13 = &stru_1E39CF258;
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "_timerManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Failed to update%@ timer %@ from timer manager %@ - renaming from %@ to %@ is not supported."), v13, v14, v15, v6, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    v19 = 8;
    goto LABEL_21;
  }
LABEL_10:
  v20 = *(double *)(a1 + 56);
  if (v20 <= 0.0)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    v23 = (void *)MEMORY[0x1E0CB3940];
    if (*(_BYTE *)(a1 + 64))
      v24 = CFSTR(" (dry-run)");
    else
      v24 = &stru_1E39CF258;
    v25 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "_timerManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Failed to update%@ timer %@ from timer manager %@ due to invalid duration %f"), v24, v25, v15, *(_QWORD *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    v19 = 2;
    goto LABEL_21;
  }
  if (v20 >= 86400.0)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v27 = (void *)MEMORY[0x1E0CB3940];
    if (*(_BYTE *)(a1 + 64))
      v28 = CFSTR(" (dry-run)");
    else
      v28 = &stru_1E39CF258;
    v29 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "_timerManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Failed to update%@ timer %@ from timer manager %@ due to invalid duration %f"), v28, v29, v15, *(_QWORD *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v26;
    v19 = 3;
LABEL_21:
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), v19, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  objc_msgSend(v3, "setDuration:");
  objc_msgSend(v3, "setState:", v4);
  v21 = 0;
LABEL_22:

  return v21;
}

@end
