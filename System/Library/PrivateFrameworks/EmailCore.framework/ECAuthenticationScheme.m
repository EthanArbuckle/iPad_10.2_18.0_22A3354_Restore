@implementation ECAuthenticationScheme

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Class v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!_schemesByName)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(&unk_1E7135E40, "count"));
    v4 = (void *)_schemesByName;
    _schemesByName = v3;

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(&unk_1E7135E40, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(&unk_1E7135E40);
          v8 = NSClassFromString(*(NSString **)(*((_QWORD *)&v9 + 1) + 8 * v7));
          if (v8)
            objc_msgSend(a1, "registerSchemeClass:", v8);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(&unk_1E7135E40, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
  }
}

+ (id)knownSchemes
{
  return (id)objc_msgSend((id)_schemesByName, "allValues");
}

+ (void)registerSchemeClass:(Class)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    v4 = objc_alloc_init(a3);
    objc_msgSend(v4, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend((id)_schemesByName, "setObject:forKeyedSubscript:", v4, v3);

  }
}

+ (id)schemeWithName:(id)a3
{
  objc_msgSend((id)_schemesByName, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)authenticationSchemesForAccount:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "authenticationMechanisms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v14;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        +[ECAuthenticationScheme schemeWithName:](ECAuthenticationScheme, "schemeWithName:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12
          && objc_msgSend(v12, "canAuthenticateAccountClass:connection:", objc_opt_class(), v6)
          && objc_msgSend(v7, "indexOfObject:", v12) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v7, "addObject:", v12);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v7;
}

- (Class)connectionClassForAccountClass:(Class)a3
{
  return 0;
}

- (Class)authenticatorClass
{
  return 0;
}

- (BOOL)hasEncryption
{
  return 0;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  return -[ECAuthenticationScheme authenticatorClass](self, "authenticatorClass", a3, a4)
      || -[ECAuthenticationScheme connectionClassForAccountClass:](self, "connectionClassForAccountClass:", a3) != 0;
}

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[ECAuthenticationScheme authenticatorClass](self, "authenticatorClass");
  if (v8)
    v9 = (void *)objc_msgSend([v8 alloc], "initWithAuthenticationScheme:account:connection:", self, v6, v7);
  else
    v9 = 0;

  return v9;
}

- (BOOL)requiresPassword
{
  return 1;
}

- (NSString)name
{
  return 0;
}

- (NSString)humanReadableName
{
  return 0;
}

@end
