@implementation MFAuthScheme

+ (void)initialize
{
  uint64_t v3;
  Class v4;

  if (!_schemesByName)
  {
    v3 = 0;
    _schemesByName = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    do
    {
      v4 = NSClassFromString(&initialize_schemes[v3]->isa);
      if (v4)
        objc_msgSend(a1, "registerSchemeClass:", v4);
      ++v3;
    }
    while (v3 != 4);
  }
}

+ (void)registerSchemeClass:(Class)a3
{
  uint64_t v3;
  id v4;

  if (a3)
  {
    v4 = (id)objc_msgSend(objc_allocWithZone(a3), "init");
    v3 = objc_msgSend(v4, "name");
    if (v3)
      objc_msgSend((id)_schemesByName, "setObject:forKey:", v4, v3);

  }
}

+ (id)knownSchemes
{
  return (id)objc_msgSend((id)_schemesByName, "allValues");
}

+ (id)schemeWithName:(id)a3
{
  return (id)objc_msgSend((id)_schemesByName, "objectForKey:", a3);
}

+ (id)authSchemesForAccount:(id)a3 connection:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFString *v10;
  const __CFString *v11;
  MFAuthScheme *v12;
  MFAuthScheme *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a4, "authenticationMechanisms");
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(const __CFString **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(CFSTR("PLAIN"), "isEqualToString:", v10))
          v11 = &stru_1E81CBE50;
        else
          v11 = v10;
        v12 = +[MFAuthScheme schemeWithName:](MFAuthScheme, "schemeWithName:", v11);
        if (v12)
        {
          v13 = v12;
          if (-[MFAuthScheme canAuthenticateAccountClass:connection:](v12, "canAuthenticateAccountClass:connection:", objc_opt_class(), a4))
          {
            if (objc_msgSend(v15, "indexOfObject:", v13) == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v15, "addObject:", v13);
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  return v15;
}

- (Class)connectionClassForAccountClass:(Class)a3
{
  return 0;
}

- (Class)authenticatorClass
{
  return 0;
}

- (unsigned)defaultPortForAccount:(id)a3
{
  return 0;
}

- (BOOL)hasEncryption
{
  return 0;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  return -[MFAuthScheme authenticatorClass](self, "authenticatorClass", a3, a4)
      || -[MFAuthScheme connectionClassForAccountClass:](self, "connectionClassForAccountClass:", a3) != 0;
}

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id result;

  result = -[MFAuthScheme authenticatorClass](self, "authenticatorClass");
  if (result)
    return (id)objc_msgSend(objc_alloc((Class)result), "initWithAuthScheme:account:connection:", self, a3, a4);
  return result;
}

- (BOOL)requiresPassword
{
  return 1;
}

- (id)name
{
  return 0;
}

- (id)humanReadableName
{
  return 0;
}

@end
