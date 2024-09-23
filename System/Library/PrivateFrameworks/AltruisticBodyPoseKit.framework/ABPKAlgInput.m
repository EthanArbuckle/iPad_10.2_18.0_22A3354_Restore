@implementation ABPKAlgInput

- (ABPKAlgInput)init
{
  ABPKAlgInput *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABPKAlgInput;
  result = -[ABPKAlgInput init](&v3, sel_init);
  if (result)
  {
    result->_isDepthDataValid = 0;
    result->_depthMap = 0;
    result->_depthConfidenceBuffer = 0;
  }
  return result;
}

- (__CVBuffer)image
{
  return self->_image;
}

- (void)setImage:(__CVBuffer *)a3
{
  self->_image = a3;
}

- (CGSize)imageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (__n128)imageCameraIntrinsics
{
  return a1[5];
}

- (__n128)setImageCameraIntrinsics:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

- (ABPKImagePreProcessingParams)imagePreProcessingParams
{
  return self->_imagePreProcessingParams;
}

- (void)setImagePreProcessingParams:(id)a3
{
  self->_imagePreProcessingParams = (ABPKImagePreProcessingParams *)a3;
}

- (__CVBuffer)depthMap
{
  return self->_depthMap;
}

- (void)setDepthMap:(__CVBuffer *)a3
{
  self->_depthMap = a3;
}

- (__CVBuffer)depthConfidenceBuffer
{
  return self->_depthConfidenceBuffer;
}

- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3
{
  self->_depthConfidenceBuffer = a3;
}

- (BOOL)isDepthDataValid
{
  return self->_isDepthDataValid;
}

- (void)setIsDepthDataValid:(BOOL)a3
{
  self->_isDepthDataValid = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
