@implementation BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration

- (unsigned)mainImageOutputIndex
{
  return 0;
}

- (unsigned)deepFusionImageOutputIndex
{
  return 1;
}

- (BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration)init
{
  BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration *v2;
  BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration;
  v2 = -[BWStillImageConditionalRouterConfiguration initWithNumberOfOutputs:](&v5, sel_initWithNumberOfOutputs_, 2);
  v3 = v2;
  if (v2)
    -[BWStillImageConditionalRouterConfiguration setShouldEmitSampleBufferDecisionProvider:](v2, "setShouldEmitSampleBufferDecisionProvider:", &__block_literal_global_108);
  return v3;
}

+ (id)optimizedEnhancedPortraitConfiguration
{
  return objc_alloc_init(BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration);
}

uint64_t __75__BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, _DWORD *a3)
{
  *a3 = 0;
  if (objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageBufferFrameType"), 0), "unsignedIntValue") == 13)*a3 = 1;
  return 1;
}

@end
