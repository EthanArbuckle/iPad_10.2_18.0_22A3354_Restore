@implementation MTRWiFiNetworkDiagnosticsClusterConnectionStatusEvent

- (MTRWiFiNetworkDiagnosticsClusterConnectionStatusEvent)init
{
  MTRWiFiNetworkDiagnosticsClusterConnectionStatusEvent *v2;
  MTRWiFiNetworkDiagnosticsClusterConnectionStatusEvent *v3;
  NSNumber *connectionStatus;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTRWiFiNetworkDiagnosticsClusterConnectionStatusEvent;
  v2 = -[MTRWiFiNetworkDiagnosticsClusterConnectionStatusEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    connectionStatus = v2->_connectionStatus;
    v2->_connectionStatus = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRWiFiNetworkDiagnosticsClusterConnectionStatusEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTRWiFiNetworkDiagnosticsClusterConnectionStatusEvent);
  objc_msgSend_connectionStatus(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConnectionStatus_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: connectionStatus:%@; >"), v5, self->_connectionStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(NSNumber *)connectionStatus
{
  objc_setProperty_nonatomic_copy(self, a2, connectionStatus, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionStatus, 0);
}

@end
