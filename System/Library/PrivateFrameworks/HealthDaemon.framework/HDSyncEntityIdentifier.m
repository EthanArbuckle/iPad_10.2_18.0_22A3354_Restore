@implementation HDSyncEntityIdentifier

+ (HDSyncEntityIdentifier)identifierWithSchema:(id)a3 entity:(int64_t)a4
{
  id v5;
  HDSyncEntityIdentifier *v6;

  v5 = a3;
  v6 = -[HDSyncEntityIdentifier initWithEntityIdentifier:schemaIdentifier:]([HDSyncEntityIdentifier alloc], "initWithEntityIdentifier:schemaIdentifier:", a4, v5);

  return v6;
}

- (HDSyncEntityIdentifier)initWithEntityIdentifier:(int64_t)a3 schemaIdentifier:(id)a4
{
  id v6;
  HDSyncEntityIdentifier *v7;
  HDSyncEntityIdentifier *v8;
  uint64_t v9;
  NSString *schemaIdentifier;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSyncEntityIdentifier;
  v7 = -[HDSyncEntityIdentifier init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_entityIdentifier = a3;
    v9 = objc_msgSend(v6, "copy");
    schemaIdentifier = v8->_schemaIdentifier;
    v8->_schemaIdentifier = (NSString *)v9;

  }
  return v8;
}

- (HDSyncEntityIdentifier)initWithCodableEntityIdentifier:(id)a3
{
  id v4;
  void *v5;
  HDSyncEntityIdentifier *v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasIdentifier"))
  {
    objc_msgSend(v4, "schema");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HDSyncEntityIdentifier initWithEntityIdentifier:schemaIdentifier:](self, "initWithEntityIdentifier:schemaIdentifier:", objc_msgSend(v4, "identifier"), v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)codableEntityIdentifier
{
  HDCodableEntityIdentifier *v3;

  v3 = objc_alloc_init(HDCodableEntityIdentifier);
  -[HDCodableEntityIdentifier setSchema:](v3, "setSchema:", self->_schemaIdentifier);
  -[HDCodableEntityIdentifier setIdentifier:](v3, "setIdentifier:", self->_entityIdentifier);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *schemaIdentifier;
  NSString *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_entityIdentifier != v4[1])
    goto LABEL_6;
  schemaIdentifier = self->_schemaIdentifier;
  v6 = (NSString *)v4[2];
  if (schemaIdentifier == v6)
  {
    v7 = 1;
    goto LABEL_7;
  }
  if (v6)
    v7 = -[NSString isEqualToString:](schemaIdentifier, "isEqualToString:");
  else
LABEL_6:
    v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  return self->_entityIdentifier + -[NSString hash](self->_schemaIdentifier, "hash");
}

- (id)description
{
  const __CFString *schemaIdentifier;
  void *v4;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;

  schemaIdentifier = (const __CFString *)self->_schemaIdentifier;
  if (schemaIdentifier)
    goto LABEL_2;
  v6 = (objc_class *)HDBuiltinSyncEntityClassForType(self->_entityIdentifier);
  if (!v6)
  {
    schemaIdentifier = (const __CFString *)self->_schemaIdentifier;
LABEL_2:
    if (!schemaIdentifier)
      schemaIdentifier = CFSTR("HDSyncEntityType");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%ld)"), schemaIdentifier, self->_entityIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  NSStringFromClass(v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("HD")))
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("HD"), "length"));
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("SyncEntity")))
  {
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - objc_msgSend(CFSTR("SyncEntity"), "length"));
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDSyncEntityIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HDSyncEntityIdentifier *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("identifier"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schema"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HDSyncEntityIdentifier initWithEntityIdentifier:schemaIdentifier:](self, "initWithEntityIdentifier:schemaIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t entityIdentifier;
  id v5;

  entityIdentifier = self->_entityIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", entityIdentifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_schemaIdentifier, CFSTR("schema"));

}

- (int64_t)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
}

@end
