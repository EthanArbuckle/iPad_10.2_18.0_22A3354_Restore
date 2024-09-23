@implementation ANAnalyticsDaily

- (ANAnalyticsDaily)init
{
  ANBackgroundActivity *v3;
  void *v4;
  void *v5;
  ANAnalyticsDailyMessaging *v6;
  ANAnalyticsDaily *v7;

  v3 = objc_alloc_init(ANBackgroundActivity);
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANHomeManager shared](ANHomeManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(ANAnalyticsDailyMessaging);
  v7 = -[ANAnalyticsDaily initWithBackgroundActivity:defaults:homesProvider:messagingConnection:](self, "initWithBackgroundActivity:defaults:homesProvider:messagingConnection:", v3, v4, v5, v6);

  return v7;
}

- (ANAnalyticsDaily)initWithBackgroundActivity:(id)a3 defaults:(id)a4 homesProvider:(id)a5 messagingConnection:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ANAnalyticsDaily *v15;
  ANAnalyticsDaily *v16;
  uint64_t v17;
  ANAnalyticsStorage *eventStorage;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ANAnalyticsDaily;
  v15 = -[ANAnalyticsDaily init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_backgroundActivity, a3);
    objc_storeStrong((id *)&v16->_defaults, a4);
    v17 = objc_opt_new();
    eventStorage = v16->_eventStorage;
    v16->_eventStorage = (ANAnalyticsStorage *)v17;

    objc_storeStrong((id *)&v16->_homesProvider, a5);
    objc_storeStrong((id *)&v16->_messagingConnection, a6);
  }

  return v16;
}

- (void)start
{
  void *v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[ANAnalyticsDaily defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForDefault:", *MEMORY[0x1E0CF7AA8]);

  ANLogHandleAnalyticsDaily();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v11 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily starting.", buf, 0xCu);
    }

    -[ANAnalyticsDaily _registerRapportDailyRequest](self, "_registerRapportDailyRequest");
    objc_initWeak((id *)buf, self);
    -[ANAnalyticsDaily backgroundActivity](self, "backgroundActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __25__ANAnalyticsDaily_start__block_invoke;
    v8[3] = &unk_1E9390140;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v7, "scheduleWithBlock:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v11 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily events disabled.", buf, 0xCu);
    }

  }
}

void __25__ANAnalyticsDaily_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ANLogHandleAnalyticsDaily();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily executing.", buf, 0xCu);
  }

  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_recordExecutionTime");

  v7 = objc_loadWeakRetained(v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __25__ANAnalyticsDaily_start__block_invoke_5;
  v9[3] = &unk_1E9390118;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "_executeBackgroundActivity:", v9);

}

uint64_t __25__ANAnalyticsDaily_start__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recordReachableHomes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ANAnalyticsDaily eventStorage](self, "eventStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "save:counter:", CFSTR("reachableHome"), v4);

}

- (void)_recordExecutionTime
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[ANAnalyticsDaily defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CF7AB0];
  objc_msgSend(v3, "numberForDefault:", *MEMORY[0x1E0CF7AB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(v5, "doubleValue");
  v12 = v10 - v11;
  objc_msgSend(v5, "doubleValue");
  v14 = v13;
  ANLogHandleAnalyticsDaily();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 == 0.0)
  {
    if (v16)
    {
      v19 = 138412546;
      v20 = &stru_1E93913D0;
      v21 = 2048;
      v22 = v12;
      v17 = "%@AnalyticsDaily first scheduled background activity at: %f";
LABEL_6:
      _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0x16u);
    }
  }
  else if (v16)
  {
    v19 = 138412546;
    v20 = &stru_1E93913D0;
    v21 = 2048;
    v22 = v12;
    v17 = "%@AnalyticsDaily time since last scheduled background activity: %f";
    goto LABEL_6;
  }

  -[ANAnalyticsDaily defaults](self, "defaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNumber:forDefault:", v8, v4);

}

