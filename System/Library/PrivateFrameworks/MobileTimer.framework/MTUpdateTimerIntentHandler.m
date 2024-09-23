@implementation MTUpdateTimerIntentHandler

- (void)_updateTimer:(id)a3 dryRun:(BOOL)a4 updateBlock:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__MTUpdateTimerIntentHandler__updateTimer_dryRun_updateBlock_completion___block_invoke;
  v12[3] = &unk_1E39CE570;
  v13 = v10;
  v11 = v10;
  -[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:](self, "_updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:", a3, v7, 0, 1, 0, a5, v12);

}

void __73__MTUpdateTimerIntentHandler__updateTimer_dryRun_updateBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (void)_updateTimer:(id)a3 dryRun:(BOOL)a4 allowMultiple:(BOOL)a5 excludeStoppedTimers:(BOOL)a6 filterBlock:(id)a7 updateBlock:(id)a8 completion:(id)a9
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _BOOL4 v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  BOOL v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  BOOL v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v31 = a6;
  v12 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  -[MTTimerIntentHandler _timerManager](self, "_timerManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v20 = &stru_1E39CF258;
    *(_DWORD *)buf = 136315906;
    v47 = "-[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:]";
    if (v12)
      v20 = CFSTR(" (dry-run)");
    v48 = 2112;
    v49 = v20;
    v50 = 2112;
    v51 = v14;
    v52 = 2112;
    v53 = v18;
    _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_INFO, "%s Updating%@ timer %@ from timer manager %@", buf, 0x2Au);
  }
  v21 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke;
  v41[3] = &unk_1E39CD070;
  v45 = v12;
  v22 = v14;
  v42 = v22;
  v23 = v18;
  v43 = v23;
  v24 = v17;
  v44 = v24;
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_5;
  v32[3] = &unk_1E39CE610;
  v32[4] = self;
  v33 = v22;
  v39 = a5;
  v40 = v12;
  v34 = v23;
  v35 = v15;
  v36 = (id)MEMORY[0x19AED0080](v41);
  v37 = v16;
  v38 = v24;
  v25 = v24;
  v26 = v16;
  v27 = v23;
  v28 = v22;
  v29 = v36;
  v30 = v15;
  -[MTTimerIntentHandler _matchTimersFromIntentsTimer:excludeStoppedTimers:completion:](self, "_matchTimersFromIntentsTimer:excludeStoppedTimers:completion:", v28, v31, v32);

}

void __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  _BYTE *v44;
  char v45;
  _QWORD v46[4];
  id v47;
  _BYTE buf[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  id v53;
  _QWORD v54[4];

  v54[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 56);
  if (!v10)
    goto LABEL_14;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_2;
  v46[3] = &unk_1E39CE598;
  v47 = v10;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v46);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "objectsAtIndexes:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_4;
  }
  else
  {
LABEL_14:
    v12 = v7;
    v11 = 0;
    if (!v9)
    {
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "_onlyUnnamedTimerInTimers:forTargetTimer:allowMultiple:", v12, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 88));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v13 = *MEMORY[0x1E0CBD670];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filte"
                               "rBlock:updateBlock:completion:]_block_invoke";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v33;
          _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "%s Filtering timer for update to single unnamed timer: %@", buf, 0x16u);
        }
        v54[0] = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v14;
      }
      if (*(_BYTE *)(a1 + 88) || (unint64_t)objc_msgSend(v12, "count") < 2)
      {
        if (objc_msgSend(v12, "count"))
        {
          v21 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "arrayWithObject:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v49 = __Block_byref_object_copy__13;
          v50 = __Block_byref_object_dispose__13;
          v51 = 0;
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_14;
          v39[3] = &unk_1E39CE5C0;
          v43 = *(id *)(a1 + 72);
          v44 = buf;
          v45 = *(_BYTE *)(a1 + 89);
          v18 = v23;
          v40 = v18;
          v41 = *(id *)(a1 + 48);
          v25 = v24;
          v42 = v25;
          objc_msgSend(v12, "enumerateObjectsUsingBlock:", v39);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          }
          else
          {
            v27 = (void *)MEMORY[0x1E0D519C0];
            objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "combineAllFutures:scheduler:", v18, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_2_17;
            v36[3] = &unk_1E39CE5E8;
            v38 = *(id *)(a1 + 80);
            v37 = v25;
            v30 = (id)objc_msgSend(v29, "addSuccessBlock:", v36);
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_4;
            v34[3] = &unk_1E39CB4E8;
            v35 = *(id *)(a1 + 64);
            v31 = (id)objc_msgSend(v29, "addFailureBlock:", v34);

          }
          _Block_object_dispose(buf, 8);

        }
        else if (objc_msgSend(v12, "count") || !objc_msgSend(v7, "count"))
        {
          v26 = *(_QWORD *)(a1 + 80);
          if (!v26)
          {
LABEL_25:

            goto LABEL_26;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), 5, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, id))(v26 + 16))(v26, 0, v18);
        }
        else
        {
          v32 = *(_QWORD *)(a1 + 80);
          if (!v32)
            goto LABEL_25;
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), 6, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, id))(v32 + 16))(v32, 0, v18);
        }
      }
      else
      {
        v15 = *(_QWORD *)(a1 + 64);
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v52 = *MEMORY[0x1E0CB2D50];
        if (*(_BYTE *)(a1 + 89))
          v17 = CFSTR(" (dry-run)");
        else
          v17 = &stru_1E39CF258;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to update%@ timer %@ from timer manager %@ due to ambiguity between timers %@"), v17, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v12);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v53 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), 1, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v20);

      }
      goto LABEL_25;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_26:

}

uint64_t __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_14(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)objc_msgSend(a2, "mutableCopy");
  v7 = *(_QWORD *)(a1 + 56);
  v13 = v6;
  if (v7)
  {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v6 = v13;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    *a4 = 1;
  }
  else
  {
    if (!*(_BYTE *)(a1 + 72))
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "updateTimer:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      v6 = v13;
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    v6 = v13;
  }

}

void __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_2_17(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "sortUsingComparator:", MTTimerIntentResultsComparator);
    objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_36);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

id __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

uint64_t __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_timerFromIntentTargetTimer:(id)a3 defaultState:(int64_t)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = 2 * (objc_msgSend(v5, "type") == 2);
  v7 = objc_alloc(MEMORY[0x1E0CBDC88]);
  objc_msgSend(v5, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v10 = v9;
  objc_msgSend(v5, "remainingTime");
  v12 = v11;
  objc_msgSend(v5, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v7, "initWithLabel:duration:remainingTime:identifier:state:type:", v8, v13, a4, v6, v10, v12);
  return v14;
}

void __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
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
  v7 = "-[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:compl"
       "etion:]_block_invoke";
  v8 = 2112;
  v9 = v3;
  v10 = 2112;
  v11 = v4;
  v12 = 2112;
  v13 = v5;
  v14 = 2112;
  v15 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%s Failed to update%@ timer %@ from timer manager %@ due to error %@", (uint8_t *)&v6, 0x34u);
}

@end
