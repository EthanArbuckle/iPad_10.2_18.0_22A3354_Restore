@implementation EMSearchableMessageID

- (EMSearchableMessageID)initWithString:(id)a3
{
  id v4;
  EMSearchableMessageID *v5;
  uint64_t v6;
  NSString *stringValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMSearchableMessageID;
  v5 = -[EMSearchableMessageID init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

  }
  return v5;
}

- (EMSearchableMessageID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  EMSearchableMessageID *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EMSearchableMessageID initWithString:](self, "initWithString:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EMSearchableMessageID stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_stringValue"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[EMSearchableMessageID stringValue](self, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EMSearchableMessageID stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
