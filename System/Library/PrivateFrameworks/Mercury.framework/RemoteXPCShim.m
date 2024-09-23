@implementation RemoteXPCShim

+ (id)anonymousConnectedPairWithTargetQueue:(id)a3
{
  id v3;
  id v4;
  id v5;
  RemoteXPCPair *v6;

  v3 = a3;
  xpc_remote_connection_get_version_flags();
  xpc_remote_connection_create_connected_pair();

  v4 = 0;
  v5 = 0;
  v6 = -[RemoteXPCPair initWithClient:server:]([RemoteXPCPair alloc], "initWithClient:server:", v4, v5);

  return v6;
}

@end
