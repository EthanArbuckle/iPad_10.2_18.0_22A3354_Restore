@implementation MKHTTPProxyAuthorization

- (MKHTTPProxyAuthorization)initWithHeaderValue:(id)a3
{
  id v4;
  MKHTTPProxyAuthorization *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  MKHTTPProxyAuthorization *v13;
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKHTTPProxyAuthorization;
  v5 = -[MKHTTPProxyAuthorization init](&v16, sel_init);
  if (v5)
  {
    if (!objc_msgSend(v4, "hasPrefix:", CFSTR("Bearer ")))
    {
LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v4, "substringWithRange:", objc_msgSend(CFSTR("Bearer "), "length"), objc_msgSend(v4, "length") - objc_msgSend(CFSTR("Bearer "), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v6, 0);
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v9)
    {
      +[MKLog log](MKLog, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MKHTTPContentPayload initWithHeaderValue:].cold.2((uint64_t)v5, v9, v10);
LABEL_11:

      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MKLog log](MKLog, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MKHTTPContentPayload initWithHeaderValue:].cold.1((uint64_t)v5, v10);
      goto LABEL_11;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPProxyAuthorization setIdentifier:](v5, "setIdentifier:", v11);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("signature"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPProxyAuthorization setSignature:](v5, "setSignature:", v12);

  }
  v13 = v5;
LABEL_13:

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
