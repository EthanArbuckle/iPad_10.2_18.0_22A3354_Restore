@implementation SGSimpleMailHeaderKeyValue

- (SGSimpleMailHeaderKeyValue)initWithKey:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  SGSimpleMailHeaderKeyValue *v9;
  SGSimpleMailHeaderKeyValue *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGSimpleMailHeaderKeyValue;
  v9 = -[SGSimpleMailHeaderKeyValue init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SGSimpleMailHeaderKeyValue *v4;
  SGSimpleMailHeaderKeyValue *v5;
  BOOL v6;

  v4 = (SGSimpleMailHeaderKeyValue *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGSimpleMailHeaderKeyValue isEqualToSimpleMailHeaderKeyValue:](self, "isEqualToSimpleMailHeaderKeyValue:", v5);

  return v6;
}

- (BOOL)isEqualToSimpleMailHeaderKeyValue:(id)a3
{
  id *v4;
  NSString *key;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSString *v11;
  NSString *v12;

  v4 = (id *)a3;
  key = self->_key;
  v6 = (NSString *)v4[1];
  if (key == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = key;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_value;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[NSString isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_key, "hash");
  return -[NSString hash](self->_value, "hash") - v3 + 32 * v3;
}

- (SGSimpleMailHeaderKeyValue)initWithCoder:(id)a3
{
  id v5;
  SGSimpleMailHeaderKeyValue *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *key;
  void *v11;
  void *v12;
  NSString *v13;
  void *value;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGSimpleMailHeaderKeyValue;
  v6 = -[SGSimpleMailHeaderKeyValue init](&v16, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      key = v6->_key;
      v6->_key = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      key = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(key, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGSimpleMailMessage.m"), 112, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "key");
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
      value = v6->_value;
      v6->_value = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      value = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(value, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGSimpleMailMessage.m"), 113, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "value");
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGSimpleMailHeaderKeyValue: %@: %@>"), self->_key, self->_value);
}

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
