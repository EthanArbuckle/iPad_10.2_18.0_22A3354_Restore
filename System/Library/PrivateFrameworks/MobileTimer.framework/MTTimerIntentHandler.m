@implementation MTTimerIntentHandler

- (id)_timerManager
{
  MTTimerManagerIntentSupport *timerManager;
  void *v4;
  void *v5;
  void *v6;
  MTTimerManager *v7;
  MTTimerManagerIntentSupport *v8;

  timerManager = self->_timerManager;
  if (!timerManager)
  {
    -[MTTimerIntentHandler timerManagerProvider](self, "timerManagerProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = objc_alloc_init(MTTimerManager);
    v8 = self->_timerManager;
    self->_timerManager = (MTTimerManagerIntentSupport *)v7;

    timerManager = self->_timerManager;
  }
  return timerManager;
}

- (void)_matchTimersFromIntentsTimer:(id)a3 excludeStoppedTimers:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[MTTimerIntentHandler _timerManager](self, "_timerManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke;
    v20[3] = &unk_1E39CEE08;
    v20[4] = self;
    v23 = a4;
    v21 = v8;
    v13 = v9;
    v22 = v13;
    v14 = (id)objc_msgSend(v11, "addSuccessBlock:", v20);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_3;
    v17[3] = &unk_1E39CBF18;
    v18 = v10;
    v19 = v13;
    v15 = v10;
    v16 = (id)objc_msgSend(v11, "addFailureBlock:", v17);

  }
}

void __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[2] = __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_2;
  v16[3] = &unk_1E39CEDE0;
  v8 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v21 = *(_BYTE *)(a1 + 56);
  v16[1] = 3221225472;
  v17 = v8;
  v15 = v5;
  v18 = v15;
  v9 = v6;
  v19 = v9;
  v10 = v7;
  v20 = v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);

  if (objc_msgSend(v15, "count") || objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    v11 = objc_msgSend(v15, "count");
    v12 = *(_QWORD *)(a1 + 48);
    if (!v11)
    {
      (*(void (**)(uint64_t, id, id, _QWORD))(v12 + 16))(v12, v9, v10, 0);
      goto LABEL_8;
    }
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v12 + 16))(v12, v15, v13, 0);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), 7, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, v13);
  }

LABEL_8:
}

void __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  BOOL v5;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDefaultTimer:", v3) & 1) == 0
    && (!*(_BYTE *)(a1 + 72) || objc_msgSend(v3, "state") != 1))
  {
    v5 = 0;
    if (MTTimerMatchesIntentsTimer(v3, *(void **)(a1 + 40), 1, &v5))
    {
      if (v5)
        v4 = (id *)(a1 + 48);
      else
        v4 = (id *)(a1 + 56);
    }
    else
    {
      v4 = (id *)(a1 + 64);
    }
    objc_msgSend(*v4, "addObject:", v3);
  }

}

void __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_3_cold_1(a1, (uint64_t)v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_genericallyResolveTargetTimer:(id)a3 multiple:(BOOL)a4 allowedTimerStatesForFollowup:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  MTTimerIntentHandler *v21;
  id v22;
  BOOL v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    if (v10)
    {
      v13 = objc_msgSend(v11, "containsObject:", &unk_1E3A05DF8) ^ 1;
      -[MTTimerIntentHandler _timerManager](self, "_timerManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke;
      v17[3] = &unk_1E39CEE58;
      v18 = v10;
      v19 = v14;
      v22 = v12;
      v20 = v11;
      v21 = self;
      v23 = a4;
      v15 = v14;
      -[MTTimerIntentHandler _matchTimersFromIntentsTimer:excludeStoppedTimers:completion:](self, "_matchTimersFromIntentsTimer:excludeStoppedTimers:completion:", v18, v13, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CBDC90], "needsValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v16, 0);

    }
  }

}

