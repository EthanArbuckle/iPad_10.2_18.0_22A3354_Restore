@implementation UNLocalizedString

+ (id)localizedStringForKey:(id)a3 arguments:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class();
  UNSafeCast(v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  UNSafeCast(v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    if (!objc_msgSend(v14, "length"))
    {
      v15 = v12;

      v14 = v15;
    }
    v16 = objc_opt_class();
    UNSafeCast(v16, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithKey:arguments:value:", v12, v17, v14);

  }
  else
  {
    v18 = (void *)objc_msgSend(v14, "copy");
  }

  return v18;
}

- (UNLocalizedString)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNLocalizedString.m"), 33, CFSTR("use +_initWithValue: or +localizedStringWithKey:arguments:"));

  return 0;
}

- (id)_initWithKey:(id)a3 arguments:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  UNLocalizedString *v11;
  uint64_t v12;
  NSString *key;
  uint64_t v14;
  NSArray *arguments;
  uint64_t v16;
  NSString *value;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNLocalizedString;
  v11 = -[UNLocalizedString init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    key = v11->_key;
    v11->_key = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    arguments = v11->_arguments;
    v11->_arguments = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    value = v11->_value;
    v11->_value = (NSString *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[UNLocalizedString arguments](self, "arguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UNLocalizedString key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNLocalizedString arguments](self, "arguments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arguments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualObjects(v5, v6))
    {
      -[UNLocalizedString key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = UNEqualObjects(v7, v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNLocalizedString value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNLocalizedString key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNLocalizedString arguments](self, "arguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; value: %@, key: %@: arguments: %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  return (id)-[NSString copy](self->_value, "copy");
}

- (unint64_t)length
{
  return -[NSString length](self->_value, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_value, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](self->_value, "getCharacters:range:", a3, a4.location, a4.length);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UNLocalizedString;
  v4 = a3;
  -[UNLocalizedString encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[UNLocalizedString arguments](self, "arguments", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("arguments"));

  -[UNLocalizedString key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("key"));

  -[UNLocalizedString value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("value"));

}

- (UNLocalizedString)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UNLocalizedString *v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("arguments"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[UNLocalizedString _initWithKey:arguments:value:](self, "_initWithKey:arguments:value:", v10, v9, v11);
  return v12;
}

- (id)un_localizedStringArguments
{
  return (id)-[NSArray copy](self->_arguments, "copy");
}

- (id)un_localizedStringKey
{
  return (id)-[NSString copy](self->_key, "copy");
}

- (id)un_localizedStringValue
{
  return (id)-[NSString copy](self->_value, "copy");
}

- (NSString)key
{
  return self->_key;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