- (void)_executeBackgroundActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ANLogHandleAnalyticsDaily();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily collecting.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ANAnalyticsDaily__executeBackgroundActivity___block_invoke;
  v7[3] = &unk_1E9390168;
  objc_copyWeak(&v9, (id *)buf);
  v6 = v4;
  v8 = v6;
  -[ANAnalyticsDaily _collectPayload:](self, "_collectPayload:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

uint64_t __47__ANAnalyticsDaily__executeBackgroundActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v5;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  ANLogHandleAnalyticsDaily();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(WeakRetained, "_stringForDeferredResult:", a4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("deferred: %@"), v5);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("completed");
      }
      *(_DWORD *)buf = 138412546;
      v22 = &stru_1E93913D0;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily %@.", buf, 0x16u);
      if (a4)
      {

      }
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("deferred"));

  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dailyReport:withPayload:", CFSTR("dailystate"), v8);

  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v16, "_reportEventStorage");

  v17 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dailyReportComplete");

  v19 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v19, "_cleanup");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_collectPayload:(id)a3
{
  void (**v4)(id, void *, uint64_t, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, void *, uint64_t, uint64_t);
  id v17;
  id location;

  v4 = (void (**)(id, void *, uint64_t, uint64_t))a3;
  v5 = (void *)objc_opt_new();
  -[ANAnalyticsDaily homesProvider](self, "homesProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  -[ANAnalyticsDaily backgroundActivity](self, "backgroundActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "shouldDefer");

  if ((_DWORD)v7)
  {
    v4[2](v4, v5, 2, 1);
  }
  else
  {
    -[ANAnalyticsDaily _collectForAnnounce:](self, "_collectForAnnounce:", v5);
    -[ANAnalyticsDaily backgroundActivity](self, "backgroundActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldDefer");

    if (v11)
    {
      v4[2](v4, v5, 2, 2);
    }
    else
    {
      -[ANAnalyticsDaily _collectForHome:homes:](self, "_collectForHome:homes:", v5, v8);
      -[ANAnalyticsDaily backgroundActivity](self, "backgroundActivity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "shouldDefer");

      if (v13)
      {
        v4[2](v4, v5, 2, 3);
      }
      else
      {
        objc_initWeak(&location, self);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __36__ANAnalyticsDaily__collectPayload___block_invoke;
        v14[3] = &unk_1E9390190;
        objc_copyWeak(&v17, &location);
        v16 = v4;
        v15 = v5;
        -[ANAnalyticsDaily _collectForAnnouncementsInHome:completion:](self, "_collectForAnnouncementsInHome:completion:", v15, v14);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
    }
  }

}

uint64_t __36__ANAnalyticsDaily__collectPayload___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "backgroundActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDefer");

  if (v4)
  {
    v5 = 2;
    v6 = 4;
  }
  else
  {
    v5 = 1;
    v6 = 0;
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v5, v6);
}

- (id)_stringForDeferredResult:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("None");
  else
    return off_1E9390220[a3 - 1];
}

