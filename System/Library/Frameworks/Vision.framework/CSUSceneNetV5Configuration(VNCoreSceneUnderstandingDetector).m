@implementation CSUSceneNetV5Configuration(VNCoreSceneUnderstandingDetector)

- (uint64_t)VNNewInstanceWithError:()VNCoreSceneUnderstandingDetector
{
  return objc_msgSend((id)objc_opt_class(), "sceneNetV5ConfigurationForRevision:error:", objc_msgSend(a1, "revision"), a3);
}

@end
