@implementation IONotificationPortSetDispatchQueue

uint64_t __IONotificationPortSetDispatchQueue_block_invoke()
{
  return dispatch_mig_server();
}

@end
