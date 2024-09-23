@implementation CDPLocalizedStringBuilder

+ (id)builderForKey:(id)a3
{
  NSString *v3;
  CDPLocalizedStringBuilder *v4;
  NSString *key;

  v3 = (NSString *)a3;
  v4 = objc_alloc_init(CDPLocalizedStringBuilder);
  key = v4->_key;
  v4->_key = v3;

  return v4;
}

+ (id)builderForKey:(id)a3 inTable:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "builderForKey:", a3);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (id)addDeviceClass:(id)a3
{
  NSString *key;
  void *v5;
  NSString *v6;
  NSString *v7;

  key = self->_key;
  _CDPSuffixForDeviceClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingString:](key, "stringByAppendingString:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = self->_key;
  self->_key = v6;

  return self;
}

- (id)addUnqualifiedDeviceClass:(id)a3
{
  NSString *key;
  void *v5;
  NSString *v6;
  NSString *v7;

  key = self->_key;
  _CDPSuffixForUnqualifiedDeviceClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingString:](key, "stringByAppendingString:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = self->_key;
  self->_key = v6;

  return self;
}

- (id)addSecretType:(unint64_t)a3
{
  NSString *key;
  const __CFString *v5;
  NSString *v6;
  NSString *v7;

  key = self->_key;
  if (a3 == 2)
    v5 = CFSTR("_PASSWORD");
  else
    v5 = CFSTR("_PASSCODE");
  -[NSString stringByAppendingString:](key, "stringByAppendingString:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = self->_key;
  self->_key = v6;

  return self;
}

- (id)localizedString
{
  return CDPLocalizedStringInTable(self->_key, self->_table);
}

- (id)currentKey
{
  return (id)-[NSString copy](self->_key, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
