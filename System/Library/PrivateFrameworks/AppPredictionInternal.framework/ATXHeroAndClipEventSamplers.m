@implementation ATXHeroAndClipEventSamplers

+ (id)defaultSampler
{
  return (id)objc_opt_new();
}

+ (id)debugSampler:(id)a3
{
  id v3;
  ATXHeroAndClipDebugSampler *v4;

  v3 = a3;
  v4 = -[ATXHeroAndClipDebugSampler initWithSampleIndices:]([ATXHeroAndClipDebugSampler alloc], "initWithSampleIndices:", v3);

  return v4;
}

@end
