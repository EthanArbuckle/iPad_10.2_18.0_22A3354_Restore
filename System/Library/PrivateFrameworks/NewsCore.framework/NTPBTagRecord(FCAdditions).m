@implementation NTPBTagRecord(FCAdditions)

- (id)generateNameImageMaskAssetHandleForURL:()FCAdditions withAssetManager:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetManager");
    *(_DWORD *)buf = 136315906;
    v15 = "-[NTPBTagRecord(FCAdditions) generateNameImageMaskAssetHandleForURL:withAssetManager:]";
    v16 = 2080;
    v17 = "NTPBTagRecord+FCAdditions.m";
    v18 = 1024;
    v19 = 41;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_4;
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (!v6)
    goto LABEL_9;
LABEL_4:
  objc_msgSend(a1, "base");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cacheLifetimeHint");
  if (v9 == 2)
    v10 = 2;
  else
    v10 = v9 == 1;
  objc_msgSend(v7, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v11;
}

- (id)generateNavigationChromeBackgroundImageLargeAssetHandleForURLString:()FCAdditions withAssetManager:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "base");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cacheLifetimeHint");
    if (v9 == 2)
      v10 = 2;
    else
      v10 = v9 == 1;
    objc_msgSend(v6, "assetHandleForCKAssetURLString:lifetimeHint:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateNavigationChromeBackgroundImageCompactAssetHandleForURLString:()FCAdditions withAssetManager:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "base");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cacheLifetimeHint");
    if (v9 == 2)
      v10 = 2;
    else
      v10 = v9 == 1;
    objc_msgSend(v6, "assetHandleForCKAssetURLString:lifetimeHint:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateNavigationChromeBackgroundImageAssetHandleForURLString:()FCAdditions withAssetManager:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "base");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cacheLifetimeHint");
    if (v9 == 2)
      v10 = 2;
    else
      v10 = v9 == 1;
    objc_msgSend(v6, "assetHandleForCKAssetURLString:lifetimeHint:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateNameImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "nameImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "nameImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateLogoImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "logoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "logoURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNameImageForDarkBackgroundAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "nameImageForDarkBackgroundURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "nameImageForDarkBackgroundURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNameImageCompactAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "nameImageCompactURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "nameImageCompactURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateFeedNavImageHQAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "feedNavImageHQURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "feedNavImageHQURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateFeedNavImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "feedNavImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "feedNavImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateCoverImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "coverImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "coverImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoImageLargeAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "sportsLogoImageLargeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "sportsLogoImageLargeURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoImageCompactAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "sportsLogoImageCompactURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "sportsLogoImageCompactURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "sportsLogoImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "sportsLogoImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoAltImageLargeAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "sportsLogoAltImageLargeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "sportsLogoAltImageLargeURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoAltImageCompactAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "sportsLogoAltImageCompactURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "sportsLogoAltImageCompactURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoAltImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "sportsLogoAltImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "sportsLogoAltImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cacheLifetimeHint");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNameImageLargeMaskAssetHandleForURLString:()FCAdditions withAssetManager:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "base");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cacheLifetimeHint");
    if (v9 == 2)
      v10 = 2;
    else
      v10 = v9 == 1;
    objc_msgSend(v6, "assetHandleForCKAssetURLString:lifetimeHint:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateNameImageLargeAssetHandleForURLString:()FCAdditions withAssetManager:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "base");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cacheLifetimeHint");
    if (v9 == 2)
      v10 = 2;
    else
      v10 = v9 == 1;
    objc_msgSend(v6, "assetHandleForCKAssetURLString:lifetimeHint:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateCoverImageAssetHandleForURLString:()FCAdditions withAssetManager:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "base");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cacheLifetimeHint");
    if (v9 == 2)
      v10 = 2;
    else
      v10 = v9 == 1;
    objc_msgSend(v6, "assetHandleForCKAssetURLString:lifetimeHint:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
