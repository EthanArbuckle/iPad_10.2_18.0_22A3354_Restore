@implementation MFConnectionSettings

- (void)dealloc
{
  __CFString *connectionServiceType;
  objc_super v4;

  connectionServiceType = self->_connectionServiceType;
  if (connectionServiceType)
    CFRelease(connectionServiceType);
  v4.receiver = self;
  v4.super_class = (Class)MFConnectionSettings;
  -[MFConnectionSettings dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setHostname:", -[MFConnectionSettings hostname](self, "hostname"));
  objc_msgSend(v4, "setServiceName:", -[MFConnectionSettings serviceName](self, "serviceName"));
  objc_msgSend(v4, "setCertUIService:", -[MFConnectionSettings certUIService](self, "certUIService"));
  objc_msgSend(v4, "setPortNumber:", -[MFConnectionSettings portNumber](self, "portNumber"));
  objc_msgSend(v4, "setConnectionServiceType:", -[MFConnectionSettings connectionServiceType](self, "connectionServiceType"));
  objc_msgSend(v4, "setUsesSSL:", -[MFConnectionSettings usesSSL](self, "usesSSL"));
  objc_msgSend(v4, "setUsesOpportunisticSockets:", -[MFConnectionSettings usesOpportunisticSockets](self, "usesOpportunisticSockets"));
  objc_msgSend(v4, "setTryDirectSSL:", -[MFConnectionSettings tryDirectSSL](self, "tryDirectSSL"));
  objc_msgSend(v4, "setAllowsTrustPrompt:", -[MFConnectionSettings allowsTrustPrompt](self, "allowsTrustPrompt"));
  objc_msgSend(v4, "setSourceApplicationBundleIdentifier:", -[MFConnectionSettings sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier"));
  objc_msgSend(v4, "setAccountIdentifier:", -[MFConnectionSettings accountIdentifier](self, "accountIdentifier"));
  objc_msgSend(v4, "setNetworkAccountIdentifier:", -[MFConnectionSettings networkAccountIdentifier](self, "networkAccountIdentifier"));
  return v4;
}

- (__CFString)connectionServiceType
{
  return self->_connectionServiceType;
}

- (void)setConnectionServiceType:(__CFString *)a3
{
  __CFString *connectionServiceType;
  __CFString *v6;

  connectionServiceType = self->_connectionServiceType;
  if (connectionServiceType != a3)
  {
    if (connectionServiceType)
      CFRelease(connectionServiceType);
    if (a3)
      v6 = (__CFString *)CFRetain(a3);
    else
      v6 = 0;
    self->_connectionServiceType = v6;
  }
}

- (id)description
{
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const __CFString *sourceApplicationBundleIdentifier;

  v2 = "";
  if (self->_usesSSL)
    v3 = "";
  else
    v3 = "No";
  v4 = "direct";
  if (!self->_tryDirectSSLConnection)
    v4 = "indirect";
  if (self->_usesOpportunisticSockets)
    v5 = " (opportunistic)";
  else
    v5 = "";
  v6 = " disallows trust prompt";
  if (self->_allowsTrustPrompt)
    v6 = "";
  sourceApplicationBundleIdentifier = (const __CFString *)self->_sourceApplicationBundleIdentifier;
  if (sourceApplicationBundleIdentifier)
    v2 = ", source application: ";
  else
    sourceApplicationBundleIdentifier = &stru_1E81CBE50;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<%@>:%d %s SSL (%s)%s%s%s%@"), self->_hostname, self->_serviceName, self->_portNumber, v3, v4, v5, v6, v2, sourceApplicationBundleIdentifier);
}

- (BOOL)tryDirectSSL
{
  return self->_tryDirectSSLConnection;
}

- (void)setTryDirectSSL:(BOOL)a3
{
  self->_tryDirectSSLConnection = a3;
}

- (NSString)certUIService
{
  return self->_certUIService;
}

- (void)setCertUIService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)networkAccountIdentifier
{
  return self->_networkAccountIdentifier;
}

- (void)setNetworkAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unsigned int)a3
{
  self->_portNumber = a3;
}

- (BOOL)usesSSL
{
  return self->_usesSSL;
}

- (void)setUsesSSL:(BOOL)a3
{
  self->_usesSSL = a3;
}

- (BOOL)usesOpportunisticSockets
{
  return self->_usesOpportunisticSockets;
}

- (void)setUsesOpportunisticSockets:(BOOL)a3
{
  self->_usesOpportunisticSockets = a3;
}

- (BOOL)allowsTrustPrompt
{
  return self->_allowsTrustPrompt;
}

- (void)setAllowsTrustPrompt:(BOOL)a3
{
  self->_allowsTrustPrompt = a3;
}

@end
