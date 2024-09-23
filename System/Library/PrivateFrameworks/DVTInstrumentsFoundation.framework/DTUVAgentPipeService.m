@implementation DTUVAgentPipeService

+ (void)registerCapabilities:(id)a3
{
  objc_msgSend(a3, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.ultraviolet.agent-pipe"), 1, a1);
}

- (id)createExternalService:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  DTUVSharedServiceFactory(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newAgentPipeService:error:", v5, a4);

  return v7;
}

@end
