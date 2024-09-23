@implementation FCHLSKey

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_method);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@, %@, %@, %@, %@}"), v4, self->_url, self->_keyFormat, self->_keyFormatVersions, self->_iv);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FCHLSKey *v4;
  FCHLSKey *v5;
  FCHLSKey *v6;
  NSURL *url;
  NSURL *v8;
  NSString *keyFormat;
  NSString *v10;
  NSString *iv;
  NSString *v12;
  NSString *keyFormatVersions;
  NSString *v14;
  int64_t method;

  v4 = (FCHLSKey *)a3;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if (v4)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v5 = v4;
        else
          v5 = 0;
      }
      else
      {
        v5 = 0;
      }
      v6 = v5;
      if (self)
      {
        url = self->_url;
        if (url && (!v6 ? (v8 = 0) : (v8 = v6->_url), !-[NSURL isEqual:](url, "isEqual:", v8))
          || (keyFormat = self->_keyFormat) != 0
          && (!v6 ? (v10 = 0) : (v10 = v6->_keyFormat),
              !-[NSString isEqualToString:](keyFormat, "isEqualToString:", v10))
          || (iv = self->_iv) != 0
          && (!v6 ? (v12 = 0) : (v12 = v6->_iv), !-[NSString isEqualToString:](iv, "isEqualToString:", v12))
          || (keyFormatVersions = self->_keyFormatVersions) != 0
          && (!v6 ? (v14 = 0) : (v14 = v6->_keyFormatVersions),
              !-[NSString isEqualToString:](keyFormatVersions, "isEqualToString:", v14)))
        {
          LOBYTE(self) = 0;
        }
        else
        {
          if (v6)
            method = v6->_method;
          else
            method = 0;
          LOBYTE(self) = self->_method == method;
        }
      }

    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSURL hash](self->_url, "hash");
  v4 = -[NSString hash](self->_iv, "hash") ^ v3;
  v5 = -[NSString hash](self->_keyFormat, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_keyFormatVersions, "hash") ^ self->_method;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iv, 0);
  objc_storeStrong((id *)&self->_keyFormatVersions, 0);
  objc_storeStrong((id *)&self->_keyFormat, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
