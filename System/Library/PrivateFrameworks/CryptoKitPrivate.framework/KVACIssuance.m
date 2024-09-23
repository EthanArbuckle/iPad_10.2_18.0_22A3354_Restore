@implementation KVACIssuance

- (KVACIssuance)initWithIssuance:(id)a3
{
  id v4;
  KVACIssuance *v5;
  uint64_t v6;
  NSData *keyId;
  uint64_t v8;
  NSData *issuanceData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KVACIssuance;
  v5 = -[KVACIssuance init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "keyId");
    v6 = objc_claimAutoreleasedReturnValue();
    keyId = v5->_keyId;
    v5->_keyId = (NSData *)v6;

    objc_msgSend(v4, "issuanceData");
    v8 = objc_claimAutoreleasedReturnValue();
    issuanceData = v5->_issuanceData;
    v5->_issuanceData = (NSData *)v8;

  }
  return v5;
}

- (NSData)keyId
{
  return self->_keyId;
}

- (NSData)issuanceData
{
  return self->_issuanceData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuanceData, 0);
  objc_storeStrong((id *)&self->_keyId, 0);
}

@end
