@implementation NSURL(SLFacebookURLAdditions)

+ (BOOL)_isBetaSwitchEnabledForKey:()SLFacebookURLAdditions
{
  NSObject *v4;
  _BOOL8 v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  if (_startObservingPreferenceChanges_once != -1)
    dispatch_once(&_startObservingPreferenceChanges_once, &__block_literal_global_5);
  _preferencesQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__NSURL_SLFacebookURLAdditions___isBetaSwitchEnabledForKey___block_invoke;
  v7[3] = &unk_1E7590EF8;
  v7[4] = &v8;
  v7[5] = a3;
  dispatch_sync(v4, v7);

  v5 = objc_msgSend((id)v9[5], "integerValue") == 1;
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)URLForFacebookRESTMethod:()SLFacebookURLAdditions
{
  id v4;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "_isBetaSwitchEnabledForKey:", CFSTR("SLFacebookRESTAPIShouldUseBeta"));
  v6 = CFSTR("api.facebook.com");
  if (v5)
    v6 = CFSTR("api.beta.facebook.com");
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/method/%@"), v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)URLForFacebookGraphAPIWithPath:()SLFacebookURLAdditions
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLForFacebookGraphAPIWithDomain:path:", 0, a3);
}

+ (id)URLForFacebookGraphAPIWithDomain:()SLFacebookURLAdditions path:
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    if (objc_msgSend(a1, "_isBetaSwitchEnabledForKey:", CFSTR("SLFacebookGraphAPIShouldUseBeta")))
      v6 = CFSTR("graph.beta.facebook.com");
    else
      v6 = CFSTR("graph.facebook.com");
  }
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/%@"), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)URLForFacebookPageAtPath:()SLFacebookURLAdditions
{
  id v4;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "_isBetaSwitchEnabledForKey:", CFSTR("SLFacebookRESTAPIShouldUseBeta"));
  v6 = CFSTR("m.facebook.com");
  if (v5)
    v6 = CFSTR("m.beta.facebook.com");
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/%@"), v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)isMusicStoreURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  if (objc_msgSend(v2, "compare:options:", CFSTR("itun.es"), 1))
  {
    if (objc_msgSend(v2, "compare:options:", CFSTR("itunes.apple.com"), 1))
    {
      v3 = 0;
      goto LABEL_13;
    }
    objc_msgSend(a1, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("/"));
    if (!v6)
      goto LABEL_10;
    objc_msgSend(v4, "substringFromIndex:", v5 + v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("/"));
    if (!v9)
    {
      v3 = 0;
      v4 = v7;
      goto LABEL_12;
    }
    objc_msgSend(v7, "substringFromIndex:", v8 + v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("album/")) & 1) != 0
      || (objc_msgSend(v4, "hasPrefix:", CFSTR("movie/")) & 1) != 0
      || objc_msgSend(v4, "hasPrefix:", CFSTR("tv-season")))
    {
      v3 = 1;
    }
    else
    {
LABEL_10:
      v3 = 0;
    }
LABEL_12:

  }
LABEL_13:

  return v3;
}

- (uint64_t)isAppStoreURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  if (objc_msgSend(v2, "compare:options:", CFSTR("appsto.re"), 1))
  {
    if (objc_msgSend(v2, "compare:options:", CFSTR("itunes.apple.com"), 1))
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(a1, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("/"));
      if (v6)
      {
        objc_msgSend(v4, "substringFromIndex:", v5 + v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("/"));
        if (v9)
        {
          objc_msgSend(v7, "substringFromIndex:", v8 + v9);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          v3 = objc_msgSend(v4, "hasPrefix:", CFSTR("app/"));
        }
        else
        {
          v3 = 0;
          v4 = v7;
        }
      }
      else
      {
        v3 = 0;
      }

    }
  }

  return v3;
}

- (BOOL)isAssetURL
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "compare:options:", CFSTR("assets-library"), 1) == 0;

  return v2;
}

- (uint64_t)loadingInUIWebViewWillLaunchAnotherApp
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLOverrideForURL:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "compare:options:", CFSTR("http"), 1)
      || (v7 = 1, !objc_msgSend(v6, "compare:options:", CFSTR("https"), 1)))
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }
  _SLLog(v1, 6, CFSTR("URL %@ overridden to %@ scheme %@ will launch another app? %d"));

  return v7;
}

@end
