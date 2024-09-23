@implementation MTAlarmIntentDonor

- (MTAlarmIntentDonor)initWithStorage:(id)a3
{
  id v5;
  NSObject *v6;
  NAScheduler *v7;
  NAScheduler *serializer;
  int v10;
  MTAlarmIntentDonor *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)&self->_storage, a3);
    -[MTAlarmStorage registerObserver:](self->_storage, "registerObserver:", self);
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTAlarmIntentDonor.access-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v7 = (NAScheduler *)objc_claimAutoreleasedReturnValue();
    serializer = self->_serializer;
    self->_serializer = v7;

  }
  return self;
}

- (void)prepareAlarms
{
  NAScheduler *serializer;
  _QWORD v3[5];

  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__MTAlarmIntentDonor_prepareAlarms__block_invoke;
  v3[3] = &unk_1E39CB858;
  v3[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v3);
}

void __35__MTAlarmIntentDonor_prepareAlarms__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allAlarms", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
        v12 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v10, "alarmID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  id v6;
  id v7;
  NAScheduler *serializer;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id obj;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  MTAlarmIntentDonor *v28;
  uint8_t buf[4];
  MTAlarmIntentDonor *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  serializer = self->_serializer;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke;
  v26[3] = &unk_1E39CB7B0;
  v9 = v7;
  v27 = v9;
  v28 = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v26);
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "donatesIntent"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v9;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x1E0CBD970], "mt_intentForAlarmCreate:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          MTLogForCategory(3);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v30 = self;
            v31 = 2114;
            v32 = v14;
            _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm added - Donating intent: %{public}@", buf, 0x16u);
          }

          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v14, 0);
          objc_msgSend(v16, "mtSetIntentDonorFromSource:", v6);
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5;
          v20[3] = &unk_1E39CC2D8;
          v21 = v14;
          v17 = v14;
          objc_msgSend(v16, "donateInteractionWithCompletion:", v20);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
      }
      while (v11);
    }

    v9 = v18;
  }

}

