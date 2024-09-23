@implementation ANParticipant(Home)

- (id)initWithAccessory:()Home
{
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EFC8D418;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "populateWithAccessory:", v4);

  return v6;
}

- (id)initWithUser:()Home
{
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EFC8D418;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "populateWithUser:", v4);

  return v6;
}

- (id)initWithUser:()Home andAccessory:
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = a1;
  v11.super_class = (Class)&off_1EFC8D418;
  v8 = objc_msgSendSuper2(&v11, sel_init);
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "populateWithUser:andAccessory:", v6, v7);

  return v9;
}

- (uint64_t)populateWithAccessory:()Home
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3)
  {
    v3 = (void *)result;
    v4 = a3;
    objc_msgSend(v3, "setIsAccessory:", 1);
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHomeKitID:", v6);

    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", v7);

    v8 = objc_msgSend(v4, "hmu_isEndpoint");
    return objc_msgSend(v3, "setIsEndpoint:", v8);
  }
  return result;
}

- (void)populateWithUser:()Home
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setName:", v5);

    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setHomeKitID:", v7);

    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setHomeKitUserID:", v9);

    objc_msgSend(v4, "userIDSURI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prefixedURI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIdsID:", v11);

    objc_msgSend(v4, "userID");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setUserID:", v12);
  }
}

- (void)populateWithUser:()Home andAccessory:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(a1, "populateWithAccessory:", a4);
  if (v12)
  {
    objc_msgSend(v12, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setName:", v6);

    objc_msgSend(v12, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setHomeKitUserID:", v8);

    objc_msgSend(v12, "userIDSURI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prefixedURI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIdsID:", v10);

    objc_msgSend(v12, "userID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setUserID:", v11);

  }
}

+ (id)participantsFromUsersInHome:()Home
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[ANHomeManager shared](ANHomeManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "hmu_allUsersIncludingCurrentUser");
  else
    objc_msgSend(v3, "hmu_users");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v3, "announceAccessAllowedForUser:", v12, (_QWORD)v15))
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7E60]), "initWithUser:", v12);
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v4;
}

@end
