@implementation AMSBAAKeychainItems

- (AMSBAAKeychainItems)initWithBAACert:(id)a3 BIKKey:(__SecKey *)a4 intermediateRootCert:(id)a5
{
  id v8;
  id v9;
  AMSBAAKeychainItems *v10;
  uint64_t v11;
  NSData *BAACert;
  id BIKKey;
  uint64_t v14;
  NSData *IntermediateRootCert;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSBAAKeychainItems;
  v10 = -[AMSBAAKeychainItems init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    BAACert = v10->_BAACert;
    v10->_BAACert = (NSData *)v11;

    BIKKey = v10->_BIKKey;
    v10->_BIKKey = a4;

    v14 = objc_msgSend(v9, "copy");
    IntermediateRootCert = v10->_IntermediateRootCert;
    v10->_IntermediateRootCert = (NSData *)v14;

  }
  return v10;
}

- (__SecKey)BIKKeyRef
{
  return (__SecKey *)self->_BIKKey;
}

- (NSData)BAACert
{
  return self->_BAACert;
}

- (NSData)IntermediateRootCert
{
  return self->_IntermediateRootCert;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IntermediateRootCert, 0);
  objc_storeStrong((id *)&self->_BAACert, 0);
  objc_storeStrong(&self->_BIKKey, 0);
}

@end