void __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, void *);
  void *v55;
  id v56;
  void *v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "domain"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain")),
        v11,
        (v12 & 1) != 0))
  {
    if (*(_QWORD *)(a1 + 48) && (unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v52 = MEMORY[0x1E0C809B0];
      v53 = 3221225472;
      v54 = __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_8;
      v55 = &unk_1E39CEE30;
      v56 = *(id *)(a1 + 48);
      objc_msgSend(v7, "indexesOfObjectsPassingTest:", &v52);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count", v52, v53, v54, v55)
        && (v14 = objc_msgSend(v13, "count"), v14 < objc_msgSend(v7, "count")))
      {
        objc_msgSend(v7, "objectsAtIndexes:", v13);
        v15 = objc_claimAutoreleasedReturnValue();

        v16 = *MEMORY[0x1E0CBD670];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
        {
          v17 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 136315650;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:"
                "]_block_invoke_2";
          v60 = 2112;
          v61 = v17;
          v62 = 2112;
          v63 = v15;
          _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_INFO, "%s Filtering matched timers for allowedTimerStatesForFollowup:%@ to: %@", buf, 0x20u);
        }
      }
      else
      {
        v15 = (uint64_t)v7;
      }

      v7 = (id)v15;
    }
    objc_msgSend(*(id *)(a1 + 56), "_onlyUnnamedTimerInTimers:forTargetTimer:allowMultiple:", v7, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
        v60 = 2112;
        v61 = (unint64_t)v20;
        _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_INFO, "%s Filtering resolved timer matches to single unnamed timer: %@", buf, 0x16u);
      }
      v57 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v22 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v22;
    }
    v23 = objc_msgSend(v7, "count");
    v24 = v23;
    if (v23 < 2)
    {
      if (v23)
      {
        objc_msgSend(v7, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *MEMORY[0x1E0CBD670];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
        {
          v30 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136315650;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
          v60 = 2112;
          v61 = (unint64_t)v28;
          v62 = 2112;
          v63 = v30;
          _os_log_impl(&dword_19AC4E000, v29, OS_LOG_TYPE_INFO, "%s Found matching timer: %@ for target timer: %@", buf, 0x20u);
        }
        v31 = *(_QWORD *)(a1 + 64);
        v32 = (void *)MEMORY[0x1E0CBDC90];
        MTIntentsTimerForTimer(v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "successWithResolvedTimer:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v31 + 16))(v31, v34, 0);

        goto LABEL_41;
      }
      objc_msgSend(*(id *)(a1 + 56), "_alternateTimersForTargetTimerState:type:inTimers:allowedTimerStates:", objc_msgSend(*(id *)(a1 + 32), "state"), objc_msgSend(*(id *)(a1 + 32), "type"), v8, *(_QWORD *)(a1 + 48));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count") == 1
        && (objc_msgSend(v28, "firstObject"), (v42 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v35 = (void *)v42;
        v43 = *MEMORY[0x1E0CBD670];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
        {
          v44 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136315650;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
          v60 = 2112;
          v61 = (unint64_t)v35;
          v62 = 2112;
          v63 = v44;
          _os_log_impl(&dword_19AC4E000, v43, OS_LOG_TYPE_INFO, "%s Found no matching timers but 1 alternate timer: %@ for target timer: %@", buf, 0x20u);
        }
        v45 = *(_QWORD *)(a1 + 64);
        v46 = (void *)MEMORY[0x1E0CBDC90];
        MTIntentsTimerForTimer(v35);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "confirmationRequiredWithTimerToConfirm:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v45 + 16))(v45, v48, 0);

      }
      else
      {
        v49 = *MEMORY[0x1E0CBD670];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
        {
          v50 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
          v60 = 2112;
          v61 = v50;
          _os_log_impl(&dword_19AC4E000, v49, OS_LOG_TYPE_INFO, "%s Found no matching timers for target timer: %@", buf, 0x16u);
        }
        v51 = *(_QWORD *)(a1 + 64);
        if (!v8 || v10)
        {
          (*(void (**)(uint64_t, _QWORD, void *))(v51 + 16))(v51, 0, v10);
          goto LABEL_41;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTTimerIntentHandlerErrorDomain"), 5, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v51 + 16))(v51, 0, v35);
      }
    }
    else
    {
      if (*(_BYTE *)(a1 + 72))
      {
        v25 = *MEMORY[0x1E0CBD670];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
        {
          v26 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136315650;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
          v60 = 2048;
          v61 = v24;
          v62 = 2112;
          v63 = v26;
          _os_log_impl(&dword_19AC4E000, v25, OS_LOG_TYPE_INFO, "%s Found %ld matching timers for multi target timer: %@", buf, 0x20u);
        }
        v27 = *(_QWORD *)(a1 + 64);
        objc_msgSend(MEMORY[0x1E0CBDC90], "successWithResolvedTimer:", *(_QWORD *)(a1 + 32));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v27 + 16))(v27, v28, 0);
        goto LABEL_41;
      }
      objc_msgSend(v7, "sortedArrayUsingComparator:", MTTimerIntentResultsComparator);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "na_map:", &__block_literal_global_49);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)*MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      {
        v37 = v36;
        v38 = objc_msgSend(v35, "count");
        v39 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke_2";
        v60 = 2048;
        v61 = v38;
        v62 = 2112;
        v63 = v39;
        _os_log_impl(&dword_19AC4E000, v37, OS_LOG_TYPE_INFO, "%s Disambiguating %ld matching timers for single target timer: %@", buf, 0x20u);

      }
      v40 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CBDC90], "disambiguationWithTimersToDisambiguate:", v35);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v40 + 16))(v40, v41, 0);

    }
