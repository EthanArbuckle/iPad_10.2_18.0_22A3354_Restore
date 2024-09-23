@implementation NSXPCConnection(XPC_Connection_Uniquifier)

- (void)uniquify
{
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  v3[1] = 0;
  MEMORY[0x1B5E5139C](v3);
  objc_msgSend(a1, "_xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_set_oneshot_instance();

}

@end
