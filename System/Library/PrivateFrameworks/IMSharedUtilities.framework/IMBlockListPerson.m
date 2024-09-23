@implementation IMBlockListPerson

+ (IMBlockListPerson)personWithCNContact:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCNContact:", v4);

  return (IMBlockListPerson *)v5;
}

- (IMBlockListPerson)init
{
  IMBlockListPerson *v2;
  CNContact *v3;
  CNContact *cnPerson;
  uint64_t v5;
  NSString *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMBlockListPerson;
  v2 = -[IMBlockListPerson init](&v8, sel_init);
  if (v2)
  {
    v3 = (CNContact *)objc_alloc_init(MEMORY[0x1E0C97200]);
    cnPerson = v2->_cnPerson;
    v2->_cnPerson = v3;

    -[CNContact identifier](v2->_cnPerson, "identifier");
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v5;

  }
  return v2;
}

- (IMBlockListPerson)initWithCNContact:(id)a3
{
  id v5;
  IMBlockListPerson *v6;
  IMBlockListPerson *v7;
  IMBlockListPerson *v8;
  void *v9;
  void *v10;
  IMBlockListPerson *v11;
  uint64_t v12;
  NSString *identifier;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    v7 = -[IMBlockListPerson init](self, "init");
    goto LABEL_10;
  }
  v20.receiver = self;
  v20.super_class = (Class)IMBlockListPerson;
  v6 = -[IMBlockListPerson init](&v20, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_10:
    v7 = v7;
    v8 = v7;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_cnPerson, a3);
  -[CNContact identifier](v7->_cnPerson, "identifier");
  v8 = (IMBlockListPerson *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D36B10], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact identifier](v7->_cnPerson, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (IMBlockListPerson *)objc_msgSend(v9, "copyOrSetObject:forKey:", v7, v10);

    LODWORD(v9) = -[IMBlockListPerson isInAddressBook](v11, "isInAddressBook");
    -[CNContact identifier](v7->_cnPerson, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v12;

    if ((_DWORD)v9)
      v14 = v11 == v7;
    else
      v14 = 0;
    if (v14)
    {
      v8 = v7;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0D36B10], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact identifier](v7->_cnPerson, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:key:", v7, v16);

    objc_msgSend(MEMORY[0x1E0D36B10], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact identifier](v7->_cnPerson, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

- (BOOL)isEqualToPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[IMBlockListPerson identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (NSString)fullName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[IMBlockListPerson cnPerson](self, "cnPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore fullNameForCNContact:](IMContactStore, "fullNameForCNContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBlockListPerson sanitizeString:](self, "sanitizeString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (v6)
  {
    -[IMBlockListPerson setCachedFullName:](self, "setCachedFullName:", v6);
    v7 = v6;
  }
  else
  {
    -[IMBlockListPerson cnPerson](self, "cnPerson");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore companyNameForCNContact:](IMContactStore, "companyNameForCNContact:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "length"))
    {
      v10 = v9;
    }
    else
    {
      -[IMBlockListPerson cachedFullName](self, "cachedFullName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v10;

  }
  return (NSString *)v7;
}

- (id)companyName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[IMBlockListPerson cnPerson](self, "cnPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore companyNameForCNContact:](IMContactStore, "companyNameForCNContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBlockListPerson sanitizeString:](self, "sanitizeString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMBlockListPerson setCachedCompanyName:](self, "setCachedCompanyName:", v5);
    v6 = v5;
  }
  else
  {
    -[IMBlockListPerson cachedCompanyName](self, "cachedCompanyName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)sanitizeString:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isNull") & 1) != 0 || !objc_msgSend(v3, "length"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "stringByRemovingWhitespace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
    {
      v5 = v4;
      v3 = v5;
    }
    else
    {
      v5 = 0;
      v3 = v4;
    }
  }

  return v5;
}

- (BOOL)isInAddressBook
{
  void *v2;
  BOOL v3;

  -[IMBlockListPerson cnPerson](self, "cnPerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v2);

  return v3;
}

- (CNContact)cnPerson
{
  return self->_cnPerson;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)cachedFullName
{
  return self->_cachedFullName;
}

- (void)setCachedFullName:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFullName, a3);
}

- (NSString)cachedCompanyName
{
  return self->_cachedCompanyName;
}

- (void)setCachedCompanyName:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCompanyName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCompanyName, 0);
  objc_storeStrong((id *)&self->_cachedFullName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cnPerson, 0);
}

@end
