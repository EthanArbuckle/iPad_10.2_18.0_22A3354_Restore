@implementation _BSProtobufTranslator_BSAuditToken

+ (id)protobufSchema
{
  return +[BSProtobufSerialization buildSchemaForClass:builder:](BSProtobufSerialization, "buildSchemaForClass:builder:", a1, &__block_literal_global_33);
}

- (id)initProtobufTranslatorForObject:(id)a3
{
  id v4;
  _BSProtobufTranslator_BSAuditToken *v5;
  uint64_t v6;
  NSData *tokenData;
  uint64_t v8;
  NSString *bundleID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BSProtobufTranslator_BSAuditToken;
  v5 = -[_BSProtobufTranslator_BSAuditToken init](&v11, sel_init);
  if (v5)
  {
    -[BSAuditToken _auditTokenAsData]((uint64_t)v4);
    v6 = objc_claimAutoreleasedReturnValue();
    tokenData = v5->_tokenData;
    v5->_tokenData = (NSData *)v6;

    objc_msgSend(v4, "bundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

  }
  return v5;
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return -[BSAuditToken _initWithData:bundleID:]([BSAuditToken alloc], self->_tokenData, self->_bundleID);
}

- (NSData)tokenData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTokenData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_tokenData, 0);
}

@end
