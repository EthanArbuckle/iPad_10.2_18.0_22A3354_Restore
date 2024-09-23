@implementation IKJSRWIDependencyDomainCommand

- (IKJSRWIDependencyDomainCommand)initWithCommandDictionary:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  IKJSRWIDependencyDomainCommand *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *purpose;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  IKJSRWIDependencyDomainProperty *v20;
  uint64_t v21;
  NSArray *returns;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  IKJSRWIDependencyDomainProperty *v30;
  uint64_t v31;
  NSArray *params;
  IKJSRWIDependencyDomainCommand *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)IKJSRWIDependencyDomainCommand;
  v8 = -[IKJSRWIDependencyDomainCommand init](&v44, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("name"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend(v6, "objectForKey:", CFSTR("description"));
    v11 = objc_claimAutoreleasedReturnValue();
    purpose = v8->_purpose;
    v8->_purpose = (NSString *)v11;

    objc_storeWeak((id *)&v8->_domain, v7);
    v35 = v6;
    objc_msgSend(v6, "objectForKey:", CFSTR("returns"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v41;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(v15);
          v20 = -[IKJSRWIDependencyDomainProperty initWithPropertyDictionary:forDomain:]([IKJSRWIDependencyDomainProperty alloc], "initWithPropertyDictionary:forDomain:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v19), v7);
          if (v20)
            objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v17);
    }

    v21 = objc_msgSend(v14, "copy");
    returns = v8->_returns;
    v34 = v8;
    v8->_returns = (NSArray *)v21;

    objc_msgSend(v35, "objectForKey:", CFSTR("parameters"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v25 = v23;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          v30 = -[IKJSRWIDependencyDomainProperty initWithPropertyDictionary:forDomain:]([IKJSRWIDependencyDomainProperty alloc], "initWithPropertyDictionary:forDomain:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v29), v7);
          if (v30)
            objc_msgSend(v24, "addObject:", v30);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v27);
    }

    v31 = objc_msgSend(v24, "copy");
    v8 = v34;
    params = v34->_params;
    v34->_params = (NSArray *)v31;

    v6 = v35;
  }

  return v8;
}

- (id)selectorString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[IKJSRWIDependencyDomainCommand name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@WithErrorCallback:"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR("successCallback:"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IKJSRWIDependencyDomainCommand params](self, "params");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@:"), v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSString *v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[IKJSRWIDependencyDomainCommand domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "agentClass");

  if (!v6)
    return 1;
  -[IKJSRWIDependencyDomainCommand selectorString](self, "selectorString");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[IKJSRWIDependencyDomainCommand domain](self, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend((id)objc_msgSend(v8, "agentClass"), "instancesRespondToSelector:", NSSelectorFromString(v7));

  if (a3 && (v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v19 = CFSTR("IKJSRWIDependencyErrorSelectorsKey");
    v17 = v7;
    -[IKJSRWIDependencyDomainCommand purpose](self, "purpose");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("undefined");
    if (v11)
      v13 = (const __CFString *)v11;
    v18 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("IKJSRWIDependencyErrorDomain"), 0, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (IKJSRWIDependencyDomain)domain
{
  return (IKJSRWIDependencyDomain *)objc_loadWeakRetained((id *)&self->_domain);
}

- (NSArray)params
{
  return self->_params;
}

- (NSArray)returns
{
  return self->_returns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returns, 0);
  objc_storeStrong((id *)&self->_params, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
