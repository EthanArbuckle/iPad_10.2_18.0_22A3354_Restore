@implementation OSLogLogdAdminConnection

void __OSLogLogdAdminConnection_block_invoke()
{
  xpc_connection_t mach_service;
  void *v1;

  mach_service = xpc_connection_create_mach_service("com.apple.logd.admin", 0, 2uLL);
  v1 = (void *)OSLogLogdAdminConnection_xconn;
  OSLogLogdAdminConnection_xconn = (uint64_t)mach_service;

  if (OSLogLogdAdminConnection_xconn)
  {
    xpc_connection_set_event_handler((xpc_connection_t)OSLogLogdAdminConnection_xconn, &__block_literal_global_47);
    xpc_connection_activate((xpc_connection_t)OSLogLogdAdminConnection_xconn);
  }
}

@end
