@implementation NTPBAVAssetKey(Conformance)

- (id)creationDate
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "createdAt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)expirationDate
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "expiresAt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isExpired
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;
  objc_msgSend(a1, "expiresAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v4 >= v6;

  return v7;
}

- (FCContentArchive)contentArchive
{
  return +[FCContentArchive archiveWithAVAssetKey:](FCContentArchive, "archiveWithAVAssetKey:", a1);
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
  v5 = -[FCContentManifest initWithAVAssetKeyIDs:](v2, "initWithAVAssetKeyIDs:", v4);

  return v5;
}

@end
