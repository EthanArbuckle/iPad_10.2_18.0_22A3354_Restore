@implementation CRKPrivateIdentity

- (CRKPrivateIdentity)initWithIdentityPersistentId:(id)a3 stagedIdentityPersistentId:(id)a4 commonNamePrefix:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  CRKPrivateIdentity *v14;
  CRKPrivateIdentity *v15;
  uint64_t v16;
  NSString *commonNamePrefix;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDate *identityExpirationDate;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDate *stagedIdentityExpirationDate;
  void *v31;
  void *v32;
  objc_super v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKPrivateIdentity.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identityPersistentId"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKPrivateIdentity.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("commonNamePrefix"));

LABEL_3:
  v33.receiver = self;
  v33.super_class = (Class)CRKPrivateIdentity;
  v14 = -[CRKPrivateIdentity init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identityPersistentId, a3);
    objc_storeStrong((id *)&v15->_stagedIdentityPersistentId, a4);
    v16 = objc_msgSend(v13, "copy");
    commonNamePrefix = v15->_commonNamePrefix;
    v15->_commonNamePrefix = (NSString *)v16;

    +[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keychain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "identityWithPersistentID:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "certificate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "validityDateInterval");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "endDate");
    v23 = objc_claimAutoreleasedReturnValue();
    identityExpirationDate = v15->_identityExpirationDate;
    v15->_identityExpirationDate = (NSDate *)v23;

    if (v11)
    {
      objc_msgSend(v19, "identityWithPersistentID:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "certificate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "validityDateInterval");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endDate");
      v28 = objc_claimAutoreleasedReturnValue();
      stagedIdentityExpirationDate = v15->_stagedIdentityExpirationDate;
      v15->_stagedIdentityExpirationDate = (NSDate *)v28;

    }
  }

  return v15;
}

+ (id)freshPrivateIdentityWithCommonNamePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(a1, "commonNameWithPrefix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "makeIdentityWithCommonName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentityPersistentId:stagedIdentityPersistentId:commonNamePrefix:", v6, 0, v4);
  }
  else
  {
    _CRKLogGeneral_15();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CRKPrivateIdentity freshPrivateIdentityWithCommonNamePrefix:].cold.1(v8);

    v7 = 0;
  }

  return v7;
}

