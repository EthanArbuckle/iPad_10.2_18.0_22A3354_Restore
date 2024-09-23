@implementation MSCMSTimestampAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.16.2.14"), 0);
}

- (MSCMSTimestampAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v5;
  MSCMSTimestampAttribute *v6;
  MSCMSTimestampAttributeInternal *v7;
  MSCMSTimestampAttributeInternal *v8;
  MSCMSTimestampAttribute *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MSCMSTimestampAttribute;
  v5 = a3;
  v6 = -[MSCMSTimestampAttribute init](&v11, sel_init);
  v7 = [MSCMSTimestampAttributeInternal alloc];
  v8 = -[MSCMSTimestampAttributeInternal initWithAttribute:error:](v7, "initWithAttribute:error:", v5, a4, v11.receiver, v11.super_class);

  -[MSCMSTimestampAttribute setTimestampAttribute:](v6, "setTimestampAttribute:", v8);
  -[MSCMSTimestampAttribute timestampAttribute](v6, "timestampAttribute");
  v9 = (MSCMSTimestampAttribute *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v9 = v6;

  return v9;
}

- (MSCMSTimestampAttribute)initWithServerURL:(id)a3 chainRequested:(BOOL)a4
{
  id v7;
  MSCMSTimestampAttribute *v8;
  MSCMSTimestampAttribute *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSCMSTimestampAttribute;
  v8 = -[MSCMSTimestampAttribute init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serverURL, a3);
    v9->_certChainRequested = a4;
  }

  return v9;
}

- (MSCMSTimestampAttribute)initWithServerURL:(id)a3
{
  return -[MSCMSTimestampAttribute initWithServerURL:chainRequested:](self, "initWithServerURL:chainRequested:", a3, 0);
}

- (MSCMSTimestampAttribute)initWithTimestampToken:(id)a3
{
  id v3;
  MSCMSTimestampAttribute *v4;
  MSCMSTimestampAttributeInternal *v5;
  id v6;
  void *v7;
  MSCMSTimestampAttribute *v8;
  NSObject *v9;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)MSCMSTimestampAttribute;
  v3 = a3;
  v4 = -[MSCMSTimestampAttribute init](&v12, sel_init);
  v11 = 0;
  v5 = -[MSCMSTimestampAttributeInternal initWithTimestampToken:error:]([MSCMSTimestampAttributeInternal alloc], "initWithTimestampToken:error:", v3, &v11);

  v6 = v11;
  -[MSCMSTimestampAttribute setTimestampAttribute:](v4, "setTimestampAttribute:", v5);

  -[MSCMSTimestampAttribute timestampAttribute](v4, "timestampAttribute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v4;
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_292);
    v9 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[MSCMSTimestampAttribute initWithTimestampToken:]";
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1DEED9000, v9, OS_LOG_TYPE_ERROR, "%s failed with %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

void __50__MSCMSTimestampAttribute_initWithTimestampToken___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

- (BOOL)verifyTimestamps:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MSCMSTimestampAttribute timestampAttribute](self, "timestampAttribute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "verifyTimestamp:error:", v6, a4);

  return (char)a4;
}

- (id)encodeAttributeWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[MSCMSTimestampAttribute timestampAttribute](self, "timestampAttribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeAttributeWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)timestampTime
{
  void *v2;
  void *v3;

  -[MSCMSTimestampAttribute timestampAttribute](self, "timestampAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestampToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (MSCMSTimestampAttributeInternal)timestampAttribute
{
  return (MSCMSTimestampAttributeInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestampAttribute:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServerURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)certChainRequested
{
  return self->_certChainRequested;
}

- (void)setCertChainRequested:(BOOL)a3
{
  self->_certChainRequested = a3;
}

- (MSCMSSignerInfo)singerInfo
{
  return (MSCMSSignerInfo *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (MSOID)digestAlgorithm
{
  return (MSOID *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestAlgorithm, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_singerInfo, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_timestampAttribute, 0);
}

@end
