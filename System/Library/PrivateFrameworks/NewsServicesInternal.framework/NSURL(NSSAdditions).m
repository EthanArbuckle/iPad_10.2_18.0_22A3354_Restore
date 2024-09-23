@implementation NSURL(NSSAdditions)

+ (uint64_t)nss_NewsURLForTagID:()NSSAdditions
{
  return objc_msgSend(a1, "nss_NewsURLForTagID:feedConfiguration:", a3, 0);
}

+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions routeURL:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "fc_NewsURLForArticleID:routeURL:");
}

+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions internal:targetIsVideo:hardPaywall:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:");
}

+ (uint64_t)nss_NewsURLWithPathComponents:()NSSAdditions internal:
{
  return objc_msgSend(a1, "nss_NewsURLWithPathComponents:queryItems:internal:", a3, MEMORY[0x1E0C9AA60], a4);
}

- (uint64_t)nss_isNewsURL
{
  void *v2;
  int v3;

  objc_msgSend(a1, "_nss_valueForQueryParameterWithKey:", CFSTR("open_in"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("app"));

  return objc_msgSend(a1, "fc_isNewsURL") | v3;
}

+ (id)nss_NewsURLForTagID:()NSSAdditions feedConfiguration:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForTagID:feedConfiguration:].cold.3();
  if (!objc_msgSend(v6, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForTagID:feedConfiguration:].cold.2();
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForTagID:feedConfiguration:].cold.1();
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  switch(a4)
  {
    case 2:
      v9 = objc_alloc(MEMORY[0x1E0CB39D8]);
      v10 = CFSTR("backCatalog");
      goto LABEL_16;
    case 4:
      v9 = objc_alloc(MEMORY[0x1E0CB39D8]);
      v10 = CFSTR("sportsStandings");
      goto LABEL_16;
    case 5:
      v9 = objc_alloc(MEMORY[0x1E0CB39D8]);
      v10 = CFSTR("sportsScores");
      goto LABEL_16;
    case 6:
      v9 = objc_alloc(MEMORY[0x1E0CB39D8]);
      v10 = CFSTR("sportsHighlights");
      goto LABEL_16;
    case 7:
      v9 = objc_alloc(MEMORY[0x1E0CB39D8]);
      v10 = CFSTR("sportsBracket");
LABEL_16:
      v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("alternate_feed"), v10);
      objc_msgSend(v8, "addObject:", v11);

      break;
    case 11:
      objc_msgSend(v7, "addObject:", CFSTR("archive"));
      break;
    default:
      break;
  }
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:queryItems:internal:", v7, v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)nss_NewsURLWithPathComponents:()NSSAdditions queryItems:internal:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  objc_msgSend(v8, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", CFSTR("/"));
  objc_msgSend(v10, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v12, "setPath:", v11);
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v12, "setQueryItems:", v7);
  if (a5)
    v13 = CFSTR("applenews");
  else
    v13 = CFSTR("https");
  if (a5)
    v14 = &stru_1E9BDD2E8;
  else
    v14 = CFSTR("apple.news");
  objc_msgSend(v12, "setScheme:", v13);
  objc_msgSend(v12, "setHost:", v14);
  objc_msgSend(v12, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_nss_valueForQueryParameterWithKey:()NSSAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByRemovingPercentEncoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("&"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v4))
        {
          v16 = v15;

          v10 = v16;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions
{
  return objc_msgSend(a1, "nss_NewsURLForArticleID:routeURL:", a3, 0);
}

- (uint64_t)nss_isAudioURL
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "nss_isNewsURL");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "pathComponents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", CFSTR("nowPlaying"));

    return v4;
  }
  return result;
}

+ (id)nss_NewsURLForWebLinkURL:()NSSAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForWebLinkURL:].cold.1();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("http")))
  {
    objc_msgSend(v3, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("http");
    v8 = CFSTR("applenews");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("https")))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported scheme: %@", (uint8_t *)&v12, 0xCu);
      }
      goto LABEL_12;
    }
    objc_msgSend(v3, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("https");
    v8 = CFSTR("applenewss");
  }
  objc_msgSend(v5, "fc_stringByReplacingPrefix:withString:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v10;
}

+ (id)nss_NewsURLForIssueID:()NSSAdditions
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForIssueID:].cold.3();
  if (!objc_msgSend(v4, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForIssueID:].cold.2();
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForIssueID:].cold.1();
    if (v4)
      goto LABEL_10;
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  if (!v4)
    goto LABEL_12;
LABEL_10:
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v6;
}

+ (id)nss_NewsURLForPuzzleID:()NSSAdditions
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleID:].cold.3();
  if (!objc_msgSend(v4, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleID:].cold.2();
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleID:].cold.1();
    if (v4)
      goto LABEL_10;
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  if (!v4)
    goto LABEL_12;
