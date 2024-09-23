@implementation AVApplePortraitMetadataInternal

- (AVApplePortraitMetadataInternal)init
{
  AVApplePortraitMetadataInternal *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVApplePortraitMetadataInternal;
  result = -[AVApplePortraitMetadataInternal init](&v4, sel_init);
  if (result)
  {
    v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    result->focusRectangle.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    result->focusRectangle.size = v3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVApplePortraitMetadataInternal;
  -[AVApplePortraitMetadataInternal dealloc](&v3, sel_dealloc);
}

- (int)version
{
  return self->version;
}

- (void)setVersion:(int)a3
{
  self->version = a3;
}

- (float)apertureFocalRatio
{
  return self->apertureFocalRatio;
}

- (void)setApertureFocalRatio:(float)a3
{
  self->apertureFocalRatio = a3;
}

- (float)minimumApertureFocalRatio
{
  return self->minimumApertureFocalRatio;
}

- (void)setMinimumApertureFocalRatio:(float)a3
{
  self->minimumApertureFocalRatio = a3;
}

- (float)maximumApertureFocalRatio
{
  return self->maximumApertureFocalRatio;
}

- (void)setMaximumApertureFocalRatio:(float)a3
{
  self->maximumApertureFocalRatio = a3;
}

- (float)portraitLightingEffectStrength
{
  return self->portraitLightingEffectStrength;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  self->portraitLightingEffectStrength = a3;
}

- (float)luminanceNoiseAmplitude
{
  return self->luminanceNoiseAmplitude;
}

- (void)setLuminanceNoiseAmplitude:(float)a3
{
  self->luminanceNoiseAmplitude = a3;
}

- (int)faceOrientation
{
  return self->faceOrientation;
}

- (void)setFaceOrientation:(int)a3
{
  self->faceOrientation = a3;
}

- (NSData)faceObservationsData
{
  return self->faceObservationsData;
}

- (void)setFaceObservationsData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSIndexSet)indexesOfShallowDepthOfFieldObservations
{
  return self->indexesOfShallowDepthOfFieldObservations;
}

- (void)setIndexesOfShallowDepthOfFieldObservations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CGRect)focusRectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->focusRectangle.origin.x;
  y = self->focusRectangle.origin.y;
  width = self->focusRectangle.size.width;
  height = self->focusRectangle.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFocusRectangle:(CGRect)a3
{
  self->focusRectangle = a3;
}

- (unsigned)SDOFRenderingVersion
{
  return self->SDOFRenderingVersion;
}

- (void)setSDOFRenderingVersion:(unsigned int)a3
{
  self->SDOFRenderingVersion = a3;
}

@end
