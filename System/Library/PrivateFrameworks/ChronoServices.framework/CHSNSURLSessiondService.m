@implementation CHSNSURLSessiondService

- (CHSNSURLSessiondService)init
{
  void *v3;
  CHSNSURLSessiondService *v4;

  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CHSNSURLSessiondService initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (CHSNSURLSessiondService)initWithConnection:(id)a3
{
  id v5;
  CHSNSURLSessiondService *v6;
  CHSNSURLSessiondService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSNSURLSessiondService;
  v6 = -[CHSNSURLSessiondService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (id)URLSessionDidCompleteForExtensionWithBundleIdentifier:(id)a3 info:(id)a4
{
  -[CHSChronoServicesConnection _URLSessionDidCompleteForExtensionWithBundleIdentifier:info:](self->_connection, "_URLSessionDidCompleteForExtensionWithBundleIdentifier:info:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
