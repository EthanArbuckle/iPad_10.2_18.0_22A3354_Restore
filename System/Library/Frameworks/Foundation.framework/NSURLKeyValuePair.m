@implementation NSURLKeyValuePair

+ (id)pair
{
  return -[NSURLKeyValuePair initWithKey:value:]([NSURLKeyValuePair alloc], "initWithKey:value:", 0, 0);
}

+ (id)pairWithKey:(id)a3 value:(id)a4
{
  return -[NSURLKeyValuePair initWithKey:value:]([NSURLKeyValuePair alloc], "initWithKey:value:", a3, a4);
}

- (NSURLKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  NSURLKeyValuePair *v6;
  NSURLKeyValuePair *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSURLKeyValuePair;
  v6 = -[NSURLKeyValuePair init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[NSURLKeyValuePair setKey:](v6, "setKey:", a3);
    -[NSURLKeyValuePair setValue:](v7, "setValue:", a4);
    v7->hash = objc_msgSend(a3, "hash");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSURLKeyValuePair;
  -[NSURLKeyValuePair dealloc](&v3, sel_dealloc);
}

- (void)setKey:(id)a3
{
  id key;

  key = self->key;
  if (key != a3)
  {

    self->key = a3;
  }
}

- (void)setValue:(id)a3
{
  id value;

  value = self->value;
  if (value != a3)
  {

    self->value = a3;
  }
}

- (id)key
{
  return self->key;
}

- (id)value
{
  return self->value;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<NSURLKeyValuePair %@=%@>"), self->key, self->value);
}

- (unint64_t)hash
{
  return self->hash;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
    {
      v5 = objc_msgSend(self->key, "isEqual:", objc_msgSend(a3, "key"));
      if (v5)
        LOBYTE(v5) = objc_msgSend(self->value, "isEqual:", objc_msgSend(a3, "value"));
    }
  }
  return v5;
}

@end
