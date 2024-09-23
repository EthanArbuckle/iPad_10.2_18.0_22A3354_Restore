@implementation NTPBRecordBase(FCAdditions)

- (BOOL)fc_isCachedAgeLessThan:()FCAdditions
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "fetchDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateWithPBDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_timeIntervalUntilNow");
  v7 = v6 < a2;

  return v7;
}

- (BOOL)fc_isCachedAgeGreaterThan:()FCAdditions
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "fetchDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateWithPBDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_timeIntervalUntilNow");
  v7 = v6 > a2;

  return v7;
}

- (BOOL)fc_isNewerThan:()FCAdditions
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a1, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  objc_msgSend(v4, "modificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;

  return v7 > v10 + 0.001;
}

- (FCContentManifest)contentManifest
{
  FCContentManifest *v2;
  void *v3;
  void *v4;
  FCContentManifest *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = [FCContentManifest alloc];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCContentManifest initWithRecordIDs:](v2, "initWithRecordIDs:", v4);

  return v5;
}

@end
