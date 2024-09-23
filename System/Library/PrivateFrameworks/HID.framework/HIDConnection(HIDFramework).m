@implementation HIDConnection(HIDFramework)

- (uint64_t)getAuditToken:()HIDFramework
{
  return IOHIDEventSystemConnectionGetAuditToken();
}

@end
