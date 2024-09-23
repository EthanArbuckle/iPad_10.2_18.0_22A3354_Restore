@implementation MTDeleteTimerIntentHandler

- (void)resolveTargetTimerForDeleteTimer:(id)a3 withCompletion:(id)a4
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
    v21 = "-[MTDeleteTimerIntentHandler resolveTargetTimerForDeleteTimer:withCompletion:]";
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
    -[MTDeleteTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v9, objc_msgSend(v10, "state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "type") == 2)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3A05CC0, &unk_1E3A05CD8, 0, v16);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3A05CC0, &unk_1E3A05CD8, &unk_1E3A05CF0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteMultiple");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __78__MTDeleteTimerIntentHandler_resolveTargetTimerForDeleteTimer_withCompletion___block_invoke;
    v17[3] = &unk_1E39CB2D8;
    v18 = v11;
    v19 = v7;
    v15 = v11;
    -[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:](self, "_genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:", v15, v14, v12, v17);

  }
}

void __78__MTDeleteTimerIntentHandler_resolveTargetTimerForDeleteTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
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

- (void)resolveDeleteMultipleForDeleteTimer:(id)a3 withCompletion:(id)a4
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
    v12 = "-[MTDeleteTimerIntentHandler resolveDeleteMultipleForDeleteTimer:withCompletion:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CBD780];
    objc_msgSend(v5, "deleteMultiple");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);

  }
}

- (void)confirmDeleteTimer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[MTDeleteTimerIntentHandler confirmDeleteTimer:completion:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    objc_msgSend(v6, "targetTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTDeleteTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v9, objc_msgSend(v10, "state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "deleteMultiple");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__MTDeleteTimerIntentHandler_confirmDeleteTimer_completion___block_invoke;
    v14[3] = &unk_1E39CD048;
    v16 = v7;
    v14[4] = self;
    v15 = v6;
    -[MTDeleteTimerIntentHandler _deleteTimer:multiple:dryRun:completion:](self, "_deleteTimer:multiple:dryRun:completion:", v11, v13, 1, v14);

  }
}

void __60__MTDeleteTimerIntentHandler_confirmDeleteTimer_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_responseToDeleteTimerIntent:withDeletedTimers:error:dryRun:", *(_QWORD *)(a1 + 40), a2, a3, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)handleDeleteTimer:(id)a3 completion:(id)a4
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
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[MTDeleteTimerIntentHandler handleDeleteTimer:completion:]";
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  objc_msgSend(v6, "targetTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTDeleteTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v9, objc_msgSend(v10, "state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deleteMultiple");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__MTDeleteTimerIntentHandler_handleDeleteTimer_completion___block_invoke;
  v16[3] = &unk_1E39CD048;
  v17 = v6;
  v18 = v7;
  v16[4] = self;
  v14 = v6;
  v15 = v7;
  -[MTDeleteTimerIntentHandler _deleteTimer:multiple:dryRun:completion:](self, "_deleteTimer:multiple:dryRun:completion:", v11, v13, 0, v16);

}

void __59__MTDeleteTimerIntentHandler_handleDeleteTimer_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_responseToDeleteTimerIntent:withDeletedTimers:error:dryRun:", *(_QWORD *)(a1 + 40), a2, a3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (id)_responseToDeleteTimerIntent:(id)a3 withDeletedTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  __CFString *v22;
  __CFString *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10 || v11)
  {
    objc_msgSend(v11, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain"));

    if (!v18
      || (v19 = objc_msgSend(v12, "code"), (unint64_t)(v19 - 5) > 2)
      || (v14 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD888]), "initWithCode:userActivity:", qword_19ACFEED0[v19 - 5], 0)) == 0)
    {
      v14 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD888]), "initWithCode:userActivity:", 4, 0);
    }
    v20 = (id)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = v6 ? CFSTR("confirm") : CFSTR("handle");
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("due to error %@"), v12);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = &stru_1E39CF258;
      }
      *(_DWORD *)buf = 136316162;
      v25 = "-[MTDeleteTimerIntentHandler _responseToDeleteTimerIntent:withDeletedTimers:error:dryRun:]";
      v26 = 2112;
      v27 = v22;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v14;
      _os_log_error_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_ERROR, "%s Failed to %@ delete timer intent %@ %@, response: %@", buf, 0x34u);
      if (v12)

    }
  }
  else
  {
    if (objc_msgSend(v10, "count"))
      v13 = 3;
    else
      v13 = 6;
    v14 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD888]), "initWithCode:userActivity:", v13, 0);
    -[__CFString setDeletedTimers:](v14, "setDeletedTimers:", v10);
    v15 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("handled");
      *(_DWORD *)buf = 136315906;
      v25 = "-[MTDeleteTimerIntentHandler _responseToDeleteTimerIntent:withDeletedTimers:error:dryRun:]";
      v26 = 2112;
      if (v6)
        v16 = CFSTR("confirmed");
      v27 = (__CFString *)v16;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_INFO, "%s Successfully %@ delete timer attribute intent %@ with response %@", buf, 0x2Au);
    }
  }

  return v14;
}

