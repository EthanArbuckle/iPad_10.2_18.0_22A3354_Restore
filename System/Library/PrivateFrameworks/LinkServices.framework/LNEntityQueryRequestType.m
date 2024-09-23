@implementation LNEntityQueryRequestType

- (LNEntityQueryRequestType)initWithEntityIdentifiers:(id)a3
{
  id v5;
  id *v6;
  LNEntityQueryRequestType *v7;
  LNEntityQueryRequestType *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNEntityQueryRequestType;
  v6 = -[LNQueryRequestTypeBase _init](&v10, sel__init);
  v7 = (LNEntityQueryRequestType *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  return CFSTR("IdentifierQuery");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNEntityQueryRequestType identifiers](self, "identifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifiers"));

}

- (LNEntityQueryRequestType)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  LNEntityQueryRequestType *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("identifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[LNEntityQueryRequestType initWithEntityIdentifiers:](self, "initWithEntityIdentifiers:", v8);
  return v9;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_identifiers, "hash");
}

- (BOOL)isEqual:(id)a3
{
  LNEntityQueryRequestType *v4;
  LNEntityQueryRequestType *v5;
  LNEntityQueryRequestType *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNEntityQueryRequestType *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNEntityQueryRequestType identifiers](self, "identifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNEntityQueryRequestType identifiers](v6, "identifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqualToArray:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
