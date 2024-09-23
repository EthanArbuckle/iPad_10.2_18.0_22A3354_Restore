@implementation NSURL(FCAdditions)

- (id)fc_NewsArticleID
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  id v6;
  void *v7;
  id v9;

  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "fc_isValidArticleID"))
  {
    v4 = v3;
  }
  else
  {
    v9 = 0;
    v5 = objc_msgSend(a1, "fc_isHardPaywallNewsArticleURL:", &v9);
    v6 = v9;
    v7 = v6;
    v4 = 0;
    if (v5 && v6)
      v4 = v6;

  }
  return v4;
}

- (uint64_t)fc_isHardPaywallNewsArticleURL:()FCAdditions
{
  void *v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (!objc_msgSend(a1, "fc_isNewsURL"))
    return 0;
  objc_msgSend(a1, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pathComponents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = v7 == 2;
  if (v7 == 2)
  {
    v9 = objc_msgSend(v5, "fc_isValidHardPaywallArticleID");

    if (!a3 || !(_DWORD)v9)
      goto LABEL_8;
    v6 = v5;
    if ((unint64_t)objc_msgSend(v6, "length") >= 2)
    {
      objc_msgSend(v6, "substringFromIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nf_stringByReversingString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A%@"), v11);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v12;

    }
  }

  v9 = v8;
LABEL_8:

  return v9;
}

- (uint64_t)fc_isNewsURL
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  int v6;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("applenews")) & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("applenewss"));
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("http")) & 1) != 0
      || (v6 = objc_msgSend(v2, "isEqualToString:", CFSTR("https"))) != 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("news.apple.com")) & 1) != 0
        || (objc_msgSend(v3, "isEqualToString:", CFSTR("apple.news")) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("one.apple.com"));
      }
    }
    v5 = v4 | v6;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fc_feldsparTagID
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "fc_isValidTagID"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)fc_NewsIssueID
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "fc_isValidIssueID"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

+ (id)fc_safeURLWithString:()FCAdditions
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)fc_directoryExists
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v3, &v6);

  return v4;
}

- (uint64_t)fc_isWebOptInURL
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "fc_isNewsURL");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsString:", CFSTR("weboptin"));

    return v4;
  }
  return result;
}

- (uint64_t)fc_hasValidArticleComponents
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;

  objc_msgSend(a1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("articles"));

  objc_msgSend(a1, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 2)
  {
    v6 = objc_msgSend(v2, "fc_isValidArticleID");

    if (((v6 ^ 1 | v4) & 1) == 0)
      goto LABEL_6;
  }
  else
  {

  }
  if ((objc_msgSend(a1, "_isFeldsparOldArticleURL") & 1) == 0)
  {
    v7 = objc_msgSend(a1, "fc_isHardPaywallNewsArticleURL:", 0);
    goto LABEL_8;
  }
LABEL_6:
  v7 = 1;
LABEL_8:

  return v7;
}

- (uint64_t)fc_isNewsArticleURL
{
  uint64_t result;

  result = objc_msgSend(a1, "fc_isNewsURL");
  if ((_DWORD)result)
    return objc_msgSend(a1, "fc_hasValidArticleComponents");
  return result;
}

- (uint64_t)fc_isNewsArticleVideoURL
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "fc_isNewsArticleURL");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "fc_valueForQueryItemWithName:", CFSTR("v"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("1"));

    return v4;
  }
  return result;
}

- (id)fc_URLWithVideoTarget:()FCAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("v"), CFSTR("1"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fc_URLByAddingQueryItem:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  return v4;
}

- (uint64_t)fc_isNewsIssueURL
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!objc_msgSend(a1, "fc_isNewsURL"))
    return 0;
  objc_msgSend(a1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
    v4 = objc_msgSend(v2, "fc_isValidIssueID");
  else
    v4 = 0;

  return v4;
}

