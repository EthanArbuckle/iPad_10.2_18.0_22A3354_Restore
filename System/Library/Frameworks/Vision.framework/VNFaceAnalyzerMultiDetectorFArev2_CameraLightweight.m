@implementation VNFaceAnalyzerMultiDetectorFArev2_CameraLightweight

+ (const)modelVersionForOptions:(id)a3
{
  return &vision::mod::FaceprintAndAttributes::modelVersion_fa1_3_lightweight;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("facerec_fa1.3_lightweight_fp16.espresso");
}

- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3
{
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, CFSTR("faceprinting is not supported in camera lightweight mode"));
  return 0;
}

@end
