@implementation IKJSRWIDependencyDomainType

- (IKJSRWIDependencyDomainType)initWithTypeDictionary:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  IKJSRWIDependencyDomainType *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __CFString *v13;
  uint64_t v14;
  NSString *name;
  void *v16;
  NSString *domainType;
  uint64_t v18;
  uint64_t v19;
  NSString *purpose;
  uint64_t v21;
  NSArray *initializationParameters;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *properties;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  IKJSRWIDependencyDomainProperty *v32;
  IKJSRWIDependencyDomainProperty *v33;
  NSDictionary *v34;
  void *v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)IKJSRWIDependencyDomainType;
  v8 = -[IKJSRWIDependencyDomainType init](&v42, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_domain, v7);
    objc_storeStrong((id *)&v8->_identifier, v9);
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "hasPrefix:", v11);
    if ((v12 & 1) != 0)
    {
      v13 = &stru_1E9F50578;
    }
    else
    {
      objc_msgSend(v7, "identifier");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "stringWithFormat:", CFSTR("RWIProtocol%@%@"), v13, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v14;

    if ((v12 & 1) == 0)
    objc_msgSend(v6, "objectForKey:", CFSTR("enum"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      domainType = v8->_domainType;
      v8->_domainType = (NSString *)CFSTR("enum");
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("type"));
      v18 = objc_claimAutoreleasedReturnValue();
      domainType = v8->_domainType;
      v8->_domainType = (NSString *)v18;
    }

    objc_msgSend(v6, "objectForKey:", CFSTR("description"));
    v19 = objc_claimAutoreleasedReturnValue();
    purpose = v8->_purpose;
    v8->_purpose = (NSString *)v19;

    if (-[NSString isEqualToString:](v8->_domainType, "isEqualToString:", CFSTR("object")))
    {
      v37 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = objc_claimAutoreleasedReturnValue();
      initializationParameters = v8->_initializationParameters;
      v8->_initializationParameters = (NSArray *)v21;

      v23 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v6, "objectForKey:", CFSTR("properties"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v25 = objc_claimAutoreleasedReturnValue();
      properties = v8->_properties;
      v8->_properties = (NSDictionary *)v25;

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v6, "objectForKey:", CFSTR("properties"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v39 != v30)
              objc_enumerationMutation(v27);
            v32 = -[IKJSRWIDependencyDomainProperty initWithPropertyDictionary:forType:]([IKJSRWIDependencyDomainProperty alloc], "initWithPropertyDictionary:forType:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v8);
            v33 = v32;
            if (v32)
            {
              if (-[IKJSRWIDependencyDomainProperty isRequired](v32, "isRequired"))
                -[NSArray addObject:](v8->_initializationParameters, "addObject:", v33);
              v34 = v8->_properties;
              -[IKJSRWIDependencyDomainProperty name](v33, "name");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary setObject:forKey:](v34, "setObject:forKey:", v33, v35);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v29);
      }

      v7 = v37;
    }

  }
  return v8;
}

