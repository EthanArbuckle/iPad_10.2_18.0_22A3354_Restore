@implementation ATXSuggestedPagesGenreAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id obj;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = a4;
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v6, "allAppsKnownToSpringBoard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (-[ATXSuggestedPagesGenreAppDataSource _pageType:matchesGenreId:forBundleId:](self, "_pageType:matchesGenreId:forBundleId:", a3, objc_msgSend(MEMORY[0x1E0CF8CE8], "genreIdForBundle:", v13), v13))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    v27 = v6;
    v14 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v15 = (void *)objc_msgSend(v14, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    v16 = objc_msgSend(v15, "BOOLForKey:", *MEMORY[0x1E0CF9418]);

    v29 = (id)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v7;
    obj = v7;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v30, "appLaunchCounts");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v16 & 1) != 0
            || -[ATXSuggestedPagesGenreAppDataSource _appLaunchDataPassesThreshold:forPageType:bundleId:](self, "_appLaunchDataPassesThreshold:forPageType:bundleId:", v23, a3, v21))
          {
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:score:uniqueDaysLaunched:rawLaunchCount:", v21, CFSTR("App Category"), objc_msgSend(v23, "uniqueDaysLaunched"), objc_msgSend(v23, "rawLaunchCount"), 0.0);
            objc_msgSend(v29, "addObject:", v24);

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v18);
    }

    v7 = v26;
    v6 = v27;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)_appLaunchDataPassesThreshold:(id)a3 forPageType:(int64_t)a4 bundleId:(id)a5
{
  id v7;
  id v8;
  BOOL v9;
  BOOL v10;

  v7 = a3;
  v8 = a5;
  switch(a4)
  {
    case 5:
    case 9:
      goto LABEL_8;
    case 6:
      if (objc_msgSend(MEMORY[0x1E0CF8CE8], "genreIdForBundle:", v8) == 6011)
      {
        v9 = (unint64_t)objc_msgSend(v7, "uniqueDaysLaunched") > 6;
LABEL_5:
        v10 = v9;
      }
      else
      {
LABEL_8:
        v10 = objc_msgSend(v7, "rawLaunchCount") != 0;
      }
LABEL_11:

      return v10;
    case 7:
    case 8:
      v9 = (unint64_t)objc_msgSend(v7, "uniqueDaysLaunched") > 1;
      goto LABEL_5;
    case 10:
      v10 = 1;
      goto LABEL_11;
    default:
      v10 = 0;
      goto LABEL_11;
  }
}

- (BOOL)_pageType:(int64_t)a3 matchesGenreId:(unint64_t)a4 forBundleId:(id)a5
{
  id v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  BOOL v11;
  unsigned int v12;
  int v13;
  BOOL v14;

  v7 = a5;
  switch(a3)
  {
    case 5:
      v8 = 6010;
      goto LABEL_17;
    case 6:
      if (a4 == 6011 && (objc_msgSend(MEMORY[0x1E0CF8CE8], "isBackgroundAudioSupportedForBundle:", v7) & 1) != 0)
      {
        v14 = 1;
      }
      else
      {
        v8 = 6013;
LABEL_17:
        v9 = a4 == v8;
LABEL_18:
        v14 = v9;
      }
LABEL_21:

      return v14;
    case 7:
      v9 = a4 == 6000 || a4 == 6007;
      goto LABEL_18;
    case 8:
      v10 = a4 - 116;
      v11 = a4 - 6004 >= 0xD;
      v12 = 4241;
      goto LABEL_8;
    case 9:
      v10 = a4 - 121;
      v11 = a4 - 6009 >= 0xD;
      v12 = 4609;
LABEL_8:
      v13 = (v12 >> v10) & 1;
      if (v11)
        v14 = 0;
      else
        v14 = v13;
      goto LABEL_21;
    case 10:
      v8 = 6014;
      goto LABEL_17;
    default:
      v14 = 0;
      goto LABEL_21;
  }
}

@end
