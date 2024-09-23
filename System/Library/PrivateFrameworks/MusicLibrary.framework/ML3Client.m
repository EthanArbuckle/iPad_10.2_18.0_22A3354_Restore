@implementation ML3Client

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ML3Client bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ [%lld]>"), v4, self, v5, -[ML3Client processID](self, "processID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)processID
{
  return self->_processID;
}

- (ML3Client)initWithConnection:(id)a3
{
  id v5;
  ML3Client *v6;
  ML3Client *v7;
  NSString *bundleID;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ML3Client;
  v6 = -[ML3Client init](&v10, sel_init);
  v7 = v6;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_processID = objc_msgSend(v5, "processIdentifier");
    objc_msgSend(v5, "auditToken");
    CPCopyBundleIdentifierAndTeamFromAuditToken();
    bundleID = v7->_bundleID;
    v7->_bundleID = 0;

  }
  return v7;
}

- (BOOL)isDaemonClient
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "daemonClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ML3Client isEqual:](self, "isEqual:", v3);

  return (char)self;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

+ (ML3Client)daemonClient
{
  return (ML3Client *)+[ML3DaemonClient sharedDaemonClient](ML3DaemonClient, "sharedDaemonClient");
}

- (ML3Client)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("You must provide %@ with an XPC connection. Use initWithConnection: instead."), objc_opt_class());

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (ML3Client)processClient
{
  return (ML3Client *)+[ML3ProcessClient sharedProcessClient](ML3ProcessClient, "sharedProcessClient");
}

@end
