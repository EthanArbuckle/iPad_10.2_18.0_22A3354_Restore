@implementation HUAlarmsAndTimersAccessUtility

+ (id)canAccess:(id)a3 for:(unint64_t)a4 withManager:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (a4 == 2)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:]";
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%s: checking accessory %@ access (type = AlarmsAndTimersAvailable).", buf, 0x16u);
    }

    v12 = (void *)MEMORY[0x1E0D519C0];
    +[HUAlarmsAndTimersAccessUtility _canAlarmManagerControl:withManager:](HUAlarmsAndTimersAccessUtility, "_canAlarmManagerControl:withManager:", v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    +[HUAlarmsAndTimersAccessUtility _canTimerManagerControl:withManager:](HUAlarmsAndTimersAccessUtility, "_canTimerManagerControl:withManager:", v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "combineAllFutures:ignoringErrors:scheduler:", v15, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__HUAlarmsAndTimersAccessUtility_canAccess_for_withManager___block_invoke;
    v21[3] = &unk_1E6F4CD30;
    v22 = v7;
    objc_msgSend(v17, "flatMap:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a4 == 1)
    {
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "+[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:]";
        v26 = 2112;
        v27 = v7;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%s: checking accessory %@ access (type = TimersAvailable).", buf, 0x16u);
      }

      +[HUAlarmsAndTimersAccessUtility _canTimerManagerControl:withManager:](HUAlarmsAndTimersAccessUtility, "_canTimerManagerControl:withManager:", v7, v8);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "+[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:]";
        v26 = 2112;
        v27 = v7;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%s: checking accessory %@ access (type = AlarmsAvailable).", buf, 0x16u);
      }

      +[HUAlarmsAndTimersAccessUtility _canAlarmManagerControl:withManager:](HUAlarmsAndTimersAccessUtility, "_canAlarmManagerControl:withManager:", v7, v8);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v10;
  }

  return v18;
}

id __60__HUAlarmsAndTimersAccessUtility_canAccess_for_withManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_252);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v11 = 136315906;
    v12 = "+[HUAlarmsAndTimersAccessUtility canAccess:for:withManager:]_block_invoke";
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    v17 = 1024;
    v18 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%s: checking accessory %@ for both = %@ (did either fail= %{BOOL}d)", (uint8_t *)&v11, 0x26u);
  }

  v7 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4 ^ 1u);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __60__HUAlarmsAndTimersAccessUtility_canAccess_for_withManager___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "BOOLValue") ^ 1;
}

+ (id)_canAlarmManagerControl:(id)a3 withManager:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
LABEL_11:
    v11 = (void *)MEMORY[0x1E0D519C0];
    v12 = MEMORY[0x1E0C9AAA0];
    goto LABEL_12;
  }
  if ((objc_msgSend(v5, "isReachable") & 1) == 0)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[HUAlarmsAndTimersAccessUtility _canAlarmManagerControl:withManager:]";
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%s: NO: accessory %@ is not reachable...", buf, 0x16u);
    }

    goto LABEL_11;
  }
  objc_msgSend(v5, "hf_siriEndpointProfile");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7 || (v8 = (void *)v7, v9 = objc_msgSend(v5, "hf_needsOnboarding"), v8, !v9))
  {
    v17 = (void *)MEMORY[0x1E0D519C0];
    v22 = MEMORY[0x1E0C809B0];
    v23 = v6;
    v24 = v5;
    objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler", v22, 3221225472, __70__HUAlarmsAndTimersAccessUtility__canAlarmManagerControl_withManager___block_invoke, &unk_1E6F4D600);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithBlock:scheduler:", &v22, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reschedule:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[HUAlarmsAndTimersAccessUtility _canAlarmManagerControl:withManager:]";
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%s: YES: Siri endpoint accessory %@ is available for Alarms (implicit onboarding required)", buf, 0x16u);
  }

  v11 = (void *)MEMORY[0x1E0D519C0];
  v12 = MEMORY[0x1E0C9AAB0];
LABEL_12:
  objc_msgSend(v11, "futureWithResult:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reschedule:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v16;
}

void __70__HUAlarmsAndTimersAccessUtility__canAlarmManagerControl_withManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  v4 = *(id *)(a1 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D148D8], "hf_AlarmManagerForAccessory:", *(_QWORD *)(a1 + 40));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "_canDispatchForAssociatedAccessory");
  if ((v9 & 1) == 0)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Coordination says accessory %@ is NOT controllable for Alarms", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v12);

}

+ (id)_canTimerManagerControl:(id)a3 withManager:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
LABEL_11:
    v11 = (void *)MEMORY[0x1E0D519C0];
    v12 = MEMORY[0x1E0C9AAA0];
    goto LABEL_12;
  }
  if ((objc_msgSend(v5, "isReachable") & 1) == 0)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[HUAlarmsAndTimersAccessUtility _canTimerManagerControl:withManager:]";
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%s: NO: accessory %@ is not reachable...", buf, 0x16u);
    }

    goto LABEL_11;
  }
  objc_msgSend(v5, "hf_siriEndpointProfile");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7 || (v8 = (void *)v7, v9 = objc_msgSend(v5, "hf_needsOnboarding"), v8, !v9))
  {
    v17 = (void *)MEMORY[0x1E0D519C0];
    v22 = MEMORY[0x1E0C809B0];
    v23 = v6;
    v24 = v5;
    objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler", v22, 3221225472, __70__HUAlarmsAndTimersAccessUtility__canTimerManagerControl_withManager___block_invoke, &unk_1E6F4D600);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithBlock:scheduler:", &v22, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reschedule:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[HUAlarmsAndTimersAccessUtility _canTimerManagerControl:withManager:]";
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%s: YES: Siri endpoint accessory %@ is available for Timers (implicit onboarding required)", buf, 0x16u);
  }

  v11 = (void *)MEMORY[0x1E0D519C0];
  v12 = MEMORY[0x1E0C9AAB0];
LABEL_12:
  objc_msgSend(v11, "futureWithResult:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reschedule:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v16;
}

void __70__HUAlarmsAndTimersAccessUtility__canTimerManagerControl_withManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  v4 = *(id *)(a1 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D148E8], "hf_TimerManagerForAccessory:", *(_QWORD *)(a1 + 40));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "_canDispatchForAssociatedAccessory");
  if ((v9 & 1) == 0)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Coordination says accessory %@ is NOT controllable for Timers", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v12);

}

@end
