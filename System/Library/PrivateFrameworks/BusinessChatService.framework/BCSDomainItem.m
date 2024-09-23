@implementation BCSDomainItem

- (BCSDomainItem)initWithBase64EncodedShardString:(id)a3 expirationDate:(id)a4
{
  id v7;
  id v8;
  BCSDomainItem *v9;
  BCSDomainItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BCSDomainItem;
  v9 = -[BCSDomainItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_base64EncodedShardString, a3);
    objc_storeStrong((id *)&v10->_expirationDate, a4);
  }

  return v10;
}

- (BCSDomainBundleIdPatterns)domainBundleIDPatterns
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  BCSDomainBundleIdPatterns *v8;
  BCSDomainBundleIdPatterns *domainBundleIDPatterns;

  if (!self->_domainBundleIDPatterns)
  {
    -[BCSDomainItem base64EncodedShardString](self, "base64EncodedShardString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x24BDBCE50]);
      -[BCSDomainItem base64EncodedShardString](self, "base64EncodedShardString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithBase64EncodedString:options:", v6, 0);

      v8 = -[BCSDomainBundleIdPatterns initWithData:]([BCSDomainBundleIdPatterns alloc], "initWithData:", v7);
      domainBundleIDPatterns = self->_domainBundleIDPatterns;
      self->_domainBundleIDPatterns = v8;

    }
  }
  return self->_domainBundleIDPatterns;
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[BCSDomainItem expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

- (int64_t)type
{
  return 3;
}

- (NSString)domain
{
  void *v2;
  void *v3;

  -[BCSDomainItem domainBundleIDPatterns](self, "domainBundleIDPatterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)base64EncodedShardString
{
  return self->_base64EncodedShardString;
}

- (void)setBase64EncodedShardString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDomainBundleIDPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_domainBundleIDPatterns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainBundleIDPatterns, 0);
  objc_storeStrong((id *)&self->_base64EncodedShardString, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