- (void)_reportEventStorage
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ANAnalyticsCounter *v10;
  void *v11;
  ANAnalyticsCounter *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[ANAnalyticsDaily eventStorage](self, "eventStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventsToReport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v20 = *(_QWORD *)v29;
    v21 = v4;
    do
    {
      v8 = 0;
      v22 = v6;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("reachableHome"), v20, v21))
        {
          v10 = [ANAnalyticsCounter alloc];
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[ANAnalyticsCounter initWithHexCount:](v10, "initWithHexCount:", objc_msgSend(v11, "unsignedLongLongValue"));

          -[ANAnalyticsCounter payload:keyTwo:](v12, "payload:keyTwo:", CFSTR("home"), CFSTR("rooms"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
                -[ANAnalyticsDaily delegate](self, "delegate");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "dailyReport:withPayload:", v9, v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v15);
            v7 = v20;
            v4 = v21;
            v6 = v22;
          }
        }
        else
        {
          -[ANAnalyticsDaily delegate](self, "delegate");
          v12 = (ANAnalyticsCounter *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[ANAnalyticsCounter dailyReport:withPayload:](v12, "dailyReport:withPayload:", v9, v13);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

}

- (void)_cleanup
{
  id v2;

  -[ANAnalyticsDaily eventStorage](self, "eventStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "erase");

}

- (void)_collectForAnnounce:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = (void *)MEMORY[0x1E0CF7DE8];
  v5 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isAnnounceEnabled"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("enabled"));

}

- (void)_collectForHome:(id)a3 homes:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a4;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  v5 = 0;
  v6 = 0;
  if (v37)
  {
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v7 = 0;
    v8 = 0;
    v36 = *(_QWORD *)v41;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v36)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
      -[ANAnalyticsDaily backgroundActivity](self, "backgroundActivity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "shouldDefer");

      if ((v12 & 1) != 0)
        goto LABEL_18;
      v39 = v7;
      v13 = v6;
      v14 = v5;
      v15 = objc_msgSend(v10, "hmu_isCurrentUserAdministrator");
      v16 = objc_msgSend(v10, "hmu_isCurrentUserOwner");
      v17 = objc_msgSend(v10, "hmu_isRemoteAccessAllowedForCurrentUser");
      objc_msgSend(v10, "currentUser");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "announceUserSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "deviceNotificationMode");

      if (v20 == 1)
      {
        ++v33;
        v21 = v14;
      }
      else
      {
        v21 = v14;
        if (v20 != 2)
        {
          v22 = v13;
          if (v20 == 3)
            ++v32;
          goto LABEL_14;
        }
        ++v34;
      }
      v22 = v13;
LABEL_14:
      v8 += v15;
      v7 = v39 + v16;
      v6 = v22 + (v15 ^ 1);
      ++v9;
      v5 = v21 + v17;
      if (v37 == v9)
      {
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v37)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
  }
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v7 = 0;
  v8 = 0;
LABEL_18:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v23, CFSTR("homes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v24, CFSTR("homesAsAdmin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v25, CFSTR("homesAsOwner"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v26, CFSTR("homesAsSharedUser"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v27, CFSTR("homesWithRemoteAccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v28, CFSTR("deliveriesSetToAnywhere"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, CFSTR("deliveriesSetToNever"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("deliveriesSetToWhenHome"));

}

- (void)_collectForAnnouncementsInHome:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  ANAnalyticsDailyAnnouncements *v15;
  ANAnalyticsDailyAnnouncements *v16;
  ANAnalyticsDaily *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  dispatch_source_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  dispatch_time_t v35;
  const char *v36;
  NSObject *v37;
  void *v38;
  void (**v39)(_QWORD);
  void *v40;
  void *v41;
  _QWORD handler[4];
  id v43;
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  _QWORD aBlock[4];
  dispatch_source_t v49;
  id v50;
  ANAnalyticsDailyAnnouncements *v51;
  void (**v52)(_QWORD);
  _QWORD v53[4];
  id v54;
  ANAnalyticsDailyAnnouncements *v55;
  NSObject *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  const __CFString *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!-[ANAnalyticsDaily _isCoordinationDevice](self, "_isCoordinationDevice"))
  {
    ANLogHandleAnalyticsDaily();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = &stru_1E93913D0;
      v36 = "%@AnalyticsDaily ignoring collection for announcements in home. This device is not included in daily events coordination.";
LABEL_18:
      _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
    }
LABEL_19:

    v7[2](v7);
    goto LABEL_24;
  }
  -[ANAnalyticsDaily messagingConnection](self, "messagingConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDeviceAnalyticsCoordinator");

  ANLogHandleAnalyticsDaily();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v63 = &stru_1E93913D0;
      v36 = "%@AnalyticsDaily ignoring collection for announcements in home. This HomePod was not elected.";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (v11)
  {
    *(_DWORD *)buf = 138412290;
    v63 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily this HomePod was elected.", buf, 0xCu);
  }

  v12 = dispatch_group_create();
  v41 = (void *)objc_opt_new();
  -[ANAnalyticsDaily defaults](self, "defaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForDefault:", *MEMORY[0x1E0CF7B38]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[ANAnalyticsDailyAnnouncements initWithDictionary:]([ANAnalyticsDailyAnnouncements alloc], "initWithDictionary:", v14);
  if (-[ANAnalyticsDailyAnnouncements shouldReport](v15, "shouldReport"))
  {
    v16 = v15;
    v38 = v14;
    v39 = v7;
    v40 = v6;
    v17 = self;
    -[ANAnalyticsDaily messagingConnection](self, "messagingConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "devicesCountingAnnouncements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v58 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
          dispatch_group_enter(v12);
          -[ANAnalyticsDaily messagingConnection](v17, "messagingConnection");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke;
          v53[3] = &unk_1E93901B8;
          v54 = v41;
          v55 = v16;
          v56 = v12;
          objc_msgSend(v26, "sendDailyRequest:handler:", v27, v53);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v22);
    }

    objc_initWeak((id *)buf, v17);
    dispatch_get_global_queue(9, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v28);
    aBlock[0] = MEMORY[0x1E0C809B0];
    v30 = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_2;
    aBlock[3] = &unk_1E93900B0;
    v49 = v29;
    v50 = v40;
    v15 = v16;
    v51 = v16;
    v7 = v39;
    v52 = v39;
    v31 = v29;
    v32 = _Block_copy(aBlock);
    block[0] = v30;
    block[1] = 3221225472;
    block[2] = __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_3;
    block[3] = &unk_1E938F908;
    objc_copyWeak(&v47, (id *)buf);
    v33 = v32;
    v46 = v33;
    dispatch_group_notify(v12, v28, block);
    handler[0] = v30;
    handler[1] = 3221225472;
    handler[2] = __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_65;
    handler[3] = &unk_1E938F908;
    objc_copyWeak(&v44, (id *)buf);
    v43 = v33;
    v34 = v33;
    dispatch_source_set_event_handler(v31, handler);
    v35 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v31, v35, 0x77359400uLL, 0);
    dispatch_resume(v31);

    objc_destroyWeak(&v44);
    v6 = v40;
    objc_destroyWeak(&v47);

    objc_destroyWeak((id *)buf);
    v14 = v38;
  }
  else
  {
    ANLogHandleAnalyticsDaily();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v37, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily not reporting for announcements in home since last report was too recent.", buf, 0xCu);
    }

    v7[2](v7);
  }

