@implementation HDRapportRequestIdentifier

- (HDRapportRequestIdentifier)initWithSchemaIdentifier:(int64_t)a3 name:(id)a4
{
  id v6;
  HDRapportRequestIdentifier *v7;
  HDRapportRequestIdentifier *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDRapportRequestIdentifier;
  v7 = -[HDRapportRequestIdentifier init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_schemaIdentifier = a3;
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringForRapportSchemaIdentifier(self->_schemaIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@-%@>"), v4, self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
