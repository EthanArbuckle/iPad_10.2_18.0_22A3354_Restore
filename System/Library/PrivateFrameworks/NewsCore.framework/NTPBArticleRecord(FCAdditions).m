@implementation NTPBArticleRecord(FCAdditions)

- (id)topicIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "topics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "topics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "tagID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)generateThumbnailAssetHandleForURL:()FCAdditions withAssetManager:
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

- (id)generateFlintDocumentAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "flintDocumentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
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

- (id)generateWebExcerptAssetHandleWithAssetManager:()FCAdditions
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a1, "base");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cacheLifetimeHint");
  if (v6 == 2)
    v7 = 2;
  else
    v7 = v6 == 1;

  objc_msgSend(a1, "excerptURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "excerptURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetHandleForCKAssetURLString:lifetimeHint:", v9, v7);
  }
  else
  {
    objc_msgSend(a1, "base");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "base");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "changeTag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCExcerptURLProtocol excerptURLForArticleID:changeTag:](FCExcerptURLProtocol, "excerptURLForArticleID:changeTag:", v11, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "assetHandleForURL:lifetimeHint:", v9, v7);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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

- (id)narrativeTrackFullIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "narrativeTrackFullURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-narration-full-%@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)narrativeTrackSampleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "narrativeTrackSampleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-narration-sample-%@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
