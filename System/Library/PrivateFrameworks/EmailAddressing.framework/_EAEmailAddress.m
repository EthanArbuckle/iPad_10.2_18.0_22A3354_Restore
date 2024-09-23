@implementation _EAEmailAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_EAEmailAddress rawAddress](self, "rawAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_EAEmailAddress rawAddress](self, "rawAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6) == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)rawAddress
{
  void *v2;
  void *v3;

  -[_EAEmailAddress emailAddress](self, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EAEmailAddressParser rawAddressFromFullAddress:](EAEmailAddressParser, "rawAddressFromFullAddress:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (_EAEmailAddress)initWithEmailAddress:(id)a3
{
  id v4;
  _EAEmailAddress *v5;
  uint64_t v6;
  NSString *emailAddress;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EAEmailAddress;
  v5 = -[_EAEmailAddress init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v2;
  void *v3;

  -[_EAEmailAddress emailAddress](self, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EAEmailAddress)initWithCoder:(id)a3
{
  id v4;
  _EAEmailAddress *v5;
  uint64_t v6;
  NSString *emailAddress;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EAEmailAddress;
  v5 = -[_EAEmailAddress init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_emailAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_EAEmailAddress emailAddress](self, "emailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_emailAddress"));

}

@end
