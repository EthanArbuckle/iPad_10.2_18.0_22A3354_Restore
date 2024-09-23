@implementation TKTokenKeyExchangeParameters

- (TKTokenKeyExchangeParameters)initWithParameters:(id)a3
{
  id v4;
  TKTokenKeyExchangeParameters *v5;
  TKTokenKeyExchangeParameters *v6;
  void *v7;
  uint64_t v8;
  NSData *sharedInfo;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TKTokenKeyExchangeParameters;
  v5 = -[TKTokenKeyExchangeParameters init](&v11, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6EF8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_requestedSize = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6F00]);
    v8 = objc_claimAutoreleasedReturnValue();
    sharedInfo = v6->_sharedInfo;
    v6->_sharedInfo = (NSData *)v8;

  }
  return v6;
}

- (NSInteger)requestedSize
{
  return self->_requestedSize;
}

- (NSData)sharedInfo
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedInfo, 0);
}

@end
