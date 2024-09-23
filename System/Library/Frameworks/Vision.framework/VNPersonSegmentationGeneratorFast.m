@implementation VNPersonSegmentationGeneratorFast

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("personsegmentation-si-01.espresso");
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  objc_msgSend(a1, "inputImageBlobName", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)inputImageBlobName
{
  __CFString *v2;

  v2 = CFSTR("input_data__0");
  return CFSTR("input_data__0");
}

+ (id)inputMaskBlobName
{
  __CFString *v2;

  v2 = CFSTR("prev_mask__0");
  return CFSTR("prev_mask__0");
}

+ (id)outputMaskBlobNames
{
  if (+[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::onceToken != -1)
    dispatch_once(&+[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::onceToken, &__block_literal_global_20820);
  return (id)+[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::outputMaskBlobNames;
}

+ (id)outputMaskBlobNameToRequestKey
{
  if (+[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::onceToken != -1)
    dispatch_once(&+[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::onceToken, &__block_literal_global_26_20817);
  return (id)+[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
}

+ (BOOL)rotateImageToMatchNetworkOrientation
{
  return 0;
}

+ (BOOL)inputMaskRequired
{
  return 0;
}

void __67__VNPersonSegmentationGeneratorFast_outputMaskBlobNameToRequestKey__block_invoke()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = VNPersonSegmentationGeneratorFastOutputBlobNameMask;
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
  +[VNPersonSegmentationGeneratorFast outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey = v2;

}

void __56__VNPersonSegmentationGeneratorFast_outputMaskBlobNames__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = VNPersonSegmentationGeneratorFastOutputBlobNameMask;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::outputMaskBlobNames;
  +[VNPersonSegmentationGeneratorFast outputMaskBlobNames]::outputMaskBlobNames = v0;

}

@end
