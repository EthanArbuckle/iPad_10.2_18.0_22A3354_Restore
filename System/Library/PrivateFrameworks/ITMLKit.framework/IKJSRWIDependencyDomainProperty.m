@implementation IKJSRWIDependencyDomainProperty

+ (id)typeMapping
{
  return &unk_1E9F8C930;
}

+ (id)propertyNameMapping
{
  return &unk_1E9F8C958;
}

- (IKJSRWIDependencyDomainProperty)initWithPropertyDictionary:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  IKJSRWIDependencyDomainProperty *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IKJSRWIDependencyDomainProperty initWithPropertyDictionary:forDomain:](self, "initWithPropertyDictionary:forDomain:", v7, v8);

  if (v9)
    objc_storeWeak((id *)&v9->_domainType, v6);

  return v9;
}

- (IKJSRWIDependencyDomainProperty)initWithPropertyDictionary:(id)a3 forDomain:(id)a4
{
  id v6;
  IKJSRWIDependencyDomainProperty *v7;
  IKJSRWIDependencyDomainProperty *v8;

  v6 = a4;
  v7 = -[IKJSRWIDependencyDomainProperty initWithPropertyDictionary:](self, "initWithPropertyDictionary:", a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_domain, v6);

  return v8;
}

- (IKJSRWIDependencyDomainProperty)initWithPropertyDictionary:(id)a3
{
  id v4;
  IKJSRWIDependencyDomainProperty *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *name;
  uint64_t v12;
  NSString *purpose;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSString *reference;
  uint64_t v19;
  NSArray *enumOptions;
  NSString *propertyType;
  uint64_t v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IKJSRWIDependencyDomainProperty;
  v5 = -[IKJSRWIDependencyDomainProperty init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "propertyNameMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("name"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    name = v5->_name;
    v5->_name = v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("description"));
    v12 = objc_claimAutoreleasedReturnValue();
    purpose = v5->_purpose;
    v5->_purpose = (NSString *)v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("optional"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("optional"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_required = objc_msgSend(v15, "BOOLValue") ^ 1;

    }
    else
    {
      v5->_required = 1;
    }

    v16 = CFSTR("$ref");
    objc_msgSend(v4, "objectForKey:", CFSTR("$ref"));
    v17 = objc_claimAutoreleasedReturnValue();
    reference = v5->_reference;
    v5->_reference = (NSString *)v17;

    objc_msgSend(v4, "objectForKey:", CFSTR("enum"));
    v19 = objc_claimAutoreleasedReturnValue();
    enumOptions = v5->_enumOptions;
    v5->_enumOptions = (NSArray *)v19;

    if (!v5->_reference)
    {
      if (!v5->_enumOptions)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("type"));
        v23 = objc_claimAutoreleasedReturnValue();
        propertyType = v5->_propertyType;
        v5->_propertyType = (NSString *)v23;
        goto LABEL_12;
      }
      v16 = CFSTR("enum");
    }
    propertyType = v5->_propertyType;
    v5->_propertyType = &v16->isa;
LABEL_12:

  }
  return v5;
}

- (id)propertyDefinitionString
{
  return 0;
}

- (id)methodParameterString
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;

  -[IKJSRWIDependencyDomainProperty propertyType](self, "propertyType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("enum"));

  if (v4)
  {
    -[IKJSRWIDependencyDomainProperty domainType](self, "domainType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSRWIDependencyDomainProperty name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ikrwi_camelCase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v10 = (void *)v9;

LABEL_4:
    goto LABEL_18;
  }
  -[IKJSRWIDependencyDomainProperty propertyType](self, "propertyType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("$ref"));

  if (!v12)
  {
    objc_msgSend((id)objc_opt_class(), "typeMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSRWIDependencyDomainProperty propertyType](self, "propertyType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[NSString componentsSeparatedByString:](self->_reference, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    -[IKJSRWIDependencyDomainProperty domain](self, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "types");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "count") != 2)
    {
      v5 = 0;
      goto LABEL_13;
    }
    +[IKJSRWIDependencyDomain allDomains](IKJSRWIDependencyDomain, "allDomains");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "types");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v15;
  objc_msgSend(v14, "objectForKey:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  objc_msgSend(v5, "domainType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("object"));

  if (v21)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(" *"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(v5, "domainType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("enum"));

  if (!v23)
  {
    objc_msgSend((id)objc_opt_class(), "typeMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(v5, "name");
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v10 = (void *)v16;
LABEL_18:

  if (v10)
  {
    if (!-[IKJSRWIDependencyDomainProperty isRequired](self, "isRequired"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@*"), v10);
      v24 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v24;
    }
    v25 = (void *)MEMORY[0x1E0CB3940];
    -[IKJSRWIDependencyDomainProperty name](self, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("(%@)%@"), v10, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  return v27;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (NSString)propertyType
{
  return self->_propertyType;
}

- (IKJSRWIDependencyDomainType)domainType
{
  return (IKJSRWIDependencyDomainType *)objc_loadWeakRetained((id *)&self->_domainType);
}

- (IKJSRWIDependencyDomain)domain
{
  return (IKJSRWIDependencyDomain *)objc_loadWeakRetained((id *)&self->_domain);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_domain);
  objc_destroyWeak((id *)&self->_domainType);
  objc_storeStrong((id *)&self->_propertyType, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_enumOptions, 0);
  objc_storeStrong((id *)&self->_reference, 0);
}

@end
