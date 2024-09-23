@implementation BWDeepZoomInferenceConfiguration

- (NSString)outputAttachedMediaKey
{
  int v2;

  v2 = -[BWInferenceConfiguration inferenceType](self, "inferenceType");
  if (v2 == 160)
    return (NSString *)CFSTR("DeepZoomOutput");
  if (v2 == 159)
    return (NSString *)CFSTR("DeepTransferStereoPhotoOutput");
  return 0;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_stereoPhotoOutputDimensions;
}

- (void)setStereoPhotoOutputDimensions:(id)a3
{
  self->_stereoPhotoOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

@end
