@implementation CRKASMCertificateCommonName

+ (id)commonNameWithString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") >= 4)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      if (objc_msgSend(v9, "hasSuffix:", CFSTR(": ASM")))
      {
        objc_msgSend(v4, "subarrayWithRange:", 2, objc_msgSend(v4, "count") - 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v4, "lastObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v12);
          if (v13)
            v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrefix:userIdentifier:UUID:", v9, v11, v13);
          else
            v5 = 0;

        }
        else
        {
          v5 = 0;
        }

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (CRKASMCertificateCommonName)initWithPrefix:(id)a3 userIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CRKASMCertificateCommonName *v10;

  v6 = (void *)MEMORY[0x24BDD1880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRKASMCertificateCommonName initWithPrefix:userIdentifier:UUID:](self, "initWithPrefix:userIdentifier:UUID:", v8, v7, v9);

  return v10;
}

- (CRKASMCertificateCommonName)initWithPrefix:(id)a3 userIdentifier:(id)a4 UUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKASMCertificateCommonName *v11;
  uint64_t v12;
  NSString *prefix;
  uint64_t v14;
  NSString *userIdentifier;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMCertificateCommonName;
  v11 = -[CRKASMCertificateCommonName init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    prefix = v11->_prefix;
    v11->_prefix = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    userIdentifier = v11->_userIdentifier;
    v11->_userIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_UUID, a5);
  }

  return v11;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CRKASMCertificateCommonName prefix](self, "prefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCertificateCommonName userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCertificateCommonName UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
