@implementation AMSConcurrency

+ (void)logFaultFromSwiftConcurrencyOnInternalBuild
{
  swift_getObjCClassMetadata();
  static Concurrency.logFaultFromSwiftConcurrencyOnInternalBuild()();
}

- (AMSConcurrency)init
{
  return (AMSConcurrency *)Concurrency.init()();
}

@end
