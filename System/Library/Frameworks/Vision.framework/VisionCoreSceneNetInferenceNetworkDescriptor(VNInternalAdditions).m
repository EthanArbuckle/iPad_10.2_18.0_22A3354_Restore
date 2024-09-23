@implementation VisionCoreSceneNetInferenceNetworkDescriptor(VNInternalAdditions)

- (id)VNSceneprintFromData:()VNInternalAdditions labelsAndConfidences:originatingRequestSpecifier:error:
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v10 = a4;
  objc_msgSend(a1, "VNSceneprintFromData:originatingRequestSpecifier:error:", a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (v10)
      objc_msgSend(v11, "setValue:forKey:", v10, CFSTR("_labelsAndConfidence"));
    v13 = v12;
  }

  return v12;
}

@end
