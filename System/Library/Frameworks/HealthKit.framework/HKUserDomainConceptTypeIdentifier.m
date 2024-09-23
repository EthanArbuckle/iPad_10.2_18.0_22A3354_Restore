@implementation HKUserDomainConceptTypeIdentifier

- (HKUserDomainConceptTypeIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptTypeIdentifier)initWithCode:(int64_t)a3 schema:(id)a4
{
  id v6;
  HKUserDomainConceptTypeIdentifier *v7;
  HKUserDomainConceptTypeIdentifier *v8;
  uint64_t v9;
  NSString *schema;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKUserDomainConceptTypeIdentifier;
  v7 = -[HKUserDomainConceptTypeIdentifier init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    v9 = objc_msgSend(v6, "copy");
    schema = v8->_schema;
    v8->_schema = (NSString *)v9;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@, %lld>"), objc_opt_class(), self->_schema, self->_code);
}

- (unint64_t)hash
{
  int64_t code;

  code = self->_code;
  return -[NSString hash](self->_schema, "hash") ^ code;
}

- (BOOL)isEqual:(id)a3
{
  HKUserDomainConceptTypeIdentifier *v4;
  HKUserDomainConceptTypeIdentifier *v5;
  NSString *schema;
  NSString *v7;
  char v8;

  v4 = (HKUserDomainConceptTypeIdentifier *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_code != v5->_code)
        goto LABEL_9;
      schema = self->_schema;
      v7 = v5->_schema;
      if (schema == v7)
      {
        v8 = 1;
        goto LABEL_11;
      }
      if (v7)
        v8 = -[NSString isEqual:](schema, "isEqual:");
      else
LABEL_9:
        v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t code;
  id v5;

  code = self->_code;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", code, CFSTR("code"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_schema, CFSTR("schema"));

}

- (HKUserDomainConceptTypeIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HKUserDomainConceptTypeIdentifier *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("code"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schema"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKUserDomainConceptTypeIdentifier initWithCode:schema:](self, "initWithCode:schema:", v5, v6);
  return v7;
}

+ (id)baseUserDomainConceptIdentifier
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCode:schema:", 0, 0);
}

+ (id)medicalUserDomainConceptIdentifier
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCode:schema:", 1, 0);
}

+ (id)listUserDomainConceptIdentifier
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCode:schema:", 2, 0);
}

- (int64_t)code
{
  return self->_code;
}

- (NSString)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
}

@end
