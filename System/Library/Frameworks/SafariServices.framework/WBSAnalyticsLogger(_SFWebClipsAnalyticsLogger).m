@implementation WBSAnalyticsLogger(_SFWebClipsAnalyticsLogger)

- (void)_webClipsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDouble:forKey:", CFSTR("LastWebAppReportTime"), CFAbsoluteTimeGetCurrent());

}

- (void)_performWebClipsBehaviorReport
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3F68], "clipsIncludingWebClips:includingAppClips:", 1, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    v4 = 0;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v0);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "applicationBundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          if (objc_msgSend(v7, "fullScreen"))
            ++v4;
          else
            ++v3;
        }
      }
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v2);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportNumberOfWebApps:andBookmarks:", v4, v3);

}

- (void)schedulePeriodicWebClipsReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey;
  _QWORD block[5];

  WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__WBSAnalyticsLogger__SFWebClipsAnalyticsLogger__schedulePeriodicWebClipsReport__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E0C80D38], block);
}

@end
