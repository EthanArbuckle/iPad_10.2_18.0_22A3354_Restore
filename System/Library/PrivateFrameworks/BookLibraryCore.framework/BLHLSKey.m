@implementation BLHLSKey

- (void)setPropertiesFromAttributeList:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  NSURL *v7;
  NSURL *url;
  NSString *v9;
  NSString *keyFormat;
  NSString *v11;
  NSString *keyFormatVersions;
  NSString *v13;
  NSString *iv;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("METHOD"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("NONE"), "isEqualToString:"))
  {
    v5 = 1;
  }
  else if (objc_msgSend(CFSTR("AES-128"), "isEqualToString:", v15))
  {
    v5 = 2;
  }
  else
  {
    if (!objc_msgSend(CFSTR("SAMPLE-AES"), "isEqualToString:", v15))
    {
      self->_method = 0;
      goto LABEL_8;
    }
    v5 = 3;
  }
  self->_method = v5;
LABEL_8:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("KEYFORMAT"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyFormat = self->_keyFormat;
  self->_keyFormat = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("KEYFORMATVERSIONS"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyFormatVersions = self->_keyFormatVersions;
  self->_keyFormatVersions = v11;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IV"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  iv = self->_iv;
  self->_iv = v13;

}

- (BOOL)isFormatSupported
{
  return -[NSString isEqualToString:](self->_keyFormat, "isEqualToString:", CFSTR("com.apple.streamingkeydelivery"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_method);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@, %@, %@, %@, %@}"), v4, self->_url, self->_keyFormat, self->_keyFormatVersions, self->_iv);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqualToHLSKey:(id)a3
{
  id v4;
  void *v5;
  NSURL *url;
  void *v7;
  int v8;
  NSString *keyFormat;
  void *v10;
  _BOOL4 v11;
  NSString *iv;
  void *v13;
  _BOOL4 v14;
  NSString *keyFormatVersions;
  void *v16;
  _BOOL4 v17;
  int64_t method;
  BOOL v19;

  v4 = a3;
  v5 = v4;
  url = self->_url;
  if (url)
  {
    objc_msgSend(v4, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSURL isEqual:](url, "isEqual:", v7);

    if (!v8)
      goto LABEL_10;
  }
  keyFormat = self->_keyFormat;
  if (keyFormat)
  {
    objc_msgSend(v5, "keyFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqualToString:](keyFormat, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_10;
  }
  iv = self->_iv;
  if (iv)
  {
    objc_msgSend(v5, "iv");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSString isEqualToString:](iv, "isEqualToString:", v13);

    if (!v14)
      goto LABEL_10;
  }
  keyFormatVersions = self->_keyFormatVersions;
  if (keyFormatVersions
    && (objc_msgSend(v5, "keyFormatVersions"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = -[NSString isEqualToString:](keyFormatVersions, "isEqualToString:", v16),
        v16,
        !v17))
  {
LABEL_10:
    v19 = 0;
  }
  else
  {
    method = self->_method;
    v19 = method == objc_msgSend(v5, "method");
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  BLHLSKey *v4;
  void *v5;
  BOOL v6;

  v4 = (BLHLSKey *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      BUDynamicCast();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[BLHLSKey isEqualToHLSKey:](self, "isEqualToHLSKey:", v5);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
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

- (int64_t)method
{
  return self->_method;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)keyFormat
{
  return self->_keyFormat;
}

- (NSString)keyFormatVersions
{
  return self->_keyFormatVersions;
}

- (NSString)iv
{
  return self->_iv;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iv, 0);
  objc_storeStrong((id *)&self->_keyFormatVersions, 0);
  objc_storeStrong((id *)&self->_keyFormat, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
