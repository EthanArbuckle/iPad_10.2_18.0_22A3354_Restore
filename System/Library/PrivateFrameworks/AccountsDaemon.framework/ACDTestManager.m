@implementation ACDTestManager

+ (id)testServer
{
  return (id)sTestServer;
}

- (void)startTestServer
{
  ACDServer *v2;
  void *v3;
  void *v6;

  if (sTestServer)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDTestManager.m"), 28, CFSTR("There can only be one test server running at a time"));

  }
  v2 = objc_alloc_init(ACDServer);
  v3 = (void *)sTestServer;
  sTestServer = (uint64_t)v2;

}

- (void)stopTestServer
{
  void *v2;

  if (sTestServer)
  {
    objc_msgSend((id)sTestServer, "shutdown");
    v2 = (void *)sTestServer;
    sTestServer = 0;

  }
}

- (NSXPCListenerEndpoint)remoteAccountStoreEndpoint
{
  void *v2;
  void *v3;

  objc_msgSend((id)sTestServer, "accountStoreListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (NSXPCListenerEndpoint)remoteOAuthSignerEndpoint
{
  void *v2;
  void *v3;

  objc_msgSend((id)sTestServer, "oauthSignerListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

@end
