@implementation CHSKeepAliveService

- (CHSKeepAliveService)init
{
  void *v3;
  CHSKeepAliveService *v4;

  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CHSKeepAliveService initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (CHSKeepAliveService)initWithConnection:(id)a3
{
  id v5;
  CHSKeepAliveService *v6;
  CHSKeepAliveService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSKeepAliveService;
  v6 = -[CHSKeepAliveService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (id)acquireKeepAliveAssertionForExtensionBundleIdentifier:(id)a3 reason:(id)a4 error:(id *)a5
{
  -[CHSChronoServicesConnection acquireKeepAliveAssertionForExtensionBundleIdentifier:reason:error:](self->_connection, "acquireKeepAliveAssertionForExtensionBundleIdentifier:reason:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
