@implementation HMHome(HMUAdditions)

- (id)hmu_allUsersIncludingCurrentUser
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "users");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hmu_userWithUniqueIdentifier:()HMUAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__HMHome_HMUAdditions__hmu_userWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_24D219878;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmu_userWithUniqueIdentifierUUIDString:()HMUAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1880];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  if (v6)
  {
    objc_msgSend(a1, "hmu_userWithUniqueIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)hmu_isRemoteAccessAllowedForCurrentUser
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hmu_isRemoteAccessAllowedForUser:", v2);

  return v3;
}

- (uint64_t)hmu_isCurrentUserAdministrator
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hmu_isAdministrator:", v2);

  return v3;
}

- (uint64_t)hmu_isCurrentUserOwner
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hmu_isOwner:", v2);

  return v3;
}

- (uint64_t)hmu_isRemoteAccessAllowedForUser:()HMUAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "homeAccessControlForUser:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isRemoteAccessAllowed");

  return v2;
}

- (uint64_t)hmu_isAdministrator:()HMUAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "homeAccessControlForUser:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isAdministrator");

  return v2;
}

- (uint64_t)hmu_isOwner:()HMUAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "homeAccessControlForUser:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isOwner");

  return v2;
}

- (id)hmu_userWithSenderCorrelationIdentifier:()HMUAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__HMHome_HMUAdditions__hmu_userWithSenderCorrelationIdentifier___block_invoke;
  v9[3] = &unk_24D219878;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)hmu_homesFromHomes:()HMUAdditions withRoomNames:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  int v17;
  id v19;
  id obj;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v21 = (id)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v10, "rooms", v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v24 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "name");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v6, "containsObject:", v16);

                if (v17)
                {
                  objc_msgSend(v21, "addObject:", v10);
                  goto LABEL_17;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v13)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }

    v5 = v19;
  }
  else
  {
    v21 = (id)MEMORY[0x24BDBD1A8];
  }

  return v21;
}

+ (id)hmu_homesFromHomes:()HMUAdditions withZoneNames:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  int v17;
  id v19;
  id obj;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v21 = (id)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v10, "zones", v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v24 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "name");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v6, "containsObject:", v16);

                if (v17)
                {
                  objc_msgSend(v21, "addObject:", v10);
                  goto LABEL_17;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v13)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }

    v5 = v19;
  }
  else
  {
    v21 = (id)MEMORY[0x24BDBD1A8];
  }

  return v21;
}

+ (id)hmu_homesFromHomes:()HMUAdditions withHomeLocationStatus:
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__HMHome_HMUAdditions__hmu_homesFromHomes_withHomeLocationStatus___block_invoke;
  v5[3] = &__block_descriptor_40_e16_B16__0__HMHome_8l;
  v5[4] = a4;
  objc_msgSend(a3, "na_filter:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hmu_allRoomsIncludingRoomForEntireHome
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "rooms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "roomForEntireHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hmu_roomWithUniqueIdentifier:()HMUAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "rooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__HMHome_HMUAdditions__hmu_roomWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_24D219808;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmu_roomsWithUniqueIdentifiers:()HMUAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "rooms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __55__HMHome_HMUAdditions__hmu_roomsWithUniqueIdentifiers___block_invoke;
    v9[3] = &unk_24D219808;
    v10 = v5;
    objc_msgSend(v6, "na_filter:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

- (id)hmu_roomWithName:()HMUAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "rooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__HMHome_HMUAdditions__hmu_roomWithName___block_invoke;
  v9[3] = &unk_24D219808;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmu_zoneWithUniqueIdentifier:()HMUAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "zones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__HMHome_HMUAdditions__hmu_zoneWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_24D219830;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmu_zonesWithUniqueIdentifiers:()HMUAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "zones");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __55__HMHome_HMUAdditions__hmu_zonesWithUniqueIdentifiers___block_invoke;
    v9[3] = &unk_24D219830;
    v10 = v5;
    objc_msgSend(v6, "na_filter:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

- (id)hmu_zoneWithName:()HMUAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "zones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__HMHome_HMUAdditions__hmu_zoneWithName___block_invoke;
  v9[3] = &unk_24D219830;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmu_accessoryWithUniqueIdentifierUUIDString:()HMUAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1880];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  if (v6)
  {
    objc_msgSend(a1, "accessoryWithUniqueIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)hmu_homePodsDictionary
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "hmu_isHomePod") && (objc_msgSend(v8, "isCurrentAccessory") & 1) == 0)
        {
          objc_msgSend(v8, "uniqueIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v8, v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)hmu_homePodsIncludingCurrentAccessoryDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(a1, "hmu_homePodsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "hmu_isHomePod"))
        {
          objc_msgSend(v10, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v10, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)hmu_endpointAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