- (id)fc_NewsArticleIDs
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "queryItems");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "name", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("articleList"));

        if ((v9 & 1) != 0)
        {
          objc_msgSend(v7, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(","));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (uint64_t)fc_isStocksURL
{
  void *v2;
  void *v3;
  int v4;
  unsigned int v5;
  uint64_t v6;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("stocks"));
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("http")) & 1) != 0
      || (v5 = objc_msgSend(v2, "isEqualToString:", CFSTR("https"))) != 0)
    {
      v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("stocks.apple.com"));
    }
    v6 = v4 | v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isFeldsparOldArticleURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "pathComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "length") && v3 == 3)
    v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("articles"), 1) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (uint64_t)fc_isFeldsparInterstitialPreviewURL
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a1, "fc_isNewsURL"))
    return 0;
  objc_msgSend(a1, "pathComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 2)
  {
    objc_msgSend(a1, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("interstitial-preview"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)fc_isNewsTagURL
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;

  if (!objc_msgSend(a1, "fc_isNewsURL"))
    return 0;
  objc_msgSend(a1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("topics"));

  objc_msgSend(v2, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("channels"));

  v7 = objc_msgSend(v2, "fc_isValidTagID");
  objc_msgSend(a1, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 2)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9 & ((v4 | v6) ^ 1);

  if (v7)
  {
    if ((objc_msgSend(a1, "_isFeldsparOldChannelURL") & 1) != 0)
      v11 = 1;
    else
      v11 = objc_msgSend(a1, "_isFeldsparOldTopicURL");
  }
  else
  {
    v11 = 0;
  }
  v12 = v10 | v11;

  return v12;
}

- (uint64_t)fc_isNewsSportsEventURL
{
  void *v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a1, "fc_isNewsURL"))
    return 0;
  objc_msgSend(a1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fc_isValidSportsEventID");
  objc_msgSend(a1, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)fc_isNewsPuzzleURL
{
  void *v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a1, "fc_isNewsURL"))
    return 0;
  objc_msgSend(a1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fc_isValidPuzzleID");
  objc_msgSend(a1, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)fc_isNewsPuzzleTypeURL
{
  void *v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a1, "fc_isNewsURL"))
    return 0;
  objc_msgSend(a1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fc_isValidPuzzleTypeID");
  objc_msgSend(a1, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

+ (uint64_t)fc_NewsURLWithPathComponents:()FCAdditions
{
  return objc_msgSend(a1, "fc_NewsURLWithPathComponents:internal:", a3, 0);
}

+ (uint64_t)fc_NewsURLWithPathComponents:()FCAdditions internal:
{
  return objc_msgSend(a1, "fc_NewsURLWithPathComponents:queryItems:internal:", a3, MEMORY[0x1E0C9AA60], a4);
}

+ (id)fc_NewsURLWithPathComponents:()FCAdditions queryItems:internal:
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
    v14 = &stru_1E464BC40;
  else
    v14 = CFSTR("apple.news");
  objc_msgSend(v12, "setScheme:", v13);
  objc_msgSend(v12, "setHost:", v14);
  objc_msgSend(v12, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (uint64_t)fc_NewsURLForArticleID:()FCAdditions hardPaywall:
{
  return objc_msgSend(a1, "fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:", a3, 0, 0, a4);
}

+ (id)fc_NewsURLForArticleID:()FCAdditions routeURL:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(a1, "fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:", v6, 0, 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v51 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:routeURL:]";
    v52 = 2080;
    v53 = "NSURL+FCAdditions.m";
    v54 = 1024;
    v55 = 382;
    v56 = 2114;
    v57 = v38;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!objc_msgSend(v6, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID.length != 0");
    *(_DWORD *)buf = 136315906;
    v51 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:routeURL:]";
    v52 = 2080;
    v53 = "NSURL+FCAdditions.m";
    v54 = 1024;
    v55 = 383;
    v56 = 2114;
    v57 = v39;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("article IDs with slashes won't be handled properly"));
    *(_DWORD *)buf = 136315906;
    v51 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:routeURL:]";
    v52 = 2080;
    v53 = "NSURL+FCAdditions.m";
    v54 = 1024;
    v55 = 384;
    v56 = 2114;
    v57 = v36;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_11;
LABEL_31:
    v28 = 0;
    goto LABEL_32;
  }
  if (!v6)
    goto LABEL_31;
LABEL_11:
  v43 = v6;
  v49 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_NewsURLWithPathComponents:", v8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v7, 0);
  v10 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  v41 = v9;
  objc_msgSend(v9, "fragment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQuery:", v11);

  objc_msgSend(v10, "queryItems");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (v12)
    v14 = (void *)v12;
  v15 = v14;

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v22, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("nff_cid"));

        if ((v24 & 1) == 0)
          objc_msgSend(v16, "addObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v19);
  }

  objc_msgSend(v10, "setQueryItems:", v16);
  objc_msgSend(v10, "query");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "length"))
  {
    objc_msgSend(v10, "query");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v41;
    objc_msgSend(v41, "setFragment:", v26);

  }
  else
  {
    v27 = v41;
    objc_msgSend(v41, "setFragment:", 0);
  }
  v7 = v42;
  v6 = v43;

  objc_msgSend(v27, "URL");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = (void *)v29;
  else
    v31 = v42;
  v32 = v31;

  objc_msgSend(v32, "dataRepresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "base64EncodedStringWithOptions:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("route"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "fc_URLByAddingQueryItem:", v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
  return v28;
}

+ (id)fc_NewsURLForArticleID:()FCAdditions internal:targetIsVideo:hardPaywall:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:]";
    v24 = 2080;
    v25 = "NSURL+FCAdditions.m";
    v26 = 1024;
    v27 = 421;
    v28 = 2114;
    v29 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!objc_msgSend(v10, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID.length != 0");
    *(_DWORD *)buf = 136315906;
    v23 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:]";
    v24 = 2080;
    v25 = "NSURL+FCAdditions.m";
    v26 = 1024;
    v27 = 422;
    v28 = 2114;
    v29 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (objc_msgSend(v10, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("article IDs with slashes won't be handled properly"));
    *(_DWORD *)buf = 136315906;
    v23 = "+[NSURL(FCAdditions) fc_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:]";
    v24 = 2080;
    v25 = "NSURL+FCAdditions.m";
    v26 = 1024;
    v27 = 424;
    v28 = 2114;
    v29 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_10;
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  if (!v10)
    goto LABEL_17;
LABEL_10:
  if ((a6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "fc_hardPaywallArticleIDWithArticleID:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v10;
  }
  v12 = v11;
  v21 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_NewsURLWithPathComponents:internal:", v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("v"), CFSTR("1"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fc_URLByAddingQueryItem:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }

LABEL_18:
  return v14;
}

+ (id)fc_NewsURLForTagID:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "+[NSURL(FCAdditions) fc_NewsURLForTagID:]";
    v13 = 2080;
    v14 = "NSURL+FCAdditions.m";
    v15 = 1024;
    v16 = 446;
    v17 = 2114;
    v18 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!objc_msgSend(v4, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID.length != 0");
    *(_DWORD *)buf = 136315906;
    v12 = "+[NSURL(FCAdditions) fc_NewsURLForTagID:]";
    v13 = 2080;
    v14 = "NSURL+FCAdditions.m";
    v15 = 1024;
    v16 = 447;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_NewsURLWithPathComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)fc_isEqualToURL:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "absoluteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(a1, "isFileURL") && objc_msgSend(v4, "isFileURL"))
  {
    objc_msgSend(a1, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isFeldsparOldTopicURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "pathComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "length") && v3 == 3)
    v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("topics"), 1) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (BOOL)_isFeldsparOldChannelURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "pathComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "length") && v3 == 3)
    v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("channels"), 1) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (uint64_t)fc_isWebArchiveURL
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("file")))
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("webarchive"));
  else
    v4 = 0;

  return v4;
}

