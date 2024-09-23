@implementation MOWebDomain

- (id)persistableValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[MOWebDomain domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MOWebDomain domain](self, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("domain"));

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  id v3;
  void *v4;
  MOWebDomain *v5;

  v3 = a3;
  if (+[MOWebDomain isValidPersistableRepresentation:](MOWebDomain, "isValidPersistableRepresentation:", v3))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MOWebDomain initWithDomain:]([MOWebDomain alloc], "initWithDomain:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isValidPersistableRepresentation:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MOWebDomain)initWithDomain:(id)a3
{
  id v5;
  MOWebDomain *v6;
  MOWebDomain *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOWebDomain;
  v6 = -[MOWebDomain init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_domain, a3);

  return v7;
}

+ (BOOL)compareDomain:(id)a3 withDomainPattern:(id)a4 outExactMatch:(BOOL *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "caseInsensitiveCompare:", v8))
  {
    v12 = 1;
    v13 = 1;
    if (!a5)
      goto LABEL_16;
    goto LABEL_15;
  }
  v9 = v7;
  objc_msgSend(v9, "rangeOfString:options:", CFSTR("www."), 9);
  if (v10)
  {
    objc_msgSend(v9, "substringFromIndex:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "caseInsensitiveCompare:", v8))
    {
      v12 = 1;
      v13 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    v11 = v9;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("*.")))
  {
    objc_msgSend(v8, "substringFromIndex:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "caseInsensitiveCompare:", v14))
    {
      objc_msgSend(v8, "substringFromIndex:", 1);
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "rangeOfString:options:", v15, 13);
      v13 = v16 != 0;
      v14 = (void *)v15;
    }
    else
    {
      v13 = 1;
    }

    v12 = 0;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
LABEL_14:

  if (a5)
LABEL_15:
    *a5 = v12;
LABEL_16:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOWebDomain *v5;
  MOWebDomain *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = (MOWebDomain *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[MOWebDomain domain](self, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 || (-[MOWebDomain domain](v6, "domain"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[MOWebDomain domain](self, "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOWebDomain domain](v6, "domain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if (v7)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v10 = 1;
      }

      goto LABEL_11;
    }
    v10 = 0;
  }
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MOWebDomain domain](self, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MOWebDomain domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithDomain:", v6);

  return v7;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
