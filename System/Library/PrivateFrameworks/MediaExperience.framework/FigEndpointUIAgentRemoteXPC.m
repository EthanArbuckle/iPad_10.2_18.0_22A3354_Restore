@implementation FigEndpointUIAgentRemoteXPC

void __FigEndpointUIAgentRemoteXPC_EnsureClientEstablished_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = (void *)objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("EndpointUIAgent_ServerConnectionDied"), *MEMORY[0x1E0CA54A0], 0);
  FigEndpointUIAgentRemoteXPC_EnsureClientEstablished_err = FigXPCRemoteClientCreate();

}

@end
