@implementation BWRGBPersonSegmentationInferenceConfiguration

+ ($2ACC23B9A21F50F5CC728381CA870116)portraitVersion
{
  return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMake(1u, +[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"), 0);
}

+ (BOOL)isPortraitPrewarmingRequired
{
  return (objc_msgSend(a1, "portraitVersion") & 0xFFFFFFFFFFFFLL) == 1;
}

@end
