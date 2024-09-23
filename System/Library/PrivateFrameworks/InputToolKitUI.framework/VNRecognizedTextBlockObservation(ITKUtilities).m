@implementation VNRecognizedTextBlockObservation(ITKUtilities)

- (id)itk_textBlock
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "topCandidates:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
