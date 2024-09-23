@implementation MTSearchTimerIntentHandler

- (void)handleSearchForTimers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  void *v13;
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
    v18 = "-[MTSearchTimerIntentHandler handleSearchForTimers:completion:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    if (objc_msgSend(v6, "type") == 2)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = 2 * (objc_msgSend(v6, "type") == 2);
    v11 = objc_alloc(MEMORY[0x1E0CBDC88]);
    objc_msgSend(v6, "duration");
    v13 = (void *)objc_msgSend(v11, "initWithLabel:duration:remainingTime:identifier:state:type:", v9, 0, objc_msgSend(v6, "state"), v10, v12, -1.0);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke;
    v14[3] = &unk_1E39CE678;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    -[MTTimerIntentHandler _matchTimersFromIntentsTimer:excludeStoppedTimers:completion:](self, "_matchTimersFromIntentsTimer:excludeStoppedTimers:completion:", v13, 1, v14);

  }
}

void __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("MTTimerIntentHandlerErrorDomain")))
  {
    if (objc_msgSend(v9, "code") == 5 || objc_msgSend(v9, "code") == 6)
    {

LABEL_12:
      objc_msgSend(v7, "sortedArrayUsingComparator:", MTTimerIntentResultsComparator);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "na_map:", &__block_literal_global_37);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3A05DC8, &unk_1E3A05DE0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v8, "count") <= 1)
        {
          v16 = v8;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_alternateTimersForTargetTimerState:type:inTimers:allowedTimerStates:", objc_msgSend(*(id *)(a1 + 40), "state"), objc_msgSend(*(id *)(a1 + 40), "type"), v8, v15);
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v16;
        if (objc_msgSend(v16, "count"))
        {
          objc_msgSend(v18, "sortedArrayUsingComparator:", MTTimerIntentResultsComparator);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "na_map:", &__block_literal_global_5_0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDB70]), "initWithCode:userActivity:", 3, 0);
      objc_msgSend(v20, "setMatchedTimers:", v14);
      objc_msgSend(v20, "setUnmatchedTimers:", v17);
      v21 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      {
        v22 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v24 = "-[MTSearchTimerIntentHandler handleSearchForTimers:completion:]_block_invoke_2";
        v25 = 2112;
        v26 = v22;
        v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_INFO, "%s Successfully handled search timers intent: %@ with response %@", buf, 0x20u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      goto LABEL_24;
    }
    v11 = objc_msgSend(v9, "code") == 7;
  }
  else
  {
    v11 = 0;
  }

  if (v7 || v11)
    goto LABEL_12;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDB70]), "initWithCode:userActivity:", 4, 0);
  v13 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke_cold_1(a1, (uint64_t)v9, v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_24:

}

id __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

id __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

void __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
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
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 136315650;
  v5 = "-[MTSearchTimerIntentHandler handleSearchForTimers:completion:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%s Failed to handle search timers with intent: %@ due to error %@", (uint8_t *)&v4, 0x20u);
}

@end
