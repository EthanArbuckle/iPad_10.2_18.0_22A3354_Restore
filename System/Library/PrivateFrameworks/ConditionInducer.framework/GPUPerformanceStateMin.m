@implementation GPUPerformanceStateMin

+ (id)description
{
  return CFSTR("Set GPU Performance State to minimum level. GPU workloads will run at minimum performance state.");
}

+ (id)profileFriendlyName
{
  return CFSTR("Minimum");
}

- (GPUPerformanceStateMin)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GPUPerformanceStateMin;
  return -[GPUPerformanceStateDefault initWithGPUPerformanceState:](&v3, sel_initWithGPUPerformanceState_, 1);
}

@end
