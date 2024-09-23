@implementation GPUPerformanceStateMax

+ (id)description
{
  return CFSTR("Set GPU Performance State to maximum level. GPU workloads will attempt to run at maximum performance state unless thermally throttled.");
}

+ (id)profileFriendlyName
{
  return CFSTR("Maximum");
}

- (GPUPerformanceStateMax)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GPUPerformanceStateMax;
  return -[GPUPerformanceStateDefault initWithGPUPerformanceState:](&v3, sel_initWithGPUPerformanceState_, 3);
}

@end
