@implementation NTPBPuzzleTypeRecord(FCAdditions)

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

- (id)generateNameImageMaskAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "nameImageMaskURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "nameImageMaskURL");
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

- (id)generateExploreTileImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "exploreTileImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "exploreTileImageURL");
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

- (id)generateNavigationChromeBackgroundImageHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "navigationChromeBackgroundImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "navigationChromeBackgroundImageURL");
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

- (id)generateNavigationChromeBackgroundImageCompactHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "navigationChromeBackgroundImageCompactURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "navigationChromeBackgroundImageCompactURL");
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

- (id)generateNavigationChromeBackgroundImageLargeHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "navigationChromeBackgroundImageLargeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "navigationChromeBackgroundImageLargeURL");
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

- (id)generateNavigationChromeBackgroundDarkModeImageHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "navigationChromeBackgroundDarkModeImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "navigationChromeBackgroundDarkModeImageURL");
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

- (id)generateNavigationChromeBackgroundDarkModeImageCompactHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "navigationChromeBackgroundDarkModeImageCompactURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "navigationChromeBackgroundDarkModeImageCompactURL");
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

- (id)generateNavigationChromeBackgroundDarkModeImageLargeHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "navigationChromeBackgroundDarkModeImageLargeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "navigationChromeBackgroundDarkModeImageLargeURL");
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

- (id)generateThumbnailImageAssetHandleForDate:()FCAdditions assetManager:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "imagesResourceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[FCPuzzleThumbnailURLProtocol URLForResourceMapID:publishDate:](FCPuzzleThumbnailURLProtocol, "URLForResourceMapID:publishDate:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "cacheLifetimeHint");
    if (v11 == 2)
      v12 = 2;
    else
      v12 = v11 == 1;
    objc_msgSend(v7, "assetHandleForURL:lifetimeHint:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
