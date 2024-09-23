@implementation _EXExtensionPoint

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_opt_class();
  v4 = objc_opt_new();
  -[_EXExtensionPoint identifier](self, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  -[_EXExtensionPoint SDKDictionary](self, "SDKDictionary");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  *(_DWORD *)(v4 + 8) = -[_EXExtensionPoint platform](self, "platform");
  *(_QWORD *)(v4 + 32) = -[_EXExtensionPoint variant](self, "variant");
  -[_EXExtensionPoint url](self, "url");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v9;

  return (id)v4;
}

- (void)reset
{
  NSString *identifier;
  NSDictionary *SDKDictionary;
  NSURL *url;

  identifier = self->_identifier;
  self->_identifier = 0;

  SDKDictionary = self->_SDKDictionary;
  self->_SDKDictionary = 0;

  self->_platform = 0;
  url = self->_url;
  self->_variant = 0;
  self->_url = 0;

}

- (NSString)description
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)SDKDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSDKDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)platform
{
  return self->_platform;
}

- (void)setPlatform:(unsigned int)a3
{
  self->_platform = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDomain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_SDKDictionary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
