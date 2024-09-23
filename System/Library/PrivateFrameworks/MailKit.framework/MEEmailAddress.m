@implementation MEEmailAddress

+ (id)emailAddressesForAddresses:(id)a3
{
  objc_msgSend(a3, "ef_map:", &__block_literal_global_1);
  return (id)objc_claimAutoreleasedReturnValue();
}

MEEmailAddress *__45__MEEmailAddress_emailAddressesForAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MEEmailAddress *v3;

  v2 = a2;
  v3 = -[MEEmailAddress initWithRawString:]([MEEmailAddress alloc], "initWithRawString:", v2);

  return v3;
}

- (MEEmailAddress)initWithRawString:(NSString *)rawString
{
  NSString *v4;
  MEEmailAddress *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = rawString;
  v10.receiver = self;
  v10.super_class = (Class)MEEmailAddress;
  v5 = -[MEEmailAddress init](&v10, sel_init);
  if (v5)
  {
    -[NSString emailAddressValue](v4, "emailAddressValue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v4;
    objc_storeStrong((id *)&v5->_convertible, v8);

  }
  return v5;
}

- (NSString)rawString
{
  return (NSString *)-[ECEmailAddressConvertible stringValue](self->_convertible, "stringValue");
}

- (NSString)addressString
{
  void *v2;
  void *v3;

  -[ECEmailAddressConvertible emailAddressValue](self->_convertible, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simpleAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEEmailAddress)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MEEmailAddress *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_rawString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MEEmailAddress initWithRawString:](self, "initWithRawString:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MEEmailAddress rawString](self, "rawString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_rawString"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[MEEmailAddress rawString](self, "rawString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rawString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MEEmailAddress rawString](self, "rawString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") + 33;

  return v3;
}

- (ECEmailAddress)emailAddressValue
{
  return (ECEmailAddress *)-[ECEmailAddressConvertible emailAddressValue](self->_convertible, "emailAddressValue");
}

- (NSString)stringValue
{
  return (NSString *)-[ECEmailAddressConvertible stringValue](self->_convertible, "stringValue");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[MEEmailAddress rawString](self, "rawString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithRawString:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertible, 0);
}

@end
