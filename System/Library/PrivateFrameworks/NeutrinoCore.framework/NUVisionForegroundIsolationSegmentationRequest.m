@implementation NUVisionForegroundIsolationSegmentationRequest

- (NUVisionForegroundIsolationSegmentationRequest)initWithComposition:(id)a3
{
  NUVisionForegroundIsolationSegmentationRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUVisionForegroundIsolationSegmentationRequest;
  v3 = -[NURenderRequest initWithComposition:](&v5, sel_initWithComposition_, a3);
  -[NURenderRequest setSampleMode:](v3, "setSampleMode:", 2);
  return v3;
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([NUVisionForegroundIsolationSegmentationJob alloc], "initWithRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUVisionForegroundIsolationSegmentationRequest;
  return -[NURenderRequest copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end
