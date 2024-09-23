@implementation CRKIDSAccountsState

+ (id)stateForAccounts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "isActive", (_QWORD)v21);
        objc_msgSend(v12, "loginID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v15 = v5;
        else
          v15 = v6;
        objc_msgSend(v15, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v16 = objc_alloc((Class)a1);
  v17 = (void *)objc_msgSend(v5, "copy");
  v18 = (void *)objc_msgSend(v6, "copy");
  v19 = (void *)objc_msgSend(v16, "initWithActiveLoginIDs:inactiveLoginIDs:", v17, v18);

  return v19;
}

- (CRKIDSAccountsState)init
{
  void *v3;
  void *v4;
  CRKIDSAccountsState *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[CRKIDSAccountsState initWithActiveLoginIDs:inactiveLoginIDs:](self, "initWithActiveLoginIDs:inactiveLoginIDs:", v3, v4);

  return v5;
}

- (CRKIDSAccountsState)initWithActiveLoginIDs:(id)a3 inactiveLoginIDs:(id)a4
{
  id v6;
  id v7;
  CRKIDSAccountsState *v8;
  uint64_t v9;
  NSSet *activeLoginIDs;
  uint64_t v11;
  NSSet *inactiveLoginIDs;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKIDSAccountsState;
  v8 = -[CRKIDSAccountsState init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    activeLoginIDs = v8->_activeLoginIDs;
    v8->_activeLoginIDs = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    inactiveLoginIDs = v8->_inactiveLoginIDs;
    v8->_inactiveLoginIDs = (NSSet *)v11;

  }
  return v8;
}

- (unint64_t)summary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[CRKIDSAccountsState activeLoginIDs](self, "activeLoginIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

  }
  else
  {
    -[CRKIDSAccountsState inactiveLoginIDs](self, "inactiveLoginIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      return 0;
  }
  -[CRKIDSAccountsState activeLoginIDs](self, "activeLoginIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    return 2;
  else
    return 1;
}

- (NSDictionary)debugInfo
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("summary");
  v3 = -[CRKIDSAccountsState summary](self, "summary");
  if (v3 > 2)
    v4 = CFSTR("UNKNOWN-ThisIsABug");
  else
    v4 = off_24D9CA220[v3];
  v10[0] = v4;
  v9[1] = CFSTR("activeLoginIDs");
  -[CRKIDSAccountsState activeLoginIDs](self, "activeLoginIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("inactiveLoginIDs");
  -[CRKIDSAccountsState inactiveLoginIDs](self, "inactiveLoginIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKIDSAccountsState *v8;
  CRKIDSAccountsState *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKIDSAccountsState *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(CFSTR("activeLoginIDs, inactiveLoginIDs"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_17;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKIDSAccountsState *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKIDSAccountsState isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v17 = v9;
          -[CRKIDSAccountsState valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKIDSAccountsState valueForKey:](v17, "valueForKey:", v16);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[CRKIDSAccountsState summary](self, "summary");
  if (v5 > 2)
    v6 = CFSTR("UNKNOWN-ThisIsABug");
  else
    v6 = off_24D9CA220[v5];
  -[CRKIDSAccountsState activeLoginIDs](self, "activeLoginIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "crk_stableDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKIDSAccountsState inactiveLoginIDs](self, "inactiveLoginIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "crk_stableDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { summary = %@, activeLoginIDs = %@, inactiveLoginIDs = %@ }>"), v4, self, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSSet)activeLoginIDs
{
  return self->_activeLoginIDs;
}

- (NSSet)inactiveLoginIDs
{
  return self->_inactiveLoginIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveLoginIDs, 0);
  objc_storeStrong((id *)&self->_activeLoginIDs, 0);
}

@end
