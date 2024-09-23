@implementation HMHome(MediaSetup)

- (BOOL)hasAccessoryTypeHomePod
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(a1, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__HMHome_MediaSetup__hasAccessoryTypeHomePod__block_invoke;
  v6[3] = &unk_24DBD53A8;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (uint64_t)isCurrentUserHomeOwner
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

- (uint64_t)isCurrentUserRestrictedGuest
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeAccessControlForUser:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRestrictedGuest");

  return v4;
}

- (uint64_t)isUpdatedForBolt
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "isHomePod") && !objc_msgSend(v6, "supportsThirdPartyMusic"))
        {
          v7 = 0;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_12:

  return v7;
}

- (uint64_t)userIdentifierBelongsToCurrentUser:()MediaSetup
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  return v7;
}

- (BOOL)userIdentifierBelongsInHome:()MediaSetup
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "allUsers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmf_firstObjectWithUniqueIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 != 0;
  }
  else
  {
    _MSLogingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HMHome(MediaSetup) userIdentifierBelongsInHome:].cold.1(v8);

    v7 = 0;
  }

  return v7;
}

- (uint64_t)allUsers
{
  return 0;
}

- (id)userWithIdentifier:()MediaSetup
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "allUsers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_firstObjectWithUniqueIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)allUsersIdentifiers
{
  return 0;
}

- (uint64_t)allUsersExcludingHomeOwner
{
  return 0;
}

- (uint64_t)allUsersIdentifiersExcludingOwner
{
  return 0;
}

- (void)userIdentifierBelongsInHome:()MediaSetup .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[HMHome(MediaSetup) userIdentifierBelongsInHome:]";
  _os_log_error_impl(&dword_219CD8000, log, OS_LOG_TYPE_ERROR, "%s NIL userIdentifier passed", (uint8_t *)&v1, 0xCu);
}

@end
