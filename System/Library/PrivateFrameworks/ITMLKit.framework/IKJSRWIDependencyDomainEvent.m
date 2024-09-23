@implementation IKJSRWIDependencyDomainEvent

- (IKJSRWIDependencyDomainEvent)initWithEventDictionary:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  IKJSRWIDependencyDomainEvent *v8;
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
  uint64_t v20;
  IKJSRWIDependencyDomainProperty *v21;
  IKJSRWIDependencyDomainProperty *v22;
  uint64_t v23;
  NSArray *params;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)IKJSRWIDependencyDomainEvent;
  v8 = -[IKJSRWIDependencyDomainEvent init](&v30, sel_init);
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
    objc_msgSend(v6, "objectForKey:", CFSTR("parameters"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19);
          v21 = [IKJSRWIDependencyDomainProperty alloc];
          v22 = -[IKJSRWIDependencyDomainProperty initWithPropertyDictionary:forDomain:](v21, "initWithPropertyDictionary:forDomain:", v20, v7, (_QWORD)v26);
          if (v22)
            objc_msgSend(v14, "addObject:", v22);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v17);
    }

    v23 = objc_msgSend(v14, "copy");
    params = v8->_params;
    v8->_params = (NSArray *)v23;

  }
  return v8;
}

- (id)selectorString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;

  -[IKJSRWIDependencyDomainEvent name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[IKJSRWIDependencyDomainEvent params](self, "params");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[IKJSRWIDependencyDomainEvent params](self, "params");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v7)
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("%@:"), v10);
      }
      else
      {
        objc_msgSend(v10, "ikrwi_camelCase");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("With%@:"), v12);

      }
      ++v7;
      -[IKJSRWIDependencyDomainEvent params](self, "params");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v7 < v14);
  }
  return v4;
}

- (id)eventInterfaceString
{
  return -[IKJSRWIDependencyDomainEvent _eventInterfaceStringForImplementation:](self, "_eventInterfaceStringForImplementation:", 0);
}

- (id)_eventInterfaceStringForImplementation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  const __CFString *v19;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB37A0];
  -[IKJSRWIDependencyDomainEvent name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("- (void)safe_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSRWIDependencyDomainEvent params](self, "params");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    do
    {
      -[IKJSRWIDependencyDomainEvent params](self, "params");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v10)
      {
        objc_msgSend(v12, "methodParameterString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(" %@:%@"), v14, v15);
      }
      else
      {
        objc_msgSend(v13, "ikrwi_camelCase");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "methodParameterString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("With%@:%@"), v15, v16);

      }
      ++v10;
      -[IKJSRWIDependencyDomainEvent params](self, "params");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v10 < v18);
  }
  if (v3)
    v19 = CFSTR("\n{\n");
  else
    v19 = CFSTR(";\n");
  objc_msgSend(v7, "appendFormat:", v19);
  return v7;
}

- (id)eventImplementationStringWithSoftLinking:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;

  -[IKJSRWIDependencyDomainEvent _eventInterfaceStringForImplementation:](self, "_eventInterfaceStringForImplementation:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", CFSTR("\tvoid *arguments[] = {"));
  -[IKJSRWIDependencyDomainEvent params](self, "params");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[IKJSRWIDependencyDomainEvent params](self, "params");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v10 = CFSTR(", ");
      else
        v10 = &stru_1E9F50578;
      objc_msgSend(v9, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("%@&%@"), v10, v11);

      ++v7;
      -[IKJSRWIDependencyDomainEvent params](self, "params");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v7 < v13);
  }
  objc_msgSend(v4, "appendString:", CFSTR("};\n"));
  -[IKJSRWIDependencyDomainEvent selectorString](self, "selectorString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\tNSInvocation *invocation = [[self class] ik_invocationforSelectorString:@\"%@\" argumentsPointerValue:[NSValue valueWithPointer:arguments]];\n"),
    v14);

  objc_msgSend(v4, "appendFormat:", CFSTR("\t[invocation retainArguments];\n"));
  objc_msgSend(v4, "appendFormat:", CFSTR("\t[invocation invokeWithTarget:self];"));
  objc_msgSend(v4, "appendFormat:", CFSTR("\n}\n"));
  return v4;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  NSString *v6;
  Class v7;
  NSString *v8;
  char v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[IKJSRWIDependencyDomainEvent domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatcherClassString");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSClassFromString(v6);

  if (!v7)
    return 1;
  -[IKJSRWIDependencyDomainEvent selectorString](self, "selectorString");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = -[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", NSSelectorFromString(v8));
  v10 = v9;
  if (a3 && (v9 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("IKJSRWIDependencyErrorSelectorsKey");
    v18 = v8;
    -[IKJSRWIDependencyDomainEvent purpose](self, "purpose");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("undefined");
    if (v12)
      v14 = (const __CFString *)v12;
    v19 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("IKJSRWIDependencyErrorDomain"), 0, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
