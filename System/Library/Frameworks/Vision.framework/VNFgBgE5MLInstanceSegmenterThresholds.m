@implementation VNFgBgE5MLInstanceSegmenterThresholds

- (VNFgBgE5MLInstanceSegmenterThresholds)initWithRevision:(unint64_t)a3 error:(id *)a4
{
  VNFgBgE5MLInstanceSegmenterThresholds *v4;
  VNFgBgE5MLInstanceSegmenterThresholds *v5;
  void *v6;

  v4 = self;
  if (a3 == 1)
  {
    v4 = (VNFgBgE5MLInstanceSegmenterThresholds *)-[VNFgBgE5MLInstanceSegmenterThresholds initDefaultConfig](self, "initDefaultConfig", 1, a4);
    v5 = v4;
  }
  else
  {
    v5 = (VNFgBgE5MLInstanceSegmenterThresholds *)a4;
    if (a4)
    {
      +[VNFgBgInstanceSegmenterError genericErrorConfigDescription](VNFgBgInstanceSegmenterError, "genericErrorConfigDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNFgBgInstanceSegmenterError errorWithCode:description:](VNFgBgInstanceSegmenterError, "errorWithCode:description:", -4, v6);
      v5->super.isa = (Class)(id)objc_claimAutoreleasedReturnValue();

      v5 = 0;
    }
  }

  return v5;
}

- (id)initDefaultConfig
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNFgBgE5MLInstanceSegmenterThresholds;
  result = -[VNFgBgE5MLInstanceSegmenterThresholds init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_1A15FB7B0;
    *((_QWORD *)result + 3) = 0x429C00003ECCCCCDLL;
  }
  return result;
}

- (float)cocoConfidenceThreshold
{
  return self->_cocoConfidenceThreshold;
}

- (void)setCocoConfidenceThreshold:(float)a3
{
  self->_cocoConfidenceThreshold = a3;
}

- (float)miyoshiConfidenceThreshold
{
  return self->_miyoshiConfidenceThreshold;
}

- (void)setMiyoshiConfidenceThreshold:(float)a3
{
  self->_miyoshiConfidenceThreshold = a3;
}

- (float)maskThreshold
{
  return self->_maskThreshold;
}

- (void)setMaskThreshold:(float)a3
{
  self->_maskThreshold = a3;
}

- (float)IoUThreshold
{
  return self->_IoUThreshold;
}

- (void)setIoUThreshold:(float)a3
{
  self->_IoUThreshold = a3;
}

- (float)stabilityScoreThreshold
{
  return self->_stabilityScoreThreshold;
}

- (void)setStabilityScoreThreshold:(float)a3
{
  self->_stabilityScoreThreshold = a3;
}

- (float)defaultValidMinimumMaskPixelCount
{
  return self->_defaultValidMinimumMaskPixelCount;
}

- (void)setDefaultValidMinimumMaskPixelCount:(float)a3
{
  self->_defaultValidMinimumMaskPixelCount = a3;
}

@end
