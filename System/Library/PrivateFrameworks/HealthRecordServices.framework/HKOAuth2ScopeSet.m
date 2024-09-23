@implementation HKOAuth2ScopeSet

- (HKOAuth2ScopeSet)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKOAuth2ScopeSet)initWithOriginalScopes:(id)a3 readableResourceTypes:(id)a4 writableResourceTypes:(id)a5 canReadAllResourceTypes:(BOOL)a6 canWriteAllResourceTypes:(BOOL)a7 hasAtLeastOneResourceTypeScope:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  HKOAuth2ScopeSet *v17;
  uint64_t v18;
  NSSet *originalScopes;
  uint64_t v20;
  NSSet *readableResourceTypes;
  uint64_t v22;
  NSSet *writableResourceTypes;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HKOAuth2ScopeSet;
  v17 = -[HKOAuth2ScopeSet init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    originalScopes = v17->_originalScopes;
    v17->_originalScopes = (NSSet *)v18;

    v20 = objc_msgSend(v15, "copy");
    readableResourceTypes = v17->_readableResourceTypes;
    v17->_readableResourceTypes = (NSSet *)v20;

    v22 = objc_msgSend(v16, "copy");
    writableResourceTypes = v17->_writableResourceTypes;
    v17->_writableResourceTypes = (NSSet *)v22;

    v17->_canReadAllResourceTypes = a6;
    v17->_canWriteAllResourceTypes = a7;
    v17->_hasAtLeastOneResourceTypeScope = a8;
  }

  return v17;
}

+ (id)scopeSetWithScopes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  char v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  id v27;
  char v28;
  id v30;
  id v31;
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v30 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v27 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v5)
  {
    v6 = v5;
    v32 = 0;
    v28 = 0;
    v7 = *(_QWORD *)v34;
    v31 = v4;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("/"), v27);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v10, "count") >= 2)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("patient")) & 1) == 0
            && !objc_msgSend(v11, "isEqualToString:", CFSTR("user")))
          {
            goto LABEL_38;
          }
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v13, "count") <= 1)
          {
            _HKInitializeLogging();
            v14 = *MEMORY[0x24BDD2FF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v38 = a1;
              v39 = 2114;
              v40 = v9;
              _os_log_impl(&dword_2163C4000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid scope detected: %{public}@", buf, 0x16u);
            }
LABEL_37:

LABEL_38:
            goto LABEL_39;
          }
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", CFSTR("*"));
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("*")))
          {
            if ((v17 & 1) != 0)
            {
              v18 = 1;
              v19 = 1;
              goto LABEL_18;
            }
            objc_msgSend(v30, "addObject:", v15);
LABEL_34:
            v20 = v27;
LABEL_35:
            objc_msgSend(v20, "addObject:", v15);
            v18 = 1;
            v19 = HIDWORD(v32);
            goto LABEL_36;
          }
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("read")))
          {
            v20 = v30;
            if ((v17 & 1) == 0)
              goto LABEL_35;
            v18 = 1;
            v19 = HIDWORD(v32);
LABEL_18:
            v28 = 1;
LABEL_36:
            v32 = __PAIR64__(v19, v18);

            v4 = v31;
            goto LABEL_37;
          }
          if (!objc_msgSend(v16, "isEqualToString:", CFSTR("write")))
          {
            if ((objc_msgSend(v16, "containsString:", CFSTR("r")) & 1) != 0)
            {
              if ((v17 & 1) != 0)
              {
                v21 = objc_msgSend(v16, "containsString:", CFSTR("c"));
                v28 = 1;
                LODWORD(v32) = 1;
                v18 = 1;
                v19 = 1;
                if ((v21 & 1) != 0)
                  goto LABEL_36;
                goto LABEL_32;
              }
LABEL_27:
              objc_msgSend(v30, "addObject:", v15);
              v23 = 1;
            }
            else
            {
              v22 = objc_msgSend(v16, "containsString:", CFSTR("s"));
              if (((v22 ^ 1 | v17) & 1) == 0)
                goto LABEL_27;
              v23 = v22 | v32;
              v28 |= v22;
            }
            if ((objc_msgSend(v16, "containsString:", CFSTR("c")) & 1) == 0)
            {
              LODWORD(v32) = v23;
LABEL_32:
              v24 = objc_msgSend(v16, "containsString:", CFSTR("w"));
              if (((v24 ^ 1 | v17) & 1) == 0)
                goto LABEL_34;
              v18 = v24 | v32;
              v19 = v24 | HIDWORD(v32);
              goto LABEL_36;
            }
          }
          if ((v17 & 1) == 0)
            goto LABEL_34;
          v18 = 1;
          v19 = 1;
          goto LABEL_36;
        }
LABEL_39:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (!v6)
        goto LABEL_43;
    }
  }
  v32 = 0;
  v28 = 0;