LABEL_10:
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v6;
}

+ (id)nss_NewsURLForFullArchivePuzzleTypeID:()NSSAdditions
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForFullArchivePuzzleTypeID:].cold.3();
  if (!objc_msgSend(v4, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForFullArchivePuzzleTypeID:].cold.2();
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForFullArchivePuzzleTypeID:].cold.1();
    if (v4)
      goto LABEL_10;
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  if (!v4)
    goto LABEL_12;
LABEL_10:
  v8[0] = v4;
  v8[1] = CFSTR("archive");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v6;
}

+ (id)nss_NewsURLForPuzzleTypeID:()NSSAdditions
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleTypeID:].cold.3();
  if (!objc_msgSend(v4, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleTypeID:].cold.2();
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[NSURL(NSSAdditions) nss_NewsURLForPuzzleTypeID:].cold.1();
    if (v4)
      goto LABEL_10;
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  if (!v4)
    goto LABEL_12;
LABEL_10:
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v6;
}

+ (uint64_t)nss_NewsURLForArticleID:()NSSAdditions targetIsVideo:
{
  return objc_msgSend(a1, "nss_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:", a3, 0, a4, 0);
}

+ (id)nss_NewsURLForArticleID:()NSSAdditions title:
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "nss_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:", a3, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setTitle:", v6);

  return v7;
}

- (uint64_t)nss_hasRefreshParameter
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "nss_isNewsURL");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "_nss_valueForQueryParameterWithKey:", CFSTR("r"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("1"));

    return v4;
  }
  return result;
}

- (uint64_t)nss_isSubscribeURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_nss_valueForQueryParameterWithKey:", CFSTR("subscribe"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("1"));

  return v2;
}

+ (id)nss_NewsURLForForYou
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("foryou");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForMagazines
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("magazines");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForMyMagazines
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("mymagazines");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForPuzzleHub
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("puzzles");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForMySports
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("mysports");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForMySportsScores
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("myscores");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForMySportsHighlights
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("mysportshighlights");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForSaved
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("saved");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForHistory
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("history");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForFavoritesPicker
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("favoritespicker");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForManageNotifications
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("notifications");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nss_NewsURLForPuzzle
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("puzzle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nss_URLWithCampaignID:()NSSAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSURL(NSSAdditions) nss_URLWithCampaignID:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("campaign_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nss_URLByAppendingQueryItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)nss_campaignID
{
  return objc_msgSend(a1, "_nss_valueForQueryParameterWithKey:", CFSTR("campaign_id"));
}

- (id)_nss_URLByAppendingQueryItem:()NSSAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSURL(NSSAdditions) _nss_URLByAppendingQueryItem:].cold.1();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v4);
  objc_msgSend(v5, "setQueryItems:", v8);
  objc_msgSend(v5, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)nss_MarketingPageURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(&unk_1E9BE0CA0, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(&unk_1E9BE0CA0, "objectForKeyedSubscript:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("https://www.apple.com/%@/news"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("https://www.apple.com/news");
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)nss_NewsURLForWebLinkURL:()NSSAdditions .cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"webLinkURL != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForIssueID:()NSSAdditions .cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("issue IDs with slashes won't be handled properly"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_7();
}

+ (void)nss_NewsURLForIssueID:()NSSAdditions .cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"issueID.length != 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForIssueID:()NSSAdditions .cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"issueID != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForPuzzleID:()NSSAdditions .cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzle IDs with slashes won't be handled properly"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_7();
}

+ (void)nss_NewsURLForPuzzleID:()NSSAdditions .cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleID.length != 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForPuzzleID:()NSSAdditions .cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleID != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForFullArchivePuzzleTypeID:()NSSAdditions .cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzle type IDs with slashes won't be handled properly"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_7();
}

+ (void)nss_NewsURLForFullArchivePuzzleTypeID:()NSSAdditions .cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleTypeID.length != 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForFullArchivePuzzleTypeID:()NSSAdditions .cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleTypeID != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForPuzzleTypeID:()NSSAdditions .cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzle type IDs with slashes won't be handled properly"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_7();
}

+ (void)nss_NewsURLForPuzzleTypeID:()NSSAdditions .cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleTypeID.length != 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForPuzzleTypeID:()NSSAdditions .cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"puzzleTypeID != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForTagID:()NSSAdditions feedConfiguration:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag IDs with slashes won't be handled properly"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_7();
}

+ (void)nss_NewsURLForTagID:()NSSAdditions feedConfiguration:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID.length != 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nss_NewsURLForTagID:()NSSAdditions feedConfiguration:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)nss_URLWithCampaignID:()NSSAdditions .cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"campaignID", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_nss_URLByAppendingQueryItem:()NSSAdditions .cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryItem", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
