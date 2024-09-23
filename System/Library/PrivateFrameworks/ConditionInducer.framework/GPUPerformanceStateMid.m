@implementation GPUPerformanceStateMid

+ (id)description
{
  return CFSTR("Set GPU Performance State to medium level. GPU workloads will attempt to run at medium performance state unless thermally throttled.");
}

+ (id)profileFriendlyName
{
  return CFSTR("Medium");
}

- (GPUPerformanceStateMid)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GPUPerformanceStateMid;
  return -[GPUPerformanceStateDefault initWithGPUPerformanceState:](&v3, sel_initWithGPUPerformanceState_, 2);
}

@end
