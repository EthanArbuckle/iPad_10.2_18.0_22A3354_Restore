@implementation CHSAppIntentsXPCListenerEndpointProvider

- (CHSAppIntentsXPCListenerEndpointProvider)initWithBundleIdentifier:(id)a3
{
  id v4;
  CHSAppIntentsXPCListenerEndpointProvider *v5;
  uint64_t v6;
  CHSChronoServicesConnection *connection;
  uint64_t v8;
  NSString *bundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSAppIntentsXPCListenerEndpointProvider;
  v5 = -[CHSAppIntentsXPCListenerEndpointProvider init](&v11, sel_init);
  if (v5)
  {
    +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    connection = v5->_connection;
    v5->_connection = (CHSChronoServicesConnection *)v6;

    v8 = objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3
{
  -[CHSChronoServicesConnection getAppIntentsXPCListenerEndpointForBundleIdentifier:completion:](self->_connection, "getAppIntentsXPCListenerEndpointForBundleIdentifier:completion:", self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
