@implementation LNNLGRepresentation

- (LNNLGRepresentation)initWithType:(id)a3 title:(id)a4 value:(id)a5 format:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  LNNLGRepresentation *v14;
  uint64_t v15;
  NSString *type;
  uint64_t v17;
  LNStaticDeferredLocalizedString *title;
  uint64_t v19;
  NSString *value;
  uint64_t v21;
  NSString *format;
  LNNLGRepresentation *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)LNNLGRepresentation;
  v14 = -[LNNLGRepresentation init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    type = v14->_type;
    v14->_type = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    title = v14->_title;
    v14->_title = (LNStaticDeferredLocalizedString *)v17;

    v19 = objc_msgSend(v12, "copy");
    value = v14->_value;
    v14->_value = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    format = v14->_format;
    v14->_format = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  LNNLGRepresentation *v4;
  LNNLGRepresentation *v5;
  LNNLGRepresentation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;

  v4 = (LNNLGRepresentation *)a3;
  v5 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNNLGRepresentation type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNNLGRepresentation type](v6, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[LNNLGRepresentation title](self, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNNLGRepresentation title](v6, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[LNNLGRepresentation value](self, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNNLGRepresentation value](v6, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            -[LNNLGRepresentation format](self, "format");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[LNNLGRepresentation format](v6, "format");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v16, "isEqual:", v13);

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[LNNLGRepresentation type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNNLGRepresentation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNNLGRepresentation value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNNLGRepresentation format](self, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNNLGRepresentation type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNNLGRepresentation title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNNLGRepresentation value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNNLGRepresentation format](self, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, type: %@, title: %@, value: %@, format: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (LNNLGRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LNNLGRepresentation *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[LNNLGRepresentation initWithType:title:value:format:](self, "initWithType:title:value:format:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNNLGRepresentation type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[LNNLGRepresentation title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[LNNLGRepresentation value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("value"));

  -[LNNLGRepresentation format](self, "format");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("format"));

}

- (NSString)type
{
  return self->_type;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)format
{
  return self->_format;
}

- (NSData)securityScopeData
{
  return self->_securityScopeData;
}

- (void)setSecurityScopeData:(id)a3
{
  objc_storeStrong((id *)&self->_securityScopeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopeData, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
