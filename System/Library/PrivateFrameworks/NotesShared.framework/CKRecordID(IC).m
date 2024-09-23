@implementation CKRecordID(IC)

- (id)ic_loggingDescriptionIncludingBrackets:()IC
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    objc_msgSend(v5, "appendString:", CFSTR("<"));
  objc_msgSend(a1, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  objc_msgSend(a1, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ownerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C94730]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(a1, "zoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ownerName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v12);

  }
  if (a3)
    objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (uint64_t)ic_loggingDescription
{
  return objc_msgSend(a1, "ic_loggingDescriptionIncludingBrackets:", 1);
}

- (uint64_t)databaseScope
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "zoneID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "databaseScope");

  return v2;
}

- (uint64_t)ic_isOwnedByCurrentUser
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "zoneID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ic_isOwnedByCurrentUser");

  return v2;
}

- (uint64_t)ic_hasEqualRecordNameWithRecordID:()IC
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "ic_isCaseInsensitiveEqualToString:", v6);
  return v7;
}

@end
