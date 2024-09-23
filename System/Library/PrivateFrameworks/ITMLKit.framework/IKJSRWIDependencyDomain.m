@implementation IKJSRWIDependencyDomain

+ (id)allowedDomains
{
  return &unk_1E9F8C380;
}

+ (id)domainAgentClassMap
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("CSS");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("DOM");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("DOMStorage");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("Network");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("Page");
  v4[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)allDomains
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__IKJSRWIDependencyDomain_allDomains__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allDomains_onceToken != -1)
    dispatch_once(&allDomains_onceToken, block);
  return (id)allDomains__domains;
}

void __37__IKJSRWIDependencyDomain_allDomains__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend((id)objc_opt_class(), "allowedDomains");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)allDomains__domains;
  allDomains__domains = v1;

}

+ (void)processDomains:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  IKJSRWIDependencyDomain *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = -[IKJSRWIDependencyDomain initWithDomainDictionary:agentClass:]([IKJSRWIDependencyDomain alloc], "initWithDomainDictionary:agentClass:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7), 0);
        if (v8)
        {
          objc_msgSend((id)objc_opt_class(), "domainAgentClassMap");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[IKJSRWIDependencyDomain identifier](v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "objectForKey:", v10);

          -[IKJSRWIDependencyDomain setAgentClass:](v8, "setAgentClass:", v11);
          objc_msgSend((id)objc_opt_class(), "allDomains");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[IKJSRWIDependencyDomain identifier](v8, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v8, v13);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (IKJSRWIDependencyDomain)initWithDomainDictionary:(id)a3 agentClass:(Class)a4
{
  id v6;
  IKJSRWIDependencyDomain *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSDictionary *types;
  uint64_t v12;
  NSDictionary *commands;
  uint64_t v14;
  NSDictionary *events;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  IKJSRWIDependencyDomainType *v21;
  NSDictionary *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  IKJSRWIDependencyDomainCommand *v29;
  NSDictionary *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  IKJSRWIDependencyDomainEvent *v37;
  NSDictionary *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)IKJSRWIDependencyDomain;
  v7 = -[IKJSRWIDependencyDomain init](&v53, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("domain"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    types = v7->_types;
    v7->_types = (NSDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v12 = objc_claimAutoreleasedReturnValue();
    commands = v7->_commands;
    v7->_commands = (NSDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v14 = objc_claimAutoreleasedReturnValue();
    events = v7->_events;
    v7->_events = (NSDictionary *)v14;

    objc_storeStrong((id *)&v7->_agentClass, a4);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v6, "objectForKey:", CFSTR("types"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v50;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v16);
          v21 = -[IKJSRWIDependencyDomainType initWithTypeDictionary:forDomain:]([IKJSRWIDependencyDomainType alloc], "initWithTypeDictionary:forDomain:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v20), v7);
          v22 = v7->_types;
          -[IKJSRWIDependencyDomainType identifier](v21, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v22, "setObject:forKey:", v21, v23);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v18);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v6, "objectForKey:", CFSTR("commands"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v46;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v46 != v27)
            objc_enumerationMutation(v24);
          v29 = -[IKJSRWIDependencyDomainCommand initWithCommandDictionary:forDomain:]([IKJSRWIDependencyDomainCommand alloc], "initWithCommandDictionary:forDomain:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v28), v7);
          v30 = v7->_commands;
          -[IKJSRWIDependencyDomainCommand name](v29, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v30, "setObject:forKey:", v29, v31);

          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v26);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v6, "objectForKey:", CFSTR("events"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v42;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v42 != v35)
            objc_enumerationMutation(v32);
          v37 = -[IKJSRWIDependencyDomainEvent initWithEventDictionary:forDomain:]([IKJSRWIDependencyDomainEvent alloc], "initWithEventDictionary:forDomain:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v36), v7);
          v38 = v7->_events;
          -[IKJSRWIDependencyDomainEvent name](v37, "name");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v38, "setObject:forKey:", v37, v39);

          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v34);
    }

  }
  return v7;
}

- (NSString)dispatcherClassString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[IKJSRWIDependencyDomain identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("RWIProtocol%@DomainEventDispatcher"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  id v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v6 = -[IKJSRWIDependencyDomain isValidForTypesWithError:](self, "isValidForTypesWithError:", &v24);
  v7 = v24;
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("IKJSRWIDependencyErrorSelectorsKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("IKJSRWIDependencyErrorSelectorsKey"));
  }
  v23 = 0;
  v11 = -[IKJSRWIDependencyDomain isValidForAgentWithError:](self, "isValidForAgentWithError:", &v23);
  v12 = v23;
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(v12, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("IKJSRWIDependencyErrorSelectorsKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("IKJSRWIDependencyErrorAgentSelectorsKey"));
    v6 = 0;
  }
  v22 = 0;
  v16 = -[IKJSRWIDependencyDomain isValidForEventsWithError:](self, "isValidForEventsWithError:", &v22);
  v17 = v22;
  v18 = v17;
  if (!v16)
  {
    objc_msgSend(v17, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("IKJSRWIDependencyErrorSelectorsKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("IKJSRWIDependencyErrorAgentSelectorsKey"));
    v6 = 0;
  }
  if (a3 && !v6 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IKJSRWIDependencyErrorDomain"), 1, v5);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)isValidForAgentWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFString *v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!-[IKJSRWIDependencyDomain agentClass](self, "agentClass"))
    return 1;
  v24 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[IKJSRWIDependencyDomain commands](self, "commands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[IKJSRWIDependencyDomain commands](self, "commands");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 0;
        v13 = objc_msgSend(v12, "isValidWithError:", &v26);
        v14 = v26;
        v15 = v14;
        if ((v13 & 1) == 0)
        {
          objc_msgSend(v14, "userInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("IKJSRWIDependencyErrorSelectorsKey"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v12, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKey:", v17, v18);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v7);
  }

  if (v24)
  {
    v19 = v25;
    if (objc_msgSend(v25, "count"))
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v31 = CFSTR("IKJSRWIDependencyErrorSelectorsKey");
      v32 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("IKJSRWIDependencyErrorDomain"), 1, v21);
      *v24 = (id)objc_claimAutoreleasedReturnValue();

      v22 = 0;
    }
    else
    {
      v22 = 1;
    }
  }
  else
  {
    v22 = 1;
    v19 = v25;
  }

  return v22;
}

- (BOOL)isValidForTypesWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[IKJSRWIDependencyDomain types](self, "types");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[IKJSRWIDependencyDomain types](self, "types");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = 0;
        v12 = objc_msgSend(v11, "isValidWithError:", &v25);
        v13 = v25;
        v14 = v13;
        if ((v12 & 1) == 0)
        {
          objc_msgSend(v13, "userInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("IKJSRWIDependencyErrorSelectorsKey"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v11, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKey:", v16, v17);

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v6);
  }

  if (a3)
  {
    v18 = v24;
    if (objc_msgSend(v24, "count"))
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v30 = CFSTR("IKJSRWIDependencyErrorSelectorsKey");
      v31 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IKJSRWIDependencyErrorDomain"), 1, v20);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }
    else
    {
      v21 = 1;
    }
  }
  else
  {
    v21 = 1;
    v18 = v24;
  }

  return v21;
}

- (BOOL)isValidForEventsWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[IKJSRWIDependencyDomain events](self, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[IKJSRWIDependencyDomain events](self, "events");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = 0;
        v12 = objc_msgSend(v11, "isValidWithError:", &v25);
        v13 = v25;
        v14 = v13;
        if ((v12 & 1) == 0)
        {
          objc_msgSend(v13, "userInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("IKJSRWIDependencyErrorSelectorsKey"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v11, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKey:", v16, v17);

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v6);
  }

  if (a3)
  {
    v18 = v24;
    if (objc_msgSend(v24, "count"))
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v30 = CFSTR("IKJSRWIDependencyErrorSelectorsKey");
      v31 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IKJSRWIDependencyErrorDomain"), 1, v20);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }
    else
    {
      v21 = 1;
    }
  }
  else
  {
    v21 = 1;
    v18 = v24;
  }

  return v21;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (Class)agentClass
{
  return self->_agentClass;
}

- (void)setAgentClass:(Class)a3
{
  objc_storeStrong((id *)&self->_agentClass, a3);
}

- (NSDictionary)types
{
  return self->_types;
}

- (NSDictionary)commands
{
  return self->_commands;
}

- (NSDictionary)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_agentClass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
