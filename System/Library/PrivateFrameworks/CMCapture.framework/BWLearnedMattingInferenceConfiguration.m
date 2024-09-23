@implementation BWLearnedMattingInferenceConfiguration

- (void)setTargetAspectRatio:(float)a3
{
  self->_targetAspectRatio = a3;
}

- (void)setMainImageDownscalingFactor:(float)a3
{
  self->_mainImageDownscalingFactor = a3;
}

- (void)setAppliesFinalCropRect:(BOOL)a3
{
  self->_appliesFinalCropRect = a3;
}

- (BOOL)produceLowResPersonMaskClone
{
  return self->_produceLowResPersonMaskClone;
}

- (float)targetAspectRatio
{
  return self->_targetAspectRatio;
}

- (float)mainImageDownscalingFactor
{
  return self->_mainImageDownscalingFactor;
}

- (BOOL)appliesFinalCropRect
{
  return self->_appliesFinalCropRect;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWLearnedMattingInferenceConfiguration;
  -[BWTiledEspressoInferenceConfiguration dealloc](&v2, sel_dealloc);
}

- (void)setProduceLowResPersonMaskClone:(BOOL)a3
{
  self->_produceLowResPersonMaskClone = a3;
}

@end
