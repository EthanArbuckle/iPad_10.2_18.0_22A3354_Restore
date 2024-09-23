@implementation MNNavigationServicePeer

- (MNNavigationServicePeer)initWithConnection:(id)a3
{
  id v4;
  MNNavigationServicePeer *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSString *peerIdentifier;
  MNNavigationServicePeer *v14;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  _DWORD buffer[2];
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MNNavigationServicePeer;
  v5 = -[GEONavdPeer initWithXPCConnection:](&v16, sel_initWithXPCConnection_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForEntitlement:", CFSTR("application-identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "processIdentifier");
    v8 = v7;
    if (!v6)
    {
      v9 = proc_pidpath(v7, buffer, 0x400u);
      if (v9 < 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pid = %d"), v8);
        v6 = objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v6;
          _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEBUG, "No application ID or process name found. Using process ID as ID: %@", buf, 0xCu);
        }
      }
      else
      {
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v9, 4);
        -[NSObject lastPathComponent](v10, "lastPathComponent");
        v6 = objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v6;
          _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEBUG, "No application ID found. Using process name as ID: %@", buf, 0xCu);
        }

      }
    }
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      buffer[0] = 67109378;
      buffer[1] = v8;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_INFO, "Allocating new peer for process identifier: %d, peer identifier: %@", (uint8_t *)buffer, 0x12u);
    }

    peerIdentifier = v5->_peerIdentifier;
    v5->_peerIdentifier = (NSString *)v6;

    v5->_processIdentifier = v8;
    v14 = v5;
  }

  return v5;
}

- (void)clearConnection
{
  uint64_t v3;

  v3 = (int)*MEMORY[0x1E0D277A0];
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "setExportedObject:", 0);
}

- (id)auditToken
{
  return (id)objc_msgSend(*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D27798]), "auditToken");
}

- (BOOL)isEntitled
{
  return -[GEONavdPeer hasEntitlement:](self, "hasEntitlement:", CFSTR("com.apple.navigation.spi"));
}

- (id)description
{
  NSString *peerIdentifier;
  void *v3;
  uint64_t processIdentifier;
  void *v5;
  void *v6;

  peerIdentifier = self->_peerIdentifier;
  v3 = (void *)MEMORY[0x1E0CB3940];
  processIdentifier = self->_processIdentifier;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D277A0]), "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("('%@', pid: %d, remoteObjectProxy: %p)"), peerIdentifier, processIdentifier, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)peerIdentifier
{
  return self->_peerIdentifier;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
}

@end