- (id)initializationSelectorString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IKJSRWIDependencyDomainType initializationParameters](self, "initializationParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = objc_msgSend(v3, "length");
        objc_msgSend(v9, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
        {
          objc_msgSend(v3, "appendFormat:", CFSTR("%@:"), v11);
        }
        else
        {
          objc_msgSend(v11, "ikrwi_camelCase");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("initWith%@:"), v13);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)initializationString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IKJSRWIDependencyDomainType initializationParameters](self, "initializationParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = objc_msgSend(v3, "length");
        objc_msgSend(v9, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
        {
          objc_msgSend(v9, "methodParameterString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR(" %@:%@"), v12, v13);
        }
        else
        {
          objc_msgSend(v11, "ikrwi_camelCase");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "methodParameterString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("initWith%@:%@"), v13, v14);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isInitializerValid
{
  void *v3;
  int v4;
  void *v5;
  NSString *v6;
  Class v7;
  NSString *v8;
  char v9;

  -[IKJSRWIDependencyDomainType domainType](self, "domainType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("object"));

  if (!v4)
    return 1;
  -[IKJSRWIDependencyDomainType initializationSelectorString](self, "initializationSelectorString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[IKJSRWIDependencyDomainType name](self, "name");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = NSClassFromString(v6);
    -[IKJSRWIDependencyDomainType initializationSelectorString](self, "initializationSelectorString");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = -[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", NSSelectorFromString(v8));

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)invalidProperties
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSString *v11;
  NSString *v12;
  Class v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSRWIDependencyDomainType domainType](self, "domainType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("object"));

  if (v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[IKJSRWIDependencyDomainType properties](self, "properties", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(NSString **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[IKJSRWIDependencyDomainType name](self, "name");
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          v13 = NSClassFromString(v12);
          LOBYTE(v13) = -[objc_class instancesRespondToSelector:](v13, "instancesRespondToSelector:", NSSelectorFromString(v11));

          if ((v13 & 1) == 0)
          {
            -[IKJSRWIDependencyDomainType properties](self, "properties");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "purpose");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            if (v16)
              v18 = (const __CFString *)v16;
            else
              v18 = CFSTR("undefined");
            objc_msgSend(v3, "setObject:forKey:", v18, v11);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

  }
  return v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[IKJSRWIDependencyDomainType domainType](self, "domainType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("object"));

  if (!v6)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[IKJSRWIDependencyDomainType isInitializerValid](self, "isInitializerValid"))
  {
    -[IKJSRWIDependencyDomainType initializationSelectorString](self, "initializationSelectorString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", CFSTR("Initializer"), v8);

  }
  -[IKJSRWIDependencyDomainType invalidProperties](self, "invalidProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v9);

  if (a3 && objc_msgSend(v7, "count"))
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("IKJSRWIDependencyErrorSelectorsKey");
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("IKJSRWIDependencyErrorDomain"), 0, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)typeInterfaceString
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSRWIDependencyDomainType domainType](self, "domainType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("object"));

  if (v5)
  {
    -[IKJSRWIDependencyDomainType name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("@interface %@ (IKJSDependency)\n"), v6);

    -[IKJSRWIDependencyDomainType initializationString](self, "initializationString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v3, "appendFormat:", CFSTR("+ (instancetype)safe_%@;\n"), v7);
    objc_msgSend(v3, "appendString:", CFSTR("@end\n\n"));

  }
  return v3;
}

- (id)typeImplementationStringWithSoftLinking:(BOOL)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  IKJSRWIDependencyDomainType *v17;
  void *v18;
  BOOL v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v27;
  BOOL v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSRWIDependencyDomainType domainType](self, "domainType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("object"));

  if (v7)
  {
    -[IKJSRWIDependencyDomainType name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("@implementation %@ (IKJSDependency)\n"), v8);

    -[IKJSRWIDependencyDomainType initializationString](self, "initializationString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v28 = a3;
      objc_msgSend(v5, "appendFormat:", CFSTR("+ (instancetype)safe_%@\n{\n"), v9);
      objc_msgSend(v5, "appendString:", CFSTR("\tvoid *arguments[] = {"));
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[IKJSRWIDependencyDomainType initializationParameters](self, "initializationParameters");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            v14 = v5;
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            -[IKJSRWIDependencyDomainType initializationParameters](self, "initializationParameters");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "firstObject");
            v17 = self;
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = v18 == v15;
            self = v17;
            if (v19)
              v20 = &stru_1E9F50578;
            else
              v20 = CFSTR(", ");
            objc_msgSend(v15, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v20;
            v5 = v14;
            objc_msgSend(v14, "appendFormat:", CFSTR("%@&%@"), v27, v21);

          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v11);
      }

      objc_msgSend(v5, "appendString:", CFSTR("};\n"));
      if (v28)
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        -[IKJSRWIDependencyDomainType name](self, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("get%@Class()"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[IKJSRWIDependencyDomainType name](self, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[IKJSRWIDependencyDomainType initializationSelectorString](self, "initializationSelectorString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("\treturn [[%@ alloc] ik_initWithSelectorString:@\"%@\" arguments:arguments];\n"),
        v24,
        v25);

      objc_msgSend(v5, "appendString:", CFSTR("}\n"));
    }
    objc_msgSend(v5, "appendString:", CFSTR("@end\n\n"));

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)domainType
{
  return self->_domainType;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (IKJSRWIDependencyDomain)domain
{
  return (IKJSRWIDependencyDomain *)objc_loadWeakRetained((id *)&self->_domain);
}

- (NSArray)initializationParameters
{
  return self->_initializationParameters;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_initializationParameters, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_domainType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
