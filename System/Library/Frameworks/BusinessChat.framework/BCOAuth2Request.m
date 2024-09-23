@implementation BCOAuth2Request

- (id)_initWithDictionary:(id)a3 URLProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  BCOAuth2Request *v12;
  id *p_isa;
  BCOAuth2Request *v14;
  objc_super v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("businessIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v8 == (void *)v9)
  {

  }
  else
  {
    v10 = (void *)v9;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("businessIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v16.receiver = self;
      v16.super_class = (Class)BCOAuth2Request;
      v12 = -[BCOAuth2Request init](&v16, sel_init);
      p_isa = (id *)&v12->super.isa;
      if (v12)
      {
        objc_storeStrong((id *)&v12->_businessIdentifier, v11);
        objc_storeStrong(p_isa + 2, a4);
      }
      self = p_isa;
      v14 = self;
      goto LABEL_10;
    }
  }
  LogCategory_Daemon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21C655000, v11, OS_LOG_TYPE_ERROR, "Unable to create BCAuthenticationRequest: missing 'business identifier' in payload", buf, 2u);
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)debugDescription
{
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v2 = self;
  if (self)
  {
    objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "oauth2");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("Request Type"));

    objc_msgSend(v2, "businessIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("BusinessIdentifer"));

    objc_msgSend(v3, "build");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (NSDictionary)dictionaryValue
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

- (NSString)businessIdentifier
{
  return self->_businessIdentifier;
}

- (void)setBusinessIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_businessIdentifier, a3);
}

- (BCBaseOAuth2Protocol)oauth2
{
  return self->_oauth2;
}

- (void)setOauth2:(id)a3
{
  objc_storeStrong((id *)&self->_oauth2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oauth2, 0);
  objc_storeStrong((id *)&self->_businessIdentifier, 0);
}

@end
