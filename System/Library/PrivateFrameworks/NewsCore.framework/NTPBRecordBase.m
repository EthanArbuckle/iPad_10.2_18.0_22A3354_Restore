@implementation NTPBRecordBase

- (BOOL)needsAssetURLRefresh
{
  _BOOL8 v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    objc_msgSend(a1, "assetURLsDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend((id)v1, "assetURLsDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dateWithPBDate:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fc_timeIntervalUntilNow");
      v1 = v6 >= 604800.0;

    }
    else
    {
      v1 = 1;
    }

  }
  return v1;
}

- (BOOL)hasExpiredAssetURLs
{
  _BOOL8 v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    objc_msgSend(a1, "assetURLsDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend((id)v1, "assetURLsDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dateWithPBDate:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fc_timeIntervalUntilNow");
      v1 = v6 >= 2592000.0;

    }
    else
    {
      v1 = 1;
    }

  }
  return v1;
}

@end
