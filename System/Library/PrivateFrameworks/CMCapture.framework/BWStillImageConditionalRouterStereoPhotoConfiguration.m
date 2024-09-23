@implementation BWStillImageConditionalRouterStereoPhotoConfiguration

+ (id)stereoPhotoConfiguration
{
  return objc_alloc_init(BWStillImageConditionalRouterStereoPhotoConfiguration);
}

- (BWStillImageConditionalRouterStereoPhotoConfiguration)init
{
  BWStillImageConditionalRouterStereoPhotoConfiguration *v2;
  BWStillImageConditionalRouterStereoPhotoConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterStereoPhotoConfiguration;
  v2 = -[BWStillImageConditionalRouterConfiguration initWithNumberOfOutputs:](&v5, sel_initWithNumberOfOutputs_, 2);
  v3 = v2;
  if (v2)
    -[BWStillImageConditionalRouterConfiguration setShouldEmitSampleBufferDecisionProvider:](v2, "setShouldEmitSampleBufferDecisionProvider:", &__block_literal_global_117);
  return v3;
}

uint64_t __61__BWStillImageConditionalRouterStereoPhotoConfiguration_init__block_invoke(uint64_t a1, const void *a2, unsigned int *a3)
{
  *a3 = (BWStillImageProcessingFlagsForSampleBuffer(a2) >> 20) & 1;
  return 1;
}

- (unsigned)mainImageOutputIndex
{
  return 0;
}

- (unsigned)stereoPhotoOutoutIndex
{
  return 1;
}

@end
