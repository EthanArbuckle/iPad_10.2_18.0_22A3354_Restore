@implementation WBSAnalyticsLogger(TabGroupsAnalyticsLogger)

- (void)_tabGroupsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDouble:forKey:", CFSTR("LastPeriodicTabGroupsReportTime"), CFAbsoluteTimeGetCurrent());

}

- (void)_performTabGroupsReport
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[Application sharedApplication](Application, "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "tabGroupManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allNamedTabGroupsUnsorted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "count");
  if (v4)
  {
    v5 = v4;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v2;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v21 = v3;
      v22 = v2;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v13, "tabs", v21, v22, (_QWORD)v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          objc_msgSend(v13, "tabs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count") > v10)
          {
            objc_msgSend(v13, "tabs");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v17, "count");

          }
          v9 += v15;

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
      v18 = (double)v9;
      v3 = v21;
      v2 = v22;
    }
    else
    {
      v10 = 0;
      v18 = 0.0;
    }

    objc_msgSend(v3, "reportAverageNumberOfTabsPerTabGroup:andMaximum:", llround(v18 / (double)v5), v10);
    objc_msgSend(v3, "reportNumberOfTabGroups:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reportAverageNumberOfTabsPerTabGroup:andMaximum:", 0, 0);

    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "reportNumberOfTabGroups:", 0);

  }
}

- (void)_performTabsForNonTabGroupUserReport
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  double v21;
  double v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  +[Application sharedApplication](Application, "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "tabGroupManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allNamedTabGroupsUnsorted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v2, "count"))
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "browserControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = v4;
    v29 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v29)
    {
      v25 = v5;
      v26 = v2;
      v8 = 0;
      obj = v7;
      v28 = *(_QWORD *)v35;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "tabController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "currentTabs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v12, "count");
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v14 = v12;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v31 != v17)
                  objc_enumerationMutation(v14);
                v19 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "lastActivationTime");
                objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "timeIntervalSinceDate:", v20);
                v9 = v9 + v21;

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v16);
          }
          v8 += v13;

        }
        v7 = obj;
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v29);

      if (v8)
      {
        v22 = (double)v8;
        v23 = llround(v9 / 60.0 / 60.0 / 24.0 / (double)v8);
      }
      else
      {
        v23 = 0;
        v22 = 0.0;
      }
      v5 = v25;
      v2 = v26;
      if (!v25)
        goto LABEL_23;
    }
    else
    {

      v23 = 0;
      v22 = 0.0;
      if (!v5)
        goto LABEL_23;
    }
    v22 = v22 / (double)v5;
    v5 = llround(v22);
LABEL_23:
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "reportTabsForNonTabGroupUser:andAverageNumber:", v23, v5);

  }
}

- (void)_performSyncSuccessesCountReport
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0D8B2A8];
  objc_msgSend(v0, "safari_numberForKey:", *MEMORY[0x1E0D8B2A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "copy");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteger:forKey:", 0, v1);

    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportTabGroupSyncSuccessesWithCount:", v5);

  }
}

- (void)schedulePeriodicTabGroupsReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey;
  _QWORD block[5];

  WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__WBSAnalyticsLogger_TabGroupsAnalyticsLogger__schedulePeriodicTabGroupsReport__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E0C80D38], block);
}

@end