LABEL_43:

  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOriginalScopes:readableResourceTypes:writableResourceTypes:canReadAllResourceTypes:canWriteAllResourceTypes:hasAtLeastOneResourceTypeScope:", v4, v30, v27, v28 & 1, BYTE4(v32) & 1, v32 & 1);
  return v25;
}

+ (id)scopeSetWithScopeString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "scopesFromScopeString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scopeSetWithScopes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canReadResourceType:(id)a3
{
  return self->_canReadAllResourceTypes || -[NSSet containsObject:](self->_readableResourceTypes, "containsObject:", a3);
}

- (BOOL)canWriteResourceType:(id)a3
{
  return self->_canWriteAllResourceTypes
      || -[NSSet containsObject:](self->_writableResourceTypes, "containsObject:", a3);
}

- (BOOL)hasClinicalSharingScopes
{
  _BOOL4 v3;

  v3 = -[HKOAuth2ScopeSet canReadResourceType:](self, "canReadResourceType:", CFSTR("DocumentReference"));
  if (v3)
    LOBYTE(v3) = -[HKOAuth2ScopeSet canWriteResourceType:](self, "canWriteResourceType:", CFSTR("DocumentReference"));
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NSSet allObjects](self->_originalScopes, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; scopes: \"%@\">"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isMissingScopesFrom:(id)a3
{
  void *v4;
  unint64_t v5;

  +[HKOAuth2ScopeSet scopeSetWithScopes:](HKOAuth2ScopeSet, "scopeSetWithScopes:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKOAuth2ScopeSet compareTo:](self, "compareTo:", v4);

  return v5 > 1;
}

- (unint64_t)compareTo:(id)a3
{
  return +[HKOAuth2ScopeSet compare:to:](HKOAuth2ScopeSet, "compare:to:", self, a3);
}

+ (unint64_t)compare:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "_readCompare:to:", v7, v6);
  v9 = objc_msgSend(a1, "_writeCompare:to:", v7, v6);

  switch(v8)
  {
    case 3:
      return 3;
    case 2:
      if (v9 < 4)
      {
        v10 = &unk_2164035B0;
        return v10[v9];
      }
      return 3;
    case 1:
      if (v9 < 4)
      {
        v10 = &unk_216403590;
        return v10[v9];
      }
      return 3;
  }
  return v9;
}

+ (unint64_t)_readCompare:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  unint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "canReadAllResourceTypes");
  v9 = objc_msgSend(v7, "canReadAllResourceTypes");
  v10 = v9 ^ 1;
  if (((v8 ^ 1) & 1) != 0 || v10)
  {
    if ((v8 ^ 1 | v9) == 1)
    {
      if ((v8 | v10) == 1)
        v11 = objc_msgSend(a1, "_nonWildcardReadCompare:to:", v6, v7);
      else
        v11 = 2;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (unint64_t)_writeCompare:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  unint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "canWriteAllResourceTypes");
  v9 = objc_msgSend(v7, "canWriteAllResourceTypes");
  v10 = v9 ^ 1;
  if (((v8 ^ 1) & 1) != 0 || v10)
  {
    if ((v8 ^ 1 | v9) == 1)
    {
      if ((v8 | v10) == 1)
        v11 = objc_msgSend(a1, "_nonWildcardWriteCompare:to:", v6, v7);
      else
        v11 = 2;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (unint64_t)_nonWildcardReadCompare:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "readableResourceTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readableResourceTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_minus:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v6, "readableResourceTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "readableResourceTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "hk_minus:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!(v10 | v14))
    return 0;
  if (!v10 && v14)
    return 1;
  if (v14)
    v16 = 1;
  else
    v16 = v10 == 0;
  if (v16)
    return 3;
  else
    return 2;
}

+ (unint64_t)_nonWildcardWriteCompare:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "writableResourceTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writableResourceTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_minus:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v6, "writableResourceTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "writableResourceTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "hk_minus:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!(v10 | v14))
    return 0;
  if (!v10 && v14)
    return 1;
  if (v14)
    v16 = 1;
  else
    v16 = v10 == 0;
  if (v16)
    return 3;
  else
    return 2;
}

+ (id)scopesFromScopeString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hk_filter:", &__block_literal_global_12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __42__HKOAuth2ScopeSet_scopesFromScopeString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

- (NSSet)originalScopes
{
  return self->_originalScopes;
}

- (NSSet)readableResourceTypes
{
  return self->_readableResourceTypes;
}

- (NSSet)writableResourceTypes
{
  return self->_writableResourceTypes;
}

- (BOOL)canReadAllResourceTypes
{
  return self->_canReadAllResourceTypes;
}

- (BOOL)canWriteAllResourceTypes
{
  return self->_canWriteAllResourceTypes;
}

- (BOOL)hasAtLeastOneResourceTypeScope
{
  return self->_hasAtLeastOneResourceTypeScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writableResourceTypes, 0);
  objc_storeStrong((id *)&self->_readableResourceTypes, 0);
  objc_storeStrong((id *)&self->_originalScopes, 0);
}

@end
