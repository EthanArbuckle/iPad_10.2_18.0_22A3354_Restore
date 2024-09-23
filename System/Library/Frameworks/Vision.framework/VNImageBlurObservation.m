@implementation VNImageBlurObservation

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNImageBlurScoreRequest");
}

- (float)blurMeasure
{
  void *v2;
  float v3;
  float v4;

  -[VNImageScoreObservation blurScore](self, "blurScore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

@end
