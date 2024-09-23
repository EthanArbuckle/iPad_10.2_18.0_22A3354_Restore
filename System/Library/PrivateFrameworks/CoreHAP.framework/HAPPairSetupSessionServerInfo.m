@implementation HAPPairSetupSessionServerInfo

- (HAPPairSetupSessionServerInfo)initWithProductData:(id)a3 maxTries:(int)a4
{
  uint64_t v4;
  id v6;
  HAPPairSetupSessionServerInfo *v7;
  void *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAPPairSetupSessionServerInfo;
  v7 = -[HAPPairSetupSessionServerInfo init](&v10, sel_init);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    -[HAPPairSetupSessionServerInfo setProductData:](v7, "setProductData:", v8);

    -[HAPPairSetupSessionServerInfo setMaxTries:](v7, "setMaxTries:", v4);
  }

  return v7;
}

- (NSString)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
  objc_storeStrong((id *)&self->_productData, a3);
}

- (int)maxTries
{
  return self->_maxTries;
}

- (void)setMaxTries:(int)a3
{
  self->_maxTries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productData, 0);
}

@end
