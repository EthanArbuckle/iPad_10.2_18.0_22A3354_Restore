@implementation IAMTriggerKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (IAMTriggerKey)initWithName:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  IAMTriggerKey *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMTriggerKey;
  v8 = -[IAMTriggerKey init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v11;

  }
  return v8;
}

- (NSString)nameSpacedKeyName
{
  return (NSString *)+[IAMTriggerKey nameSpacedKeyNameForName:bundleIdentifier:](IAMTriggerKey, "nameSpacedKeyNameForName:bundleIdentifier:", self->_name, self->_bundleIdentifier);
}

+ (id)nameSpacedKeyNameForName:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "copy");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@::%@"), v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMTriggerKey nameSpacedKeyName](self, "nameSpacedKeyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v6);

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSString hash](self->_bundleIdentifier, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  IAMTriggerKey *v4;
  IAMTriggerKey *v5;
  NSString *name;
  void *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  NSString *v10;
  void *v11;
  char v12;

  v4 = (IAMTriggerKey *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      name = self->_name;
      -[IAMTriggerKey name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSString isEqualToString:](name, "isEqualToString:", v7);

      if ((_DWORD)v8)
      {
        bundleIdentifier = self->_bundleIdentifier;
        v10 = bundleIdentifier;
        if (!bundleIdentifier)
        {
          -[IAMTriggerKey bundleIdentifier](v5, "bundleIdentifier");
          v8 = objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
            v12 = 1;
LABEL_13:

            goto LABEL_14;
          }
          v10 = self->_bundleIdentifier;
        }
        -[IAMTriggerKey bundleIdentifier](v5, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSString isEqual:](v10, "isEqual:", v11);

        if (!bundleIdentifier)
          goto LABEL_13;
      }
      else
      {
        v12 = 0;
      }
LABEL_14:

      goto LABEL_15;
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

@end
