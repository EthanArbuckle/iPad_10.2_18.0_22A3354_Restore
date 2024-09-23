@implementation MAAsset(CSAsset)

- (id)getCSAssetOfType:()CSAsset
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(a1, "getLocalUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_compatibilityVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v9);

  if (v7)
  {
    objc_msgSend(a1, "_version");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(a1, "_version");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR(".%@"), v12);

    }
    objc_msgSend(a1, "_footprint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(a1, "_footprint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR(".%@"), v14);

    }
  }
  if (objc_msgSend(a1, "_isDownloaded"))
    v15 = 2;
  else
    v15 = 1;
  +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:assetVariant:identity:assistantLanguageCode:](CSAsset, "assetForAssetType:resourcePath:configVersion:assetProvider:assetVariant:identity:assistantLanguageCode:", a3, v6, v7, 0, v15, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_footprint
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("Footprint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_version
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0D4DEE8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_compatibilityVersion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0D4DEE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)isPremium
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("Footprint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v2 && (objc_msgSend(v2, "isEqualToString:", CFSTR("Premium")) & 1) != 0;
  return v3;
}

- (id)path
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "getLocalUrl");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)isDownloading
{
  return objc_msgSend(a1, "state") == 4;
}

- (BOOL)isCSAssetInstalled
{
  return objc_msgSend(a1, "state") == 2
      || objc_msgSend(a1, "state") == 3
      || objc_msgSend(a1, "state") == 5
      || objc_msgSend(a1, "state") == 6;
}

- (BOOL)canBePurged
{
  return objc_msgSend(a1, "state") == 2 || objc_msgSend(a1, "state") == 3 || objc_msgSend(a1, "state") == 6;
}

- (BOOL)isLatestCompareTo:()CSAsset
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  objc_msgSend(a1, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D4DEE8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D4DEE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v8 < v11)
    goto LABEL_8;
  if (v8 != v11)
  {
LABEL_7:
    v12 = 1;
    goto LABEL_9;
  }
  if (!objc_msgSend(a1, "isPremium"))
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "isPremium"))
    goto LABEL_7;
  v12 = objc_msgSend(a1, "state") == 5;
LABEL_9:

  return v12;
}

- (BOOL)_isDownloaded
{
  return (unint64_t)(objc_msgSend(a1, "state") - 5) < 2;
}

@end
