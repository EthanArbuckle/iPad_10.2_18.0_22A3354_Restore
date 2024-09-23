@implementation VNTrackMaskRequestConfiguration

- (VNTrackMaskRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNTrackMaskRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNTrackMaskRequestConfiguration;
  result = -[VNStatefulRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_generateCropRect = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNTrackMaskRequestConfiguration;
  v4 = -[VNStatefulRequestConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (v4)
    objc_msgSend(v4, "setGenerateCropRect:", -[VNTrackMaskRequestConfiguration generateCropRect](self, "generateCropRect"));
  return v4;
}

- (BOOL)generateCropRect
{
  return self->_generateCropRect;
}

- (void)setGenerateCropRect:(BOOL)a3
{
  self->_generateCropRect = a3;
}

@end
