@implementation CSSharedUserFSConnection

void __CSSharedUserFSConnection_block_invoke()
{
  CSXPCConnection *v0;
  void *v1;

  v0 = -[CSXPCConnection initWithMachServiceName:]([CSXPCConnection alloc], "initWithMachServiceName:", CFSTR("com.apple.spotlight.userfs"));
  v1 = (void *)CSSharedUserFSConnection_sCSUserFSConnection;
  CSSharedUserFSConnection_sCSUserFSConnection = (uint64_t)v0;

}

@end
