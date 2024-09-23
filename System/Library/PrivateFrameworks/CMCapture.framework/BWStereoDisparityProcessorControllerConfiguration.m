@implementation BWStereoDisparityProcessorControllerConfiguration

- (void)setZoomingDisparityAllowed:(BOOL)a3
{
  self->_zoomingDisparityAllowed = a3;
}

- (void)setStillImageDepthDataType:(int)a3
{
  self->_stillImageDepthDataType = a3;
}

- (void)setShouldComputeDisparityWhenCalibrationFails:(BOOL)a3
{
  self->_shouldComputeDisparityWhenCalibrationFails = a3;
}

- (void)setPortTypesWithDepthSegmentationPortraitParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setDisparityOutputDimensions:(id)a3
{
  self->_disparityOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStereoDisparityProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: PortTypes:%@, Input:%dx%d, Disparity:%dx%d ZoomingDisparityAllowed:%d ComputeDisparityWhenCalibrationFails:%d Type:%@"), v4, self, -[NSArray componentsJoinedByString:](self->_portTypesWithDepthSegmentationPortraitParameters, "componentsJoinedByString:", CFSTR(",")), self->_inputDimensions.width, self->_inputDimensions.height, self->_disparityOutputDimensions.width, self->_disparityOutputDimensions.height, self->_zoomingDisparityAllowed, self->_shouldComputeDisparityWhenCalibrationFails, BWPhotoEncoderStringFromEncodingScheme(self->_stillImageDepthDataType));
}

- (NSArray)portTypesWithDepthSegmentationPortraitParameters
{
  return self->_portTypesWithDepthSegmentationPortraitParameters;
}

- ($2825F4736939C4A6D3AD43837233062D)inputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_inputDimensions;
}

- (void)setInputDimensions:(id)a3
{
  self->_inputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)disparityOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_disparityOutputDimensions;
}

- (BOOL)zoomingDisparityAllowed
{
  return self->_zoomingDisparityAllowed;
}

- (BOOL)shouldComputeDisparityWhenCalibrationFails
{
  return self->_shouldComputeDisparityWhenCalibrationFails;
}

- (int)stillImageDepthDataType
{
  return self->_stillImageDepthDataType;
}

@end