- (void)_deleteTimer:(id)a3 multiple:(BOOL)a4 dryRun:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  BOOL v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v7 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  -[MTTimerIntentHandler _timerManager](self, "_timerManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v14 = &stru_1E39CF258;
    *(_DWORD *)buf = 136315906;
    v36 = "-[MTDeleteTimerIntentHandler _deleteTimer:multiple:dryRun:completion:]";
    if (v7)
      v14 = CFSTR(" (dry-run)");
    v37 = 2112;
    v38 = v14;
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v12;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "%s Deleting%@ timer %@ from timer manager %@", buf, 0x2Au);
  }
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke;
  v30[3] = &unk_1E39CD070;
  v34 = v7;
  v16 = v10;
  v31 = v16;
  v17 = v12;
  v32 = v17;
  v18 = v11;
  v33 = v18;
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_25;
  v23[3] = &unk_1E39CD128;
  v23[4] = self;
  v24 = v16;
  v28 = a4;
  v29 = v7;
  v26 = (id)MEMORY[0x19AED0080](v30);
  v27 = v18;
  v25 = v17;
  v19 = v17;
  v20 = v18;
  v21 = v16;
  v22 = v26;
  -[MTTimerIntentHandler _matchTimersFromIntentsTimer:excludeStoppedTimers:completion:](self, "_matchTimersFromIntentsTimer:excludeStoppedTimers:completion:", v21, 0, v23);

}

void __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_25(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  void *v42;
  _BYTE v43[128];
  void *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_onlyUnnamedTimerInTimers:forTargetTimer:allowMultiple:", v6, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[MTDeleteTimerIntentHandler _deleteTimer:multiple:dryRun:completion:]_block_invoke";
        v47 = 2112;
        v48 = v7;
        _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s Filtering timer for delete to single unnamed timer: %@", buf, 0x16u);
      }
      v44 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v9;
    }
    if (objc_msgSend(v6, "count") == 1 || *(_BYTE *)(a1 + 72) && (unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      if (*(_BYTE *)(a1 + 73))
      {
        v10 = *(_QWORD *)(a1 + 64);
        if (v10)
        {
          objc_msgSend(v6, "na_map:", &__block_literal_global_21);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

        }
      }
      else
      {
        v29 = v7;
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v30 = v6;
        v19 = v6;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        v21 = MEMORY[0x1E0C809B0];
        if (v20)
        {
          v22 = v20;
          v23 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v38 != v23)
                objc_enumerationMutation(v19);
              v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
              v34[0] = v21;
              v34[1] = 3221225472;
              v34[2] = __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_2;
              v34[3] = &unk_1E39CD0B8;
              v35 = *(id *)(a1 + 48);
              v36 = v25;
              v26 = (id)objc_msgSend(v18, "flatMap:", v34);

            }
            v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
          }
          while (v22);
        }

        v31[0] = v21;
        v31[1] = 3221225472;
        v31[2] = __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_3;
        v31[3] = &unk_1E39CD100;
        v33 = *(id *)(a1 + 64);
        v32 = v19;
        v27 = (id)objc_msgSend(v18, "addSuccessBlock:", v31);
        v28 = (id)objc_msgSend(v18, "addFailureBlock:", *(_QWORD *)(a1 + 56));

        v7 = v29;
        v6 = v30;
      }
    }
    else if (objc_msgSend(v6, "count"))
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      if (*(_BYTE *)(a1 + 73))
        v13 = CFSTR(" (dry-run)");
      else
        v13 = &stru_1E39CF258;
      v14 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to delete%@ timer %@ from timer manager %@ due to ambiguity between timers %@"), v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("MTDeleteTimerIntentHandlerErrorDomain"), 1, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v17);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

id __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_27(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

uint64_t __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeTimer:", *(_QWORD *)(a1 + 40));
}

void __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_31);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

  }
}

id __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

- (id)_timerFromIntentTargetTimer:(id)a3 defaultState:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  v5 = a3;
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spokenPhrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "duration");
    v8 = v9 == -1.0;
  }

  v10 = objc_msgSend(v5, "type");
  if (v8)
    v11 = 2 * (objc_msgSend(v5, "type") == 2);
  else
    v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0CBDC88]);
  objc_msgSend(v5, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v15 = v14;
  objc_msgSend(v5, "remainingTime");
  v17 = v16;
  objc_msgSend(v5, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v12, "initWithLabel:duration:remainingTime:identifier:state:type:", v13, v18, a4, v11, v15, v17);

  return v19;
}

void __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR(" (dry-run)");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(a1 + 56))
    v3 = &stru_1E39CF258;
  v6 = 136316162;
  v7 = "-[MTDeleteTimerIntentHandler _deleteTimer:multiple:dryRun:completion:]_block_invoke";
  v8 = 2112;
  v9 = v3;
  v10 = 2112;
  v11 = v4;
  v12 = 2112;
  v13 = v5;
  v14 = 2112;
  v15 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%s Failed to delete%@ timer %@ from timer manager %@ due to error %@", (uint8_t *)&v6, 0x34u);
}

@end