- (uint64_t)fc_isHTTPScheme
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("http")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("https")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(a1, "fc_isWebArchiveURL");
  }

  return v3;
}

- (uint64_t)fc_isStoreURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("itms")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("itunes.apple.com")) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(a1, "host");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("buy.itunes.apple.com")) & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        objc_msgSend(a1, "host");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v6, "isEqualToString:", CFSTR("storepreview.apple.com"));

      }
    }

  }
  return v3;
}

- (id)fc_URLByDeletingQuery
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setQuery:", 0);
  objc_msgSend(v1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)fc_URLByDeletingFragment
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFragment:", 0);
  objc_msgSend(v1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)fc_URLByAddingQueryItem:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB3998];
  v5 = a3;
  objc_msgSend(v4, "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "queryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v9, "addObject:", v5);
  objc_msgSend(v6, "setQueryItems:", v9);
  objc_msgSend(v6, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = a1;
  v12 = v10;

  return v12;
}

- (id)fc_valueForQueryItemWithName:()FCAdditions
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

- (uint64_t)fc_isGzippedWithMIMETypeHint:()FCAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (FCMIMETypeIsGZip(v4))
  {
    v5 = 1;
  }
  else if (v4 && !FCMIMETypeIsBinary(v4))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3608];
    objc_msgSend(a1, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileHandleForReadingAtPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "readDataOfLength:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "closeFile");
    v5 = objc_msgSend(v9, "fc_isGzipped");

  }
  return v5;
}

- (uint64_t)fc_fileSystemFreeSize
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "attributesOfFileSystemForPath:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "longLongValue");
    }
    else
    {
      v9 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "failed to lookup file system free size with unknown error", buf, 2u);
      }
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__NSURL_FCAdditions__fc_fileSystemFreeSize__block_invoke;
    v11[3] = &unk_1E4642F58;
    v11[4] = v5;
    __43__NSURL_FCAdditions__fc_fileSystemFreeSize__block_invoke((uint64_t)v11);
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (uint64_t)fc_volumeAvailableCapacityForOpportunisticUsage
{
  uint64_t v1;
  char v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  void *v13;
  uint8_t buf[16];

  v13 = 0;
  v1 = *MEMORY[0x1E0C99BB0];
  v12 = 0;
  v2 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v13, v1, &v12);
  v3 = v13;
  v4 = v12;
  v5 = v4;
  if ((v2 & 1) == 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__NSURL_FCAdditions__fc_volumeAvailableCapacityForOpportunisticUsage__block_invoke;
    v11[3] = &unk_1E4642F58;
    v11[4] = v4;
    v8 = v3;
    __69__NSURL_FCAdditions__fc_volumeAvailableCapacityForOpportunisticUsage__block_invoke((uint64_t)v11);
LABEL_7:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  v6 = v3;
  if (!objc_msgSend(v6, "longLongValue"))
  {
    v9 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "failed to lookup volume available capacity for opportunistic usage with unknown error", buf, 2u);
    }
    goto LABEL_7;
  }
  v7 = objc_msgSend(v6, "longLongValue");
LABEL_8:

  return v7;
}

@end
