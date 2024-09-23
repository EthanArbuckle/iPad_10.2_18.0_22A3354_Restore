@implementation HMMTRReaderConfig

- (NSData)readerPrivateKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReaderPrivateKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)readerPublicKeyExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReaderPublicKeyExternalRepresentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)readerGroupIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReaderGroupIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)groupResolvingKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGroupResolvingKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupResolvingKey, 0);
  objc_storeStrong((id *)&self->_readerGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_readerPublicKeyExternalRepresentation, 0);
  objc_storeStrong((id *)&self->_readerPrivateKey, 0);
}

@end
