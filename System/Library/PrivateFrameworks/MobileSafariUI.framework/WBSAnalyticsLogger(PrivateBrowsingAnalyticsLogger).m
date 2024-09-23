@implementation WBSAnalyticsLogger(PrivateBrowsingAnalyticsLogger)

- (void)_performPrivateBrowsingReport
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
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
  +[Application sharedApplication](Application, "sharedApplication", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "browserControllers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "isPrivateBrowsingEnabled"))
        {
          objc_msgSend(v7, "scene");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {

            v9 = 0;
            goto LABEL_16;
          }
          v4 = 1;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }

    if ((v4 & 1) != 0)
    {
      v9 = 1;
      goto LABEL_16;
    }
  }
  else
  {

  }
  v9 = 2;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_sf_reportPrivateWindowStatus:", v9);

}

- (void)_performAdvancedPrivacyProtectionPreferenceReport
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reportAdvancedPrivacyProtectionPreference");

}

- (void)schedulePeriodicPrivateBrowsingReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey;
  _QWORD block[5];

  WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__WBSAnalyticsLogger_PrivateBrowsingAnalyticsLogger__schedulePeriodicPrivateBrowsingReport__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E0C80D38], block);
}

@end
