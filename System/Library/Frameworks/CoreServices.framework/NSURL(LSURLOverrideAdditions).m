@implementation NSURL(LSURLOverrideAdditions)

- (BOOL)conformsToOverridePatternWithKey:()LSURLOverrideAdditions
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  LaunchServices::URLOverrides *v10;
  LaunchServices::URLOverrides *v11;
  void *v12;
  uint64_t v13;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", CFSTR("/var/mobile/Library/Caches/com.apple.itunesstored/url-resolution.plist"));
      v8 = v7;
      if (v7 && (objc_msgSend(v7, "objectForKey:", v4), (v9 = objc_claimAutoreleasedReturnValue()) != 0)
        || (v10 = (LaunchServices::URLOverrides *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/iTunesStoreURLPatterns.plist")), (v11 = v10) != 0)&& (-[LaunchServices::URLOverrides objectForKey:](v10, "objectForKey:", v4), v9 = objc_claimAutoreleasedReturnValue(), v11, v9))
      {
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v9, 1, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v12, "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL
          || v13 != 0;

      }
      else
      {
        LaunchServices::URLOverrides::getLog(v10);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138477827;
          v17 = v4;
          _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "No URL pattern found for key %{private}@", (uint8_t *)&v16, 0xCu);
        }
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)isiWorkURL
{
  BOOL v1;
  void *v2;
  _BOOL8 v3;
  id v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  char v8;

  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v5, a1, 1);
  if (v6 | v7)
    v1 = v8 == 0;
  else
    v1 = 1;
  if (v1 || !LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&v5, CFSTR("/iw")))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v5, "fragment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2 != 0;

  }
  return v3;
}

- (id)iWorkApplicationName
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;

  if (objc_msgSend(a1, "isiWorkURL"))
  {
    objc_msgSend(a1, "fragment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("/"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v3, "count"))
    {
      v6 = 0;
LABEL_15:

      return v6;
    }
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("pages")) & 1) != 0)
    {
      v5 = CFSTR("com.apple.Pages");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("keynote")) & 1) != 0)
    {
      v5 = CFSTR("com.apple.Keynote");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("numbers")))
        goto LABEL_13;
      v5 = CFSTR("com.apple.Numbers");
    }
    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "applicationIsInstalled:", v5);

    if ((v8 & 1) != 0)
    {
      +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedName");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v6 = (void *)v10;

      goto LABEL_15;
    }
LABEL_13:
    objc_msgSend(v3, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "capitalizedString");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v6 = 0;
  return v6;
}

- (__CFString)iWorkDocumentName
{
  void *v2;
  void *v3;
  const __CFString *v4;
  __CFString *v5;

  if (objc_msgSend(a1, "isiWorkURL"))
  {
    objc_msgSend(a1, "fragment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("/"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v3, "count") < 3)
    {
      v5 = 0;
    }
    else
    {
      v4 = (const __CFString *)objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "count") - 1);
      v5 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, &stru_1E10473A0);
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)mapsURL
{
  return 0;
}

- (id)fmfURL
{
  void *v1;
  id v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v3, a1, 1);
  if (v4 | v5 && (_os_feature_enabled_impl() & 1) == 0)
  {
    +[_LSURLOverride fmfURL:](_LSURLOverride, "fmfURL:", &v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (id)fmipURL
{
  void *v1;
  id v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v3, a1, 1);
  if (v4 | v5 && (_os_feature_enabled_impl() & 1) == 0)
  {
    +[_LSURLOverride fmipURL:](_LSURLOverride, "fmipURL:", &v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (id)iTunesStoreURL
{
  void *v1;
  id v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v3, a1, 1);
  if (v4 | v5 && (_os_feature_enabled_impl() & 1) == 0)
  {
    +[_LSURLOverride iTunesStoreURL:](_LSURLOverride, "iTunesStoreURL:", &v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (id)iCloudEmailPrefsURL
{
  void *v1;
  id v3[2];

  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)v3, a1, 1);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    +[_LSURLOverride iCloudEmailPrefsURL:](_LSURLOverride, "iCloudEmailPrefsURL:", v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (uint64_t)photosURL
{
  return 0;
}

- (id)keynoteLiveURL
{
  void *v1;
  id v3[2];

  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)v3, a1, 1);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    +[_LSURLOverride keynoteLiveURL:](_LSURLOverride, "keynoteLiveURL:", v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)keynoteLiveURL_noFragment
{
  void *v1;
  id v3[2];

  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)v3, a1, 1);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    +[_LSURLOverride keynoteLiveURL_noFragment:](_LSURLOverride, "keynoteLiveURL_noFragment:", v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (uint64_t)iCloudSharingURL
{
  return 0;
}

- (uint64_t)iCloudSharingURL_noFragment
{
  return 0;
}

@end
