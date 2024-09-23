@implementation SFSearchResult(MobileSafariExtras)

- (id)_sf_punchoutURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;

  objc_msgSend(a1, "inlineCard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cardSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "command");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v3, "command");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "punchout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredOpenableURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (uint64_t)_sf_isMediaResult
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;

  objc_msgSend(a1, "inlineCard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cardSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "command");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (uint64_t)_sf_canOpenInBrowser
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_sf_punchoutURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safari_isHTTPFamilyURL");

  return v2;
}

@end
