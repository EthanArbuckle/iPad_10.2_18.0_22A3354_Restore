@implementation MSSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSSession)init
{
  void *v3;
  MSSession *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MSSession initWithIdentifier:](self, "initWithIdentifier:", v3);

  return v4;
}

- (MSSession)initWithIdentifier:(id)a3
{
  id v5;
  MSSession *v6;
  MSSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSSession;
  v6 = -[MSSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (MSSession)initWithCoder:(id)a3
{
  id v4;
  MSSession *v5;
  uint64_t v6;
  NSUUID *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSSession;
  v5 = -[MSSession init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
}

- (BOOL)isEqual:(id)a3
{
  MSSession *v4;
  void *v5;
  NSUUID *identifier;
  void *v7;
  char v8;

  v4 = (MSSession *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    if (objc_msgSend(v5, "isEqual:", objc_opt_class()))
    {
      identifier = self->_identifier;
      -[MSSession identifier](v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSUUID isEqual:](identifier, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %lx> - %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
