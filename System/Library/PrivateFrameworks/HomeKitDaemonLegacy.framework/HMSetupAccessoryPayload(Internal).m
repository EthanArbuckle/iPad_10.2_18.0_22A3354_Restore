@implementation HMSetupAccessoryPayload(Internal)

- (id)flagsDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isPaired"))
    objc_msgSend(v2, "appendString:", CFSTR("Paired  "));
  if (objc_msgSend(a1, "supportsIP"))
    objc_msgSend(v2, "appendString:", CFSTR("IP  "));
  if (objc_msgSend(a1, "supportsWAC"))
    objc_msgSend(v2, "appendString:", CFSTR("WAC  "));
  if (objc_msgSend(a1, "supportsBTLE"))
    objc_msgSend(v2, "appendString:", CFSTR("BTLE  "));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)debugDescription
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = isInternalBuild();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "accessoryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "setupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setupCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "flagsDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "categoryNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Accessory Setup payload: Name: %@, SetupID: %@, SetupCode: %@, Flags: %@, Category: %@"), v4, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "flagsDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Accessory Setup payload: Name: %@, Flags: %@"), v4, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
