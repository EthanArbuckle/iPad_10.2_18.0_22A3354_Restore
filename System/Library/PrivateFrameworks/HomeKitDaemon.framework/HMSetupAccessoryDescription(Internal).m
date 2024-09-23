@implementation HMSetupAccessoryDescription(Internal)

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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v2 = isInternalBuild();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "ownershipToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setupAuthTokenUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setupAuthToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setupAccessoryPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "debugDescription");
    v16 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Accessory pending setup - Home: %@, appID: %@, uuid: %@, ownershipToken: %@, authTokenUUID: %@, authToken: %@, Payload %@"), v5, v6, v8, v9, v10, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v16;
  }
  else
  {
    objc_msgSend(a1, "setupCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ownershipToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Accessory pending setup - Home: %@, appID: %@, uuid: %@, hasSetupCode: %@, hasOwnershipToken: %@"), v5, v6, v8, v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (uint64_t)matchesAccessoryServer:()Internal
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "setupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessoryServerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "matchesSetupID:serverIdentifier:", v5, v6);

  return v7;
}

- (uint64_t)matchesSetupID:()Internal serverIdentifier:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "setupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "setupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v6;
  }
  else
  {
    objc_msgSend(a1, "accessoryServerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = 0;
      goto LABEL_6;
    }
    objc_msgSend(a1, "accessoryServerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v7;
  }
  v13 = objc_msgSend(v9, "isEqual:", v11);

LABEL_6:
  return v13;
}

@end
