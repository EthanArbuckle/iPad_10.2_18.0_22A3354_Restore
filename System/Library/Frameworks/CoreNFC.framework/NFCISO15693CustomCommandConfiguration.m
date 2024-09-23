@implementation NFCISO15693CustomCommandConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NFCISO15693CustomCommandConfiguration;
  v5 = -[NFCTagCommandConfiguration copyWithZone:](&v9, sel_copyWithZone_);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setManufacturerCode:", self->_manufacturerCode);
    objc_msgSend(v6, "setCustomCommandCode:", self->_customCommandCode);
    v7 = (void *)-[NSData copyWithZone:](self->_requestParameters, "copyWithZone:", a3);
    objc_msgSend(v6, "setRequestParameters:", v7);

    objc_msgSend(v6, "setFlags:", self->_flags);
  }
  return v6;
}

- (NFCISO15693CustomCommandConfiguration)initWithManufacturerCode:(NSUInteger)manufacturerCode customCommandCode:(NSUInteger)customCommandCode requestParameters:(NSData *)requestParameters
{
  return -[NFCISO15693CustomCommandConfiguration initWithManufacturerCode:customCommandCode:requestParameters:maximumRetries:retryInterval:](self, "initWithManufacturerCode:customCommandCode:requestParameters:maximumRetries:retryInterval:", manufacturerCode, customCommandCode, requestParameters, 0, 0.0);
}

- (NFCISO15693CustomCommandConfiguration)initWithManufacturerCode:(NSUInteger)manufacturerCode customCommandCode:(NSUInteger)customCommandCode requestParameters:(NSData *)requestParameters maximumRetries:(NSUInteger)maximumRetries retryInterval:(NSTimeInterval)retryInterval
{
  NSData *v12;
  NFCISO15693CustomCommandConfiguration *v13;
  NFCISO15693CustomCommandConfiguration *v14;
  uint64_t v15;
  NSData *v16;
  objc_super v18;
  objc_super v19;
  objc_super v20;

  v12 = requestParameters;
  v20.receiver = self;
  v20.super_class = (Class)NFCISO15693CustomCommandConfiguration;
  v13 = -[NFCISO15693CustomCommandConfiguration init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_manufacturerCode = manufacturerCode;
    v13->_customCommandCode = customCommandCode;
    v15 = -[NSData copy](v12, "copy");
    v16 = v14->_requestParameters;
    v14->_requestParameters = (NSData *)v15;

    v19.receiver = v14;
    v19.super_class = (Class)NFCISO15693CustomCommandConfiguration;
    -[NFCTagCommandConfiguration setMaximumRetries:](&v19, sel_setMaximumRetries_, maximumRetries);
    v18.receiver = v14;
    v18.super_class = (Class)NFCISO15693CustomCommandConfiguration;
    -[NFCTagCommandConfiguration setRetryInterval:](&v18, sel_setRetryInterval_, retryInterval);
    v14->_flags = 2;
  }

  return v14;
}

- (id)asNSDataWithError:(id *)a3
{
  void *v6;
  char flags;

  if (self->_customCommandCode - 224 > 0xFFFFFFFFFFFFFFBFLL)
  {
    v6 = (void *)objc_opt_new();
    flags = self->_flags;
    objc_msgSend(v6, "appendBytes:length:", &flags, 1);
    flags = self->_customCommandCode;
    objc_msgSend(v6, "appendBytes:length:", &flags, 1);
    flags = self->_manufacturerCode;
    objc_msgSend(v6, "appendBytes:length:", &flags, 1);
    objc_msgSend(v6, "appendData:", self->_requestParameters);
    return v6;
  }
  else
  {
    if (a3)
    {
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 300);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

- (NSUInteger)manufacturerCode
{
  return self->_manufacturerCode;
}

- (void)setManufacturerCode:(NSUInteger)manufacturerCode
{
  self->_manufacturerCode = manufacturerCode;
}

- (NSUInteger)customCommandCode
{
  return self->_customCommandCode;
}

- (void)setCustomCommandCode:(NSUInteger)customCommandCode
{
  self->_customCommandCode = customCommandCode;
}

- (NSData)requestParameters
{
  return self->_requestParameters;
}

- (void)setRequestParameters:(NSData *)requestParameters
{
  objc_setProperty_nonatomic_copy(self, a2, requestParameters, 48);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);
}

@end
