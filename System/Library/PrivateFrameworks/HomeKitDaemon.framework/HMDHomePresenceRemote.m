@implementation HMDHomePresenceRemote

- (HMDHomePresenceRemote)initWithPresenceByUserId:(id)a3
{
  id v4;
  HMDHomePresenceRemote *v5;
  HMDHomePresenceRemote *v6;
  NSDictionary *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSDictionary *userPresenceMap;
  HMDHomePresenceRemote *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDHomePresenceRemote;
  v5 = -[HMDHomePresenceRemote init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    v18 = v5;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDUserPresenceRegion regionWithNumber:](HMDUserPresenceRegion, "regionWithNumber:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", v15, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    v6 = v18;
    userPresenceMap = v18->_userPresenceMap;
    v18->_userPresenceMap = v7;

  }
  return v6;
}

- (HMDHomePresenceRemote)initWithPresenceByPairingIdentity:(id)a3
{
  id v4;
  HMDHomePresenceRemote *v5;
  HMDHomePresenceRemote *v6;
  NSDictionary *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSDictionary *userPresenceMap;
  HMDHomePresenceRemote *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDHomePresenceRemote;
  v5 = -[HMDHomePresenceRemote init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    v18 = v5;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDUserPresenceRegion regionWithNumber:](HMDUserPresenceRegion, "regionWithNumber:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", v15, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    v6 = v18;
    userPresenceMap = v18->_userPresenceMap;
    v18->_userPresenceMap = v7;

  }
  return v6;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDHomePresenceRemote userPresenceMap](self, "userPresenceMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[Home-Presence-Remote: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDHomePresenceRemote userPresenceMap](self, "userPresenceMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userPresenceMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDHomePresenceRemote userPresenceMap](self, "userPresenceMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)regionForUser:(id)a3
{
  id v4;
  NSDictionary *userPresenceMap;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;

  v4 = a3;
  userPresenceMap = self->_userPresenceMap;
  objc_msgSend(v4, "pairingIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](userPresenceMap, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = self->_userPresenceMap;
    objc_msgSend(v4, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)isUserAtHome:(id)a3
{
  void *v3;
  BOOL v4;

  -[HMDHomePresenceRemote regionForUser:](self, "regionForUser:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "value") == 1;

  return v4;
}

- (BOOL)isUserNotAtHome:(id)a3
{
  void *v3;
  BOOL v4;

  -[HMDHomePresenceRemote regionForUser:](self, "regionForUser:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "value") == 2;

  return v4;
}

- (BOOL)areUsersAtHome:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          -[HMDHomePresenceRemote regionForUser:](self, "regionForUser:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v9 &= objc_msgSend(v11, "value") == 1;

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)areUsersNotAtHome:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          -[HMDHomePresenceRemote regionForUser:](self, "regionForUser:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v9 &= objc_msgSend(v11, "value") == 2;

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isNoUserAtHome
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[NSDictionary count](self->_userPresenceMap, "count"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSDictionary allValues](self->_userPresenceMap, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "value") == 2;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isAnyUserAtHome
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[NSDictionary count](self->_userPresenceMap, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[NSDictionary allValues](self->_userPresenceMap, "allValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "value") == 1)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (NSDictionary)userPresenceMap
{
  return self->_userPresenceMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPresenceMap, 0);
}

@end
