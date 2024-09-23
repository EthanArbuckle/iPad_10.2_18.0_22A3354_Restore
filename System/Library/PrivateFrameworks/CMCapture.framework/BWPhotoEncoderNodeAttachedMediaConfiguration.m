@implementation BWPhotoEncoderNodeAttachedMediaConfiguration

- (BOOL)propagatesDownstream
{
  return (self->_propagationMode & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (float)mainImageDownscalingFactor
{
  return self->_mainImageDownscalingFactor;
}

- (BWPhotoEncoderNodeAttachedMediaConfiguration)initWithMainImageDownscalingFactor:(float)a3 propagationMode:(int64_t)a4
{
  BWPhotoEncoderNodeAttachedMediaConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWPhotoEncoderNodeAttachedMediaConfiguration;
  result = -[BWPhotoEncoderNodeAttachedMediaConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_mainImageDownscalingFactor = a3;
    result->_dimensions.width = 0;
    result->_dimensions.height = 0;
    result->_propagationMode = a4;
  }
  return result;
}

- (BWPhotoEncoderNodeAttachedMediaConfiguration)initWithDimensions:(id)a3 propagationMode:(int64_t)a4
{
  BWPhotoEncoderNodeAttachedMediaConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWPhotoEncoderNodeAttachedMediaConfiguration;
  result = -[BWPhotoEncoderNodeAttachedMediaConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_mainImageDownscalingFactor = 0.0;
    result->_dimensions = ($470D365275581EF16070F5A11344F73E)a3;
    result->_propagationMode = a4;
  }
  return result;
}

- (BOOL)requiresEncoding
{
  return (unint64_t)(self->_propagationMode - 1) < 2;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: mainImageDownscalingFactor:%f, dimensions:%dx%d, mode:%@"), v4, self, self->_mainImageDownscalingFactor, self->_dimensions.width, self->_dimensions.height, BWPhotoEncoderStringForPhotoEncoderNodeAttachedMediaPropagationMode(self->_propagationMode));
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_dimensions;
}

- (int64_t)propagationMode
{
  return self->_propagationMode;
}

- (void)setPropagationMode:(int64_t)a3
{
  self->_propagationMode = a3;
}

@end
