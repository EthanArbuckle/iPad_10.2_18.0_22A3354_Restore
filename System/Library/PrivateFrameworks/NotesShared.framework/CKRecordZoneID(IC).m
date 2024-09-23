@implementation CKRecordZoneID(IC)

- (id)ic_loggingDescription
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "ownerName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C94730]);

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    objc_msgSend(a1, "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@>"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "ownerName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "zoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %@>"), v5, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (uint64_t)databaseScope
{
  void *v1;
  int v2;

  objc_msgSend(a1, "ownerName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C94730]);

  if (v2)
    return 2;
  else
    return 3;
}

- (uint64_t)ic_isOwnedByCurrentUser
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ownerName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C94730]);

  return v2;
}

@end
