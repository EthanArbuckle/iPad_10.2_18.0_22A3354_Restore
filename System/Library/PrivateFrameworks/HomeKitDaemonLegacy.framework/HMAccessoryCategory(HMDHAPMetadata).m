@implementation HMAccessoryCategory(HMDHAPMetadata)

+ (id)categoryIdentifierForCategory:()HMDHAPMetadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "categoryForType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "categoryForOther");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)categoryWithIdentifier:()HMDHAPMetadata
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v5 = (void *)objc_msgSend(v4, "initWithUUIDString:", *MEMORY[0x1E0CB7AD0]);
  v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "categoryForType:", *MEMORY[0x1E0CB7AC8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "categoryForType:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryForOther");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = objc_alloc(MEMORY[0x1E0CBA1D8]);
  objc_msgSend(v3, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "catDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithType:name:", v13, v14);

  objc_msgSend(MEMORY[0x1E0CBA4E0], "cachedInstanceForHMAccessoryCategory:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)categoryWithCategoryIdentifier:()HMDHAPMetadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "categoryForOther");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_alloc(MEMORY[0x1E0CBA1D8]);
  objc_msgSend(v5, "uuidStr");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "catDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithType:name:", v8, v9);

  objc_msgSend(MEMORY[0x1E0CBA4E0], "cachedInstanceForHMAccessoryCategory:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)categoryForProductInfo:()HMDHAPMetadata
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "productClass");
  return objc_msgSend(MEMORY[0x1E0CBA1D8], "categoryForProductClass:", v3);
}

+ (id)categoryForProductClass:()HMDHAPMetadata
{
  void *v3;
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  if (a3 == 6)
  {
    v3 = (void *)MEMORY[0x1E0CBA1D8];
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v5 = (_QWORD *)MEMORY[0x1E0CB7A58];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CBA1D8];
    if (a3 == 4)
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v5 = (_QWORD *)MEMORY[0x1E0CB7A18];
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v5 = (_QWORD *)MEMORY[0x1E0CB7AA8];
    }
  }
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", *v5);
  objc_msgSend(v3, "categoryWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
