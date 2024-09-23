@implementation HMDEventTriggerDependencyFactory

- (id)createTimerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a4, a3);
}

- (HMDLaunchHandler)launchHandler
{
  return +[HMDLaunchHandler sharedHandler](HMDLaunchHandler, "sharedHandler");
}

@end
