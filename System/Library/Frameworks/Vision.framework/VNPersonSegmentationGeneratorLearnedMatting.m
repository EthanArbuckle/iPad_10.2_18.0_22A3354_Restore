@implementation VNPersonSegmentationGeneratorLearnedMatting

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("learned-matting-1512x2016.espresso");
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  objc_msgSend(a1, "inputImageBlobName", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)inputImageBlobName
{
  __CFString *v2;

  v2 = CFSTR("image");
  return CFSTR("image");
}

+ (id)inputMaskBlobName
{
  __CFString *v2;

  v2 = CFSTR("alpha");
  return CFSTR("alpha");
}

+ (id)outputMaskBlobNames
{
  if (+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::onceToken != -1)
    dispatch_once(&+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::onceToken, &__block_literal_global_17521);
  return (id)+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::outputMaskBlobNames;
}

+ (id)outputMaskBlobNameToRequestKey
{
  if (+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::onceToken != -1)
    dispatch_once(&+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::onceToken, &__block_literal_global_26_17518);
  return (id)+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
}

+ (BOOL)rotateImageToMatchNetworkOrientation
{
  return 1;
}

+ (BOOL)inputMaskRequired
{
  return 1;
}

void __77__VNPersonSegmentationGeneratorLearnedMatting_outputMaskBlobNameToRequestKey__block_invoke()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = VNPersonSegmentationGeneratorLearnedMattingOutputBlobNameMask;
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
  +[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey = v2;

}

void __66__VNPersonSegmentationGeneratorLearnedMatting_outputMaskBlobNames__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = VNPersonSegmentationGeneratorLearnedMattingOutputBlobNameMask;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::outputMaskBlobNames;
  +[VNPersonSegmentationGeneratorLearnedMatting outputMaskBlobNames]::outputMaskBlobNames = v0;

}

@end
