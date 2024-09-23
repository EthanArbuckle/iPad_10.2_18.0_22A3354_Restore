@implementation SOSmartcardEntry

- (NSString)upn
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUpn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)certName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCertName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)tokenID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTokenID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)issuer
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIssuer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (__SecIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(__SecIdentity *)a3
{
  self->_identity = a3;
}

- (NSData)persistientRef
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersistientRef:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistientRef, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_certName, 0);
  objc_storeStrong((id *)&self->_upn, 0);
}

@end
