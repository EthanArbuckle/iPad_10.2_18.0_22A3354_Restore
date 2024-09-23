@implementation VNRecognizeDocumentsRequest(MediaAnalysis)

+ (id)mad_defaultRequest
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CEDFE0]);
  objc_msgSend(v0, "setRevision:", 1);
  if (DeviceHasANE())
  {
    objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setProcessingDevice:", v1);

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setRecognitionLanguages:", v2);

  objc_msgSend(v0, "setMaximumCandidateCount:", 3);
  objc_msgSend(v0, "setUsesLanguageDetection:", 1);
  return v0;
}

@end
