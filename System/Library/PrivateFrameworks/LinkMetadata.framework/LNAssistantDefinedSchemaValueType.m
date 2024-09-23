@implementation LNAssistantDefinedSchemaValueType

- (LNAssistantDefinedSchemaValueType)initWithIdentifier:(id)a3
{
  id v4;
  LNAssistantDefinedSchemaValueType *v5;
  uint64_t v6;
  NSString *identifier;
  LNAssistantDefinedSchemaValueType *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNAssistantDefinedSchemaValueType;
  v5 = -[LNValueType _init](&v10, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (LNAssistantDefinedSchemaValueType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNAssistantDefinedSchemaValueType *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNAssistantDefinedSchemaValueType initWithIdentifier:](self, "initWithIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNAssistantDefinedSchemaValueType identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[LNAssistantDefinedSchemaValueType identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Entity<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNAssistantDefinedSchemaValueType identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNAssistantDefinedSchemaValueType *v4;
  LNAssistantDefinedSchemaValueType *v5;
  LNAssistantDefinedSchemaValueType *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNAssistantDefinedSchemaValueType *)a3;
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
      -[LNAssistantDefinedSchemaValueType identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNAssistantDefinedSchemaValueType identifier](v6, "identifier");
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
          v12 = objc_msgSend(v9, "isEqualToString:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)objectClassesForCoding
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
