@implementation NTPBPuzzleRecord(FCAdditions)

- (id)generateThumbnailSmallImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "thumbnailImageCompactURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "thumbnailImageCompactURL");
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

- (id)generateThumbnailLargeImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "thumbnailImageLargeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "thumbnailImageLargeURL");
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

@end