LABEL_41:

    goto LABEL_42;
  }
  v18 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_cold_1(a1, (uint64_t)v10, v18);
  v19 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CBDC90], "unsupported");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v20, 0);
LABEL_42:

}

uint64_t __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

id __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_13(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

- (id)_onlyUnnamedTimerInTimers:(id)a3 forTargetTimer:(id)a4 allowMultiple:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
    goto LABEL_2;
  objc_msgSend(v8, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_8;
  objc_msgSend(v9, "duration");
  if (v12 <= 0.0)
    goto LABEL_8;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(v7, "indexesOfObjectsPassingTest:", &__block_literal_global_16_0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v11, "firstIndex"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_10;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
LABEL_2:
  v10 = 0;
LABEL_10:

  return v10;
}

BOOL __79__MTTimerIntentHandler__onlyUnnamedTimerInTimers_forTargetTimer_allowMultiple___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (id)_alternateTimersForTargetTimerState:(int64_t)a3 type:(int64_t)a4 inTimers:(id)a5 allowedTimerStates:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  int64_t v17;
  int64_t v18;

  v9 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__MTTimerIntentHandler__alternateTimersForTargetTimerState_type_inTimers_allowedTimerStates___block_invoke;
  v15[3] = &unk_1E39CEEA0;
  v16 = v9;
  v17 = a3;
  v18 = a4;
  v10 = v9;
  v11 = a5;
  objc_msgSend(v11, "indexesOfObjectsPassingTest:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectsAtIndexes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

BOOL __93__MTTimerIntentHandler__alternateTimersForTargetTimerState_type_inTimers_allowedTimerStates___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v10;

  v3 = a2;
  v4 = v3;
  if ((!a1[5] || MTIntentsTimerStateForTimerState(objc_msgSend(v3, "state")) == a1[5])
    && (v5 = (void *)a1[4],
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "state")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6),
        v6,
        (_DWORD)v5))
  {
    v7 = objc_msgSend(v4, "type");
    v8 = a1[6];
    v10 = v7 == v8 || v8 == 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_isDefaultTimer:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENT_TIMER"));

  return v4;
}

- (MTTimerManagerProviding)timerManagerProvider
{
  return (MTTimerManagerProviding *)objc_loadWeakRetained((id *)&self->_timerManagerProvider);
}

- (void)setTimerManagerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_timerManagerProvider, a3);
}

- (MTTimerManagerIntentSupport)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_destroyWeak((id *)&self->_timerManagerProvider);
}

void __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
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
  v5 = "-[MTTimerIntentHandler _matchTimersFromIntentsTimer:excludeStoppedTimers:completion:]_block_invoke_3";
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%s Failed to retrieve timers from timer manager %@: %@", (uint8_t *)&v4, 0x20u);
}

void __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 136315906;
  v6 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%s Failed to resolve timer %@ from timer manager %@ due to error %@", (uint8_t *)&v5, 0x2Au);
}

@end
