@implementation BWStillImageConditionalRouterDepthConfiguration

+ (id)depthConfiguration
{
  return objc_alloc_init(BWStillImageConditionalRouterDepthConfiguration);
}

- (BWStillImageConditionalRouterDepthConfiguration)init
{
  BWStillImageConditionalRouterDepthConfiguration *v2;
  BWStillImageConditionalRouterDepthConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterDepthConfiguration;
  v2 = -[BWStillImageConditionalRouterConfiguration initWithNumberOfOutputs:](&v5, sel_initWithNumberOfOutputs_, 2);
  v3 = v2;
  if (v2)
  {
    -[BWStillImageConditionalRouterConfiguration setShouldEmitSampleBufferDecisionProvider:](v2, "setShouldEmitSampleBufferDecisionProvider:", &__block_literal_global_84);
    -[BWStillImageConditionalRouterConfiguration setShouldEmitNodeErrorDecisionProvider:](v3, "setShouldEmitNodeErrorDecisionProvider:", &__block_literal_global_86);
  }
  return v3;
}

uint64_t __55__BWStillImageConditionalRouterDepthConfiguration_init__block_invoke(uint64_t a1, const void *a2, _DWORD *a3)
{
  unint64_t v4;

  v4 = (unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
  if (a3)
    *a3 = v4 >> 62 != 0;
  return 1;
}

uint64_t __55__BWStillImageConditionalRouterDepthConfiguration_init__block_invoke_2(uint64_t a1, void *a2, _DWORD *a3)
{
  int v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "stillImageSettings"), "captureSettings"), "captureStreamSettings"), "firstObject"), "isSensorRawCapture");
  if (a3)
    *a3 = v4;
  return 1;
}

- (unsigned)yuvOutputIndex
{
  return 0;
}

- (unsigned)rawOutputIndex
{
  return 1;
}

@end