void __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
        v9 = (void *)objc_msgSend(v7, "copy", (_QWORD)v11);
        objc_msgSend(v7, "alarmID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v9, v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%@ donated successfully", (uint8_t *)&v7, 0xCu);
  }

}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v6;
  id v7;
  NAScheduler *serializer;
  _QWORD v9[4];
  id v10;
  MTAlarmIntentDonor *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "donatesIntent"))
  {
    serializer = self->_serializer;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke;
    v9[3] = &unk_1E39CB828;
    v10 = v7;
    v11 = self;
    v12 = v6;
    -[NAScheduler performBlock:](serializer, "performBlock:", v9);

  }
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  id obj;
  _QWORD v32[4];
  void *v33;
  _QWORD v34[4];
  void *v35;
  _QWORD v36[6];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v39;
    v30 = CFSTR("MTAlarmSleepScheduleKey");
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v39 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v5);
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
        objc_msgSend(v6, "alarmID", v30);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_22;
        +[MTChangeSet changeSetWithChangesFromObject:toObject:](MTChangeSet, "changeSetWithChangesFromObject:toObject:", v9, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmLastModifiedDate")) & 1) == 0)
        {

          goto LABEL_22;
        }
        objc_msgSend(v10, "changes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count") == 2
          && objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmEnabled")))
        {

        }
        else
        {
          objc_msgSend(v10, "changes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count") != 3
            || (objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmEnabled")) & 1) == 0)
          {

LABEL_17:
            v14 = 1;
            goto LABEL_18;
          }
          v13 = objc_msgSend(v10, "hasChangeForProperty:", v30);

          if (!v13)
            goto LABEL_17;
        }
        v14 = 0;
LABEL_18:
        if ((objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmHour")) & 1) != 0
          || (objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmMinute")) & 1) != 0
          || objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTAlarmTitle")))
        {

          v15 = (void *)MEMORY[0x1E0CBD970];
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_2;
          v36[3] = &unk_1E39CCB98;
          v16 = *(void **)(a1 + 48);
          v36[4] = *(_QWORD *)(a1 + 40);
          v36[5] = v6;
          v37 = v16;
          objc_msgSend(v15, "mt_deleteDonationsForAlarm:completion:", v6, v36);

          if ((v14 & 1) == 0)
            goto LABEL_28;
        }
        else
        {

          if ((v14 & 1) == 0)
          {
LABEL_28:
            if (objc_msgSend(v6, "isEnabled"))
              objc_msgSend(MEMORY[0x1E0CBD970], "mt_intentForAlarmEnable:", v6);
            else
              objc_msgSend(MEMORY[0x1E0CBD970], "mt_intentForAlarmDisable:", v6);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v27, 0);
            objc_msgSend(v20, "mtSetIntentDonorFromSource:", *(_QWORD *)(a1 + 48));
            objc_msgSend(v6, "alarmIDString");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setGroupIdentifier:", v28);

            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_9;
            v34[3] = &unk_1E39CC2D8;
            v35 = v27;
            v22 = v27;
            objc_msgSend(v20, "donateInteractionWithCompletion:", v34);
            v23 = &v35;
            goto LABEL_25;
          }
        }
LABEL_22:
        objc_msgSend(MEMORY[0x1E0CBD970], "mt_intentForAlarmUpdate:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        MTLogForCategory(3);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v43 = v19;
          v44 = 2114;
          v45 = v17;
          _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm updated - Donating intent: %{public}@", buf, 0x16u);
        }

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v17, 0);
        objc_msgSend(v20, "mtSetIntentDonorFromSource:", *(_QWORD *)(a1 + 48));
        objc_msgSend(v6, "alarmIDString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setGroupIdentifier:", v21);

        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_10;
        v32[3] = &unk_1E39CC2D8;
        v33 = v17;
        v22 = v17;
        objc_msgSend(v20, "donateInteractionWithCompletion:", v32);
        v23 = &v33;
LABEL_25:

        v24 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
        v25 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(v6, "alarmID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v25, v26);

        ++v5;
      }
      while (v3 != v5);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      v3 = v29;
    }
    while (v29);
  }

}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_2_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Interactions for updated alarm %@ deleted successfully", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CBD970], "mt_intentForAlarmCreate:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MTLogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated alarm - Donating intent: %{public}@", buf, 0x16u);
    }

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v8, 0);
    -[NSObject mtSetIntentDonorFromSource:](v5, "mtSetIntentDonorFromSource:", *(_QWORD *)(a1 + 48));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_8;
    v12[3] = &unk_1E39CBE30;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v8;
    v11 = v8;
    -[NSObject donateInteractionWithCompletion:](v5, "donateInteractionWithCompletion:", v12);

  }
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated Alarm %@ donated successfully", (uint8_t *)&v8, 0x16u);
  }

}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_9_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%@ donated successfully", (uint8_t *)&v7, 0xCu);
  }

}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_10_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%@ donated successfully", (uint8_t *)&v7, 0xCu);
  }

}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v5;
  NAScheduler *serializer;
  id v7;
  _QWORD v8[4];
  id v9;
  MTAlarmIntentDonor *v10;

  v5 = a4;
  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[NAScheduler performBlock:](serializer, "performBlock:", v8);

}

void __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
        objc_msgSend(v7, "alarmID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v9);

        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke_2;
        v11[3] = &unk_1E39CC2D8;
        v11[4] = v7;
        objc_msgSend(MEMORY[0x1E0CBD970], "mt_deleteDonationsForAlarm:completion:", v7, v11);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

void __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "alarmIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "Interactions for %@ deleted successfully", (uint8_t *)&v7, 0xCu);

  }
}

- (MTAlarmStorage)storage
{
  return self->_storage;
}

- (NSMutableDictionary)alarmsByID
{
  return self->_alarmsByID;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __42__MTAlarmIntentDonor_source_didAddAlarms___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "Error donating alarm create intent: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "Error deleting donations for update: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "Error donating alarm enable intent: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__MTAlarmIntentDonor_source_didUpdateAlarms___block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "Error donating alarm update intent: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__MTAlarmIntentDonor_source_didRemoveAlarms___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "Error deleting donations: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
