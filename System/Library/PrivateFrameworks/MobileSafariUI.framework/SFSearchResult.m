@implementation SFSearchResult

- (uint64_t)_willShowNewsHeader
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (!a1)
    return 0;
  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.news")))
  {
    objc_msgSend(a1, "punchout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "urls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNewsScheme(v6))
    {
      _newsProxy();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isInstalled");

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)_usesMapsPlacecard
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  objc_msgSend(a1, "punchout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "urls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (_SFDeviceIsPad())
  {
    objc_msgSend(v3, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("maps.apple.com")))
    {
      objc_msgSend(v3, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "safari_hasPrefix:", CFSTR("/place"));

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __74__SFSearchResult_CompletionItem__completionCellBackgroundModeInTopSection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
