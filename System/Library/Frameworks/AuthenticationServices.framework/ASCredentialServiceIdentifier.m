@implementation ASCredentialServiceIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCredentialServiceIdentifier)initWithIdentifier:(NSString *)identifier type:(ASCredentialServiceIdentifierType)type
{
  NSString *v6;
  ASCredentialServiceIdentifier *v7;
  uint64_t v8;
  NSString *v9;
  ASCredentialServiceIdentifier *v10;
  objc_super v12;

  v6 = identifier;
  v12.receiver = self;
  v12.super_class = (Class)ASCredentialServiceIdentifier;
  v7 = -[ASCredentialServiceIdentifier init](&v12, sel_init);
  if (v7)
  {
    v8 = -[NSString copy](v6, "copy");
    v9 = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_type = type;
    v10 = v7;
  }

  return v7;
}

- (ASCredentialServiceIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  unint64_t v9;
  unint64_t v10;
  ASCredentialServiceIdentifier *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ASCredentialServiceIdentifierValue"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_24C955390;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ASCredentialServiceIdentifierType"));
  if (v9 >= 2)
    v10 = 0;
  else
    v10 = v9;
  v11 = -[ASCredentialServiceIdentifier initWithIdentifier:type:](self, "initWithIdentifier:type:", v8, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("ASCredentialServiceIdentifierValue"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("ASCredentialServiceIdentifierType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:type:", self->_identifier, self->_type);
}

- (id)description
{
  int64_t type;
  __CFString *v4;
  void *v5;
  void *v6;

  type = self->_type;
  if (type)
  {
    if (type == 1)
    {
      v4 = CFSTR("url");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = CFSTR("domain");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; type=%@; identifier=%@>"),
    objc_opt_class(),
    self,
    v4,
    self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (ASCredentialServiceIdentifierType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
