@implementation NWTLSParameters

- (NSData)TLSSessionID
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTLSSessionID:(NSData *)TLSSessionID
{
  objc_setProperty_atomic_copy(self, a2, TLSSessionID, 8);
}

- (NSSet)SSLCipherSuites
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSSLCipherSuites:(NSSet *)SSLCipherSuites
{
  objc_setProperty_atomic_copy(self, a2, SSLCipherSuites, 16);
}

- (NSUInteger)minimumSSLProtocolVersion
{
  return self->_minimumSSLProtocolVersion;
}

- (void)setMinimumSSLProtocolVersion:(NSUInteger)minimumSSLProtocolVersion
{
  self->_minimumSSLProtocolVersion = minimumSSLProtocolVersion;
}

- (NSUInteger)maximumSSLProtocolVersion
{
  return self->_maximumSSLProtocolVersion;
}

- (void)setMaximumSSLProtocolVersion:(NSUInteger)maximumSSLProtocolVersion
{
  self->_maximumSSLProtocolVersion = maximumSSLProtocolVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSLCipherSuites, 0);
  objc_storeStrong((id *)&self->_TLSSessionID, 0);
}

@end
