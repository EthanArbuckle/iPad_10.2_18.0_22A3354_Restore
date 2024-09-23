@implementation BCError

- (BCError)initWithCode:(id)a3 domain:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  BCError *v11;
  BCError *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BCError;
  v11 = -[BCError init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[BCError setCode:](v11, "setCode:", v8);
    -[BCError setDomain:](v12, "setDomain:", v9);
    -[BCError setMessage:](v12, "setMessage:", v10);
  }

  return v12;
}

- (BCError)initWithDictionary:(id)a3
{
  id v4;
  BCError *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BCError *v15;
  NSObject *v16;
  const char *v17;
  uint8_t v19[16];
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BCError;
  v5 = -[BCError init](&v20, sel_init);
  if (!v5)
    goto LABEL_15;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v10)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v8)
  {
    LogCategory_Daemon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)v19 = 0;
    v17 = "Unable to create BCError: missing 'code' in payload";
LABEL_22:
    _os_log_error_impl(&dword_21C655000, v16, OS_LOG_TYPE_ERROR, v17, v19, 2u);
    goto LABEL_23;
  }
  if (!v11)
  {
    LogCategory_Daemon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)v19 = 0;
    v17 = "Unable to create BCError: missing 'domain' in payload";
    goto LABEL_22;
  }
  if (!v14)
  {
    LogCategory_Daemon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      v17 = "Unable to create BCError: missing 'message' in payload";
      goto LABEL_22;
    }
LABEL_23:

    v15 = 0;
    goto LABEL_24;
  }
  -[BCError setCode:](v5, "setCode:", v8);
  -[BCError setDomain:](v5, "setDomain:", v11);
  -[BCError setMessage:](v5, "setMessage:", v14);

LABEL_15:
  v15 = v5;
LABEL_24:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *code;
  id v5;

  code = self->_code;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", code, CFSTR("code"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domain, CFSTR("domain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));

}

- (BCError)initWithCoder:(id)a3
{
  id v4;
  BCError *v5;
  uint64_t v6;
  NSNumber *code;
  uint64_t v8;
  NSString *domain;
  uint64_t v10;
  NSString *message;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCError;
  v5 = -[BCError init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("code"));
    v6 = objc_claimAutoreleasedReturnValue();
    code = v5->_code;
    v5->_code = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v8 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v10 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_code, CFSTR("code"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_domain, CFSTR("domain"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_message, CFSTR("message"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v4;
}

- (NSNumber)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_storeStrong((id *)&self->_code, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