LABEL_24:
}

void __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ANAnalyticsDailyAnnouncements *v4;

  v3 = a2;
  v4 = -[ANAnalyticsDailyAnnouncements initWithDictionary:]([ANAnalyticsDailyAnnouncements alloc], "initWithDictionary:", v3);

  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(a1 + 40), "merge:", v4);
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

intptr_t __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  intptr_t result;
  void *v4;
  void *v5;

  v2 = *(NSObject **)(a1 + 32);
  result = dispatch_source_testcancel(v2);
  if (!result)
  {
    dispatch_source_cancel(v2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "announcementsCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, CFSTR("homeAnnouncements"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "homesCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, CFSTR("homesUsingAnnounce"));

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

uint64_t __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resetDailyAnnouncements");

  ANLogHandleAnalyticsDaily();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily completed collecting announcements made in home.", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_65(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "backgroundActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDefer");

  if (v4)
  {
    ANLogHandleAnalyticsDaily();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily should defer while collecting announcements in home.", (uint8_t *)&v6, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)announcementSent:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  ANAnalyticsDailyAnnouncements *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[ANAnalyticsDaily _isCoordinationDevice](self, "_isCoordinationDevice"))
  {
    -[ANAnalyticsDaily defaults](self, "defaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CF7B38];
    objc_msgSend(v8, "objectForDefault:", *MEMORY[0x1E0CF7B38]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[ANAnalyticsDailyAnnouncements initWithDictionary:]([ANAnalyticsDailyAnnouncements alloc], "initWithDictionary:", v10);
    objc_msgSend(v6, "groupID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnalyticsDailyAnnouncements incrementCountInHome:group:](v11, "incrementCountInHome:group:", v7, v12);

    -[ANAnalyticsDaily defaults](self, "defaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnalyticsDailyAnnouncements dictionary](v11, "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forDefault:", v14, v9);

  }
  else
  {
    ANLogHandleAnalyticsDaily();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily ignoring tracking of announcements sent. This device is not included in daily events coordination.", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void)_registerRapportDailyRequest
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (-[ANAnalyticsDaily _isCoordinationDevice](self, "_isCoordinationDevice"))
  {
    objc_initWeak(location, self);
    -[ANAnalyticsDaily messagingConnection](self, "messagingConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__ANAnalyticsDaily__registerRapportDailyRequest__block_invoke;
    v5[3] = &unk_1E93901E0;
    objc_copyWeak(&v6, location);
    objc_msgSend(v3, "registerDailyRequest:", v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }
  else
  {
    ANLogHandleAnalyticsDaily();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily ignoring registration for rapport activation. This device is not included in daily events coordination.", (uint8_t *)location, 0xCu);
    }

  }
}

id __48__ANAnalyticsDaily__registerRapportDailyRequest__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "_dailyResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    ANLogHandleAnalyticsDaily();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily lost reference count for self on daily request registration.", (uint8_t *)&v7, 0xCu);
    }

    return MEMORY[0x1E0C9AA70];
  }
}

- (id)_dailyResponse
{
  void *v3;
  void *v4;
  ANAnalyticsDailyAnnouncements *v5;
  void *v6;

  -[ANAnalyticsDaily defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForDefault:", *MEMORY[0x1E0CF7B38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ANAnalyticsDailyAnnouncements initWithDictionary:]([ANAnalyticsDailyAnnouncements alloc], "initWithDictionary:", v4);
  -[ANAnalyticsDaily _resetDailyAnnouncements](self, "_resetDailyAnnouncements");
  -[ANAnalyticsDailyAnnouncements dictionary](v5, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_resetDailyAnnouncements
{
  ANAnalyticsDailyAnnouncements *v3;
  void *v4;
  void *v5;
  void *v6;
  ANAnalyticsDailyAnnouncements *v7;

  v3 = [ANAnalyticsDailyAnnouncements alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v7 = -[ANAnalyticsDailyAnnouncements initWithLastAccess:](v3, "initWithLastAccess:");

  -[ANAnalyticsDaily defaults](self, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnalyticsDailyAnnouncements dictionary](v7, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forDefault:", v6, *MEMORY[0x1E0CF7B38]);

}

- (BOOL)_isCoordinationDevice
{
  return 0;
}

- (ANAnalyticsDailyDelegate)delegate
{
  return (ANAnalyticsDailyDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (ANBackgroundActivityProtocol)backgroundActivity
{
  return self->_backgroundActivity;
}

- (void)setBackgroundActivity:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundActivity, a3);
}

- (ANDefaultsProtocol)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (ANAnalyticsStorage)eventStorage
{
  return self->_eventStorage;
}

- (ANAnalyticsDailyHomesProvider)homesProvider
{
  return self->_homesProvider;
}

- (void)setHomesProvider:(id)a3
{
  objc_storeStrong((id *)&self->_homesProvider, a3);
}

- (ANAnalyticsDailyMessagingProtocol)messagingConnection
{
  return self->_messagingConnection;
}

- (void)setMessagingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_messagingConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingConnection, 0);
  objc_storeStrong((id *)&self->_homesProvider, 0);
  objc_storeStrong((id *)&self->_eventStorage, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_backgroundActivity, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
