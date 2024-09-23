@implementation CESRAudioSamplingUtilities

+ (BOOL)isUniformlySampled:(unint64_t)a3 fromTotal:(unint64_t)a4
{
  return arc4random_uniform(a4) < a3;
}

+ (BOOL)isUniformlySampledWithPercentage:(unint64_t)a3
{
  return +[CESRAudioSamplingUtilities isUniformlySampled:fromTotal:](CESRAudioSamplingUtilities, "isUniformlySampled:fromTotal:", a3, 100);
}

+ (BOOL)isUniformlySampledWithSamplingRate:(float)a3
{
  return +[CESRAudioSamplingUtilities isUniformlySampledWithPercentage:](CESRAudioSamplingUtilities, "isUniformlySampledWithPercentage:", vcvtas_u32_f32(a3 * 100.0));
}

@end
