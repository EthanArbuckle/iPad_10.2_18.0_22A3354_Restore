@implementation ASDBundle

+ (id)bundleWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return v5;
}

- (ASDBundle)initWithIdentifier:(id)a3
{
  id v4;
  ASDBundle *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDBundle;
  v5 = -[ASDBundle init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  return -[NSString description](self->_identifier, "description");
}

- (id)debugDescription
{
  return (id)-[NSString debugDescription](self->_identifier, "debugDescription");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDBundle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASDBundle *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ASDBundle initWithIdentifier:](self, "initWithIdentifier:", v5);
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
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
