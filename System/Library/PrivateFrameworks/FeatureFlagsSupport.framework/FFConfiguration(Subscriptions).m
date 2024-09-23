@implementation FFConfiguration(Subscriptions)

- (void)addSubscription:()Subscriptions atLevel:.cold.1(NSString *format)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN CLIENT OF LIBFEATUREFLAGS: Requested level is invalid";
  qword_1EFEC93F0 = (uint64_t)format;
  __break(1u);
  NSLog(format);
}

@end