+ (id)makeIdentityWithCommonName:(id)a3
{
  id v4;
  CRKIdentityConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[CRKIdentityConfiguration initWithCommonName:]([CRKIdentityConfiguration alloc], "initWithCommonName:", v4);

  +[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keychain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "makeIdentityWithConfiguration:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "keychainGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addIdentity:toAccessGroup:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)commonNameWithPrefix:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)refreshIdentities
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("CERTIFICATE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("expire"));

  objc_msgSend(v4, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("stage"));

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) == 0)
    {
LABEL_3:
      objc_msgSend(v9, "dateByAddingTimeInterval:", -15768000.0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    -[CRKPrivateIdentity identityExpirationDate](self, "identityExpirationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingTimeInterval:", -86400.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v8 & 1) == 0)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -1.0);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = (void *)v10;
  +[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keychain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKPrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "earlierDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v9)
    {
      -[CRKPrivateIdentity identityPersistentId](self, "identityPersistentId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeItemWithPersistentID:", v18);

      -[CRKPrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKPrivateIdentity setIdentityPersistentId:](self, "setIdentityPersistentId:", v19);

      -[CRKPrivateIdentity stagedIdentityExpirationDate](self, "stagedIdentityExpirationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKPrivateIdentity setIdentityExpirationDate:](self, "setIdentityExpirationDate:", v15);

      -[CRKPrivateIdentity setStagedIdentityPersistentId:](self, "setStagedIdentityPersistentId:", 0);
      -[CRKPrivateIdentity setStagedIdentityExpirationDate:](self, "setStagedIdentityExpirationDate:", 0);
      LOBYTE(v15) = 1;
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  -[CRKPrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "earlierDate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 == v12)
    {
      v23 = (void *)objc_opt_class();
      -[CRKPrivateIdentity commonNamePrefix](self, "commonNamePrefix");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "commonNameWithPrefix:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      _CRKLogGeneral_15();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v34 = 138543362;
        v35 = v25;
        _os_log_impl(&dword_218C99000, v26, OS_LOG_TYPE_INFO, "Creating staged private identity with common name: %{public}@", (uint8_t *)&v34, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(), "makeIdentityWithCommonName:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKPrivateIdentity setStagedIdentityPersistentId:](self, "setStagedIdentityPersistentId:", v27);

      -[CRKPrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[CRKPrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identityWithPersistentID:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "certificate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "validityDateInterval");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "endDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKPrivateIdentity setStagedIdentityExpirationDate:](self, "setStagedIdentityExpirationDate:", v32);

        LOBYTE(v15) = 1;
      }

    }
  }

  return (char)v15;
}

- (CRKPrivateIdentity)initWithDictionary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CRKPrivateIdentity *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKPrivateIdentity.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PersistentId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StagedPersistentId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CommonNamePrefix"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    self = -[CRKPrivateIdentity initWithIdentityPersistentId:stagedIdentityPersistentId:commonNamePrefix:](self, "initWithIdentityPersistentId:stagedIdentityPersistentId:commonNamePrefix:", v6, v7, v9);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[CRKPrivateIdentity identityPersistentId](self, "identityPersistentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PersistentId"));

  -[CRKPrivateIdentity commonNamePrefix](self, "commonNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("CommonNamePrefix"));

  -[CRKPrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CRKPrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("StagedPersistentId"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

+ (id)keychainGroup
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKPrivateIdentity.m"), 174, CFSTR("Group name should be overwritten by Private Identity subclass"));

  return &stru_24D9CB490;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKPrivateIdentity *v8;
  CRKPrivateIdentity *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKPrivateIdentity *v17;
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
  objc_msgSend(CFSTR("identityPersistentId, stagedIdentityPersistentId, commonNamePrefix"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_18;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKPrivateIdentity *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKPrivateIdentity isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
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
          -[CRKPrivateIdentity valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKPrivateIdentity valueForKey:](v17, "valueForKey:", v16);
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

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CRKPrivateIdentity identityPersistentId](self, "identityPersistentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKPrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKPrivateIdentity commonNamePrefix](self, "commonNamePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithIdentityPersistentId:stagedIdentityPersistentId:commonNamePrefix:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKPrivateIdentity.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aCoder"));

  }
  -[CRKPrivateIdentity identityPersistentId](self, "identityPersistentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("identityPersistentId"));

  -[CRKPrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("stagedIdentityPersistentId"));

  -[CRKPrivateIdentity commonNamePrefix](self, "commonNamePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("commonNamePrefix"));

}

- (CRKPrivateIdentity)initWithCoder:(id)a3
{
  id v5;
  CRKPrivateIdentity *v6;
  void *v7;
  uint64_t v8;
  NSData *identityPersistentId;
  void *v10;
  uint64_t v11;
  NSData *stagedIdentityPersistentId;
  void *v13;
  uint64_t v14;
  NSString *commonNamePrefix;
  void *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDate *identityExpirationDate;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDate *stagedIdentityExpirationDate;
  void *v32;
  objc_super v33;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKPrivateIdentity.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aDecoder"));

  }
  v33.receiver = self;
  v33.super_class = (Class)CRKPrivateIdentity;
  v6 = -[CRKPrivateIdentity init](&v33, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("identityPersistentId"));
    v8 = objc_claimAutoreleasedReturnValue();
    identityPersistentId = v6->_identityPersistentId;
    v6->_identityPersistentId = (NSData *)v8;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("stagedIdentityPersistentId"));
    v11 = objc_claimAutoreleasedReturnValue();
    stagedIdentityPersistentId = v6->_stagedIdentityPersistentId;
    v6->_stagedIdentityPersistentId = (NSData *)v11;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("commonNamePrefix"));
    v14 = objc_claimAutoreleasedReturnValue();
    commonNamePrefix = v6->_commonNamePrefix;
    v6->_commonNamePrefix = (NSString *)v14;

    if (!v6->_commonNamePrefix)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v6->_commonNamePrefix;
      v6->_commonNamePrefix = (NSString *)v17;

    }
    +[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "keychain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6->_identityPersistentId)
    {
      objc_msgSend(v20, "identityWithPersistentID:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "certificate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "validityDateInterval");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "endDate");
      v24 = objc_claimAutoreleasedReturnValue();
      identityExpirationDate = v6->_identityExpirationDate;
      v6->_identityExpirationDate = (NSDate *)v24;

    }
    if (v6->_stagedIdentityPersistentId)
    {
      objc_msgSend(v20, "identityWithPersistentID:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "certificate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "validityDateInterval");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "endDate");
      v29 = objc_claimAutoreleasedReturnValue();
      stagedIdentityExpirationDate = v6->_stagedIdentityExpirationDate;
      v6->_stagedIdentityExpirationDate = (NSDate *)v29;

    }
  }

  return v6;
}

- (NSData)identityPersistentId
{
  return self->_identityPersistentId;
}

- (void)setIdentityPersistentId:(id)a3
{
  objc_storeStrong((id *)&self->_identityPersistentId, a3);
}

- (NSData)stagedIdentityPersistentId
{
  return self->_stagedIdentityPersistentId;
}

- (void)setStagedIdentityPersistentId:(id)a3
{
  objc_storeStrong((id *)&self->_stagedIdentityPersistentId, a3);
}

- (NSString)commonNamePrefix
{
  return self->_commonNamePrefix;
}

- (void)setCommonNamePrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)identityExpirationDate
{
  return self->_identityExpirationDate;
}

- (void)setIdentityExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_identityExpirationDate, a3);
}

- (NSDate)stagedIdentityExpirationDate
{
  return self->_stagedIdentityExpirationDate;
}

- (void)setStagedIdentityExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_stagedIdentityExpirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedIdentityExpirationDate, 0);
  objc_storeStrong((id *)&self->_identityExpirationDate, 0);
  objc_storeStrong((id *)&self->_commonNamePrefix, 0);
  objc_storeStrong((id *)&self->_stagedIdentityPersistentId, 0);
  objc_storeStrong((id *)&self->_identityPersistentId, 0);
}

+ (void)freshPrivateIdentityWithCommonNamePrefix:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "Failed to create a fresh private identity", v1, 2u);
}

@end
