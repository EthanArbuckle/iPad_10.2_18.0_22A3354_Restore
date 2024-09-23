@implementation IXAppRemovabilityMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXAppRemovabilityMetadata)initWithRemovability:(unint64_t)a3 client:(unint64_t)a4
{
  IXAppRemovabilityMetadata *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IXAppRemovabilityMetadata;
  result = -[IXAppRemovabilityMetadata init](&v7, sel_init);
  if (result)
  {
    result->_removability = a3;
    result->_client = a4;
  }
  return result;
}

- (IXAppRemovabilityMetadata)initWithMetadataDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  IXAppRemovabilityMetadata *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("removability"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("client"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    v9 = 0;
    if (v8 && v12)
    {
      self = -[IXAppRemovabilityMetadata initWithRemovability:client:](self, "initWithRemovability:client:", objc_msgSend(v8, "unsignedIntValue"), objc_msgSend(v12, "unsignedIntValue"));
      v9 = self;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("removability");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXAppRemovabilityMetadata removability](self, "removability"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("client");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXAppRemovabilityMetadata client](self, "client"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  IXStringForAppRemovability(-[IXAppRemovabilityMetadata removability](self, "removability"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IXStringForAppRemovabilityClient(-[IXAppRemovabilityMetadata client](self, "client"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRemovability:client:", -[IXAppRemovabilityMetadata removability](self, "removability"), -[IXAppRemovabilityMetadata client](self, "client"));
}

- (BOOL)isEqual:(id)a3
{
  IXAppRemovabilityMetadata *v4;
  IXAppRemovabilityMetadata *v5;
  IXAppRemovabilityMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = (IXAppRemovabilityMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[IXAppRemovabilityMetadata removability](v6, "removability");
    v9 = 0;
    if (v7 == -[IXAppRemovabilityMetadata removability](self, "removability"))
    {
      v8 = -[IXAppRemovabilityMetadata client](v6, "client");
      if (v8 == -[IXAppRemovabilityMetadata client](self, "client"))
        v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[IXAppRemovabilityMetadata removability](self, "removability");
  return -[IXAppRemovabilityMetadata client](self, "client") ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[IXAppRemovabilityMetadata removability](self, "removability"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("removability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXAppRemovabilityMetadata client](self, "client"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("client"));

}

- (IXAppRemovabilityMetadata)initWithCoder:(id)a3
{
  id v4;
  IXAppRemovabilityMetadata *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IXAppRemovabilityMetadata;
  v5 = -[IXAppRemovabilityMetadata init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("removability"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_removability = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_client = objc_msgSend(v7, "unsignedLongLongValue");

  }
  return v5;
}

- (unint64_t)removability
{
  return self->_removability;
}

- (unint64_t)client
{
  return self->_client;
}

@end
