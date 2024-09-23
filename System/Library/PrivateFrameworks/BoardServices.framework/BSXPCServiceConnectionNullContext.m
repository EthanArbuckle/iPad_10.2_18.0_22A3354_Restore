@implementation BSXPCServiceConnectionNullContext

+ (_QWORD)nullContext
{
  objc_opt_self();
  return -[BSXPCServiceConnectionRootContext _initWithType:eDesc:]([BSXPCServiceConnectionNullContext alloc], 0x43u, CFSTR("<null>"));
}

- (BOOL)isClient
{
  return 1;
}

@end
