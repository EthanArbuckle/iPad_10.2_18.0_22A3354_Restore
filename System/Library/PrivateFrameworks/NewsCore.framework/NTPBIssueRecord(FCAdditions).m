@implementation NTPBIssueRecord(FCAdditions)

- (id)generateMetadataJSONAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(a1, "hasMetadataURL"))
  {
    objc_msgSend(a1, "metadataURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "cacheLifetimeHint");
    if (v7 == 2)
      v8 = 2;
    else
      v8 = v7 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)generateCoverImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(a1, "hasCoverImageURL"))
  {
    objc_msgSend(a1, "coverImageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "cacheLifetimeHint");
    if (v7 == 2)
      v8 = 2;
    else
      v8 = v7 == 1;
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)isAllowedInStorefront:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allowedStorefrontIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "blockedStorefrontIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isContentAllowedInStorefrontID:withAllowedStorefrontIDs:blockedStorefrontIDs:", v4, v6, v7);

  return v8;
}

@end
