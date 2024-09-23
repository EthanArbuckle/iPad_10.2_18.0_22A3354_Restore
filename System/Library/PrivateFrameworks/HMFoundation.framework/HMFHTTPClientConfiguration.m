@implementation HMFHTTPClientConfiguration

+ (id)defaultConfiguration
{
  return objc_alloc_init(HMFHTTPClientConfiguration);
}

- (HMFHTTPClientConfiguration)init
{
  HMFHTTPClientConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMFHTTPClientConfiguration;
  result = -[HMFHTTPClientConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_requiresEncryption = 0;
    result->_allowsAnonymousConnection = 0;
    result->_allowsCellularAccess = 1;
    result->_supportsWakeOnLAN = 0;
    result->_monitorsReachability = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[8] = -[HMFHTTPClientConfiguration requiresEncryption](self, "requiresEncryption");
  v4[9] = -[HMFHTTPClientConfiguration allowsAnonymousConnection](self, "allowsAnonymousConnection");
  v4[10] = -[HMFHTTPClientConfiguration allowsCellularAccess](self, "allowsCellularAccess");
  v4[11] = -[HMFHTTPClientConfiguration supportsWakeOnLAN](self, "supportsWakeOnLAN");
  v4[12] = -[HMFHTTPClientConfiguration monitorsReachability](self, "monitorsReachability");
  return v4;
}

- (BOOL)requiresEncryption
{
  return self->_requiresEncryption;
}

- (void)setRequiresEncryption:(BOOL)a3
{
  self->_requiresEncryption = a3;
}

- (BOOL)allowsAnonymousConnection
{
  return self->_allowsAnonymousConnection;
}

- (void)setAllowsAnonymousConnection:(BOOL)a3
{
  self->_allowsAnonymousConnection = a3;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)supportsWakeOnLAN
{
  return self->_supportsWakeOnLAN;
}

- (void)setSupportsWakeOnLAN:(BOOL)a3
{
  self->_supportsWakeOnLAN = a3;
}

- (BOOL)monitorsReachability
{
  return self->_monitorsReachability;
}

- (void)setMonitorsReachability:(BOOL)a3
{
  self->_monitorsReachability = a3;
}

@end
