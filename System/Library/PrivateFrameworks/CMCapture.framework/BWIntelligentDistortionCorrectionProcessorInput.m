@implementation BWIntelligentDistortionCorrectionProcessorInput

- (BWIntelligentDistortionCorrectionProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  BWIntelligentDistortionCorrectionProcessorInput *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWIntelligentDistortionCorrectionProcessorInput;
  result = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v5, sel_initWithSettings_portType_, a3, a4);
  if (result)
    result->_applyZoom = 1;
  return result;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *image;
  objc_super v4;

  image = self->_image;
  if (image)
    CFRelease(image);

  v4.receiver = self;
  v4.super_class = (Class)BWIntelligentDistortionCorrectionProcessorInput;
  -[BWStillImageProcessorControllerInput dealloc](&v4, sel_dealloc);
}

- (BOOL)receivedAllInputs
{
  return self->_imageSet;
}

- (void)addImage:(opaqueCMSampleBuffer *)a3 imageBufferType:(unint64_t)a4
{
  opaqueCMSampleBuffer *image;

  image = self->_image;
  if (image)
  {
    CFRelease(image);
    self->_image = 0;
  }
  self->_imageSet = 1;
  self->_imageBufferType = a4;
  if (a3)
    self->_image = (opaqueCMSampleBuffer *)CFRetain(a3);
  -[BWIntelligentDistortionCorrectionProcessorInputDelegate inputReceivedNewInputData:](self->_delegate, "inputReceivedNewInputData:", self);
}

- (opaqueCMSampleBuffer)image
{
  return self->_image;
}

- (unint64_t)imageBufferType
{
  return self->_imageBufferType;
}

- (id)description
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  void *v7;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID");
  v5 = BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType"));
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@ : gdc:%d idc:%d zoom:%d image:%p imageSet:%d (type:%@) delegate:%p"), v3, self, v4, v5, -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_processGeometricDistortionCorrection, self->_processIntelligentDistortionCorrection, self->_applyZoom, self->_image, self->_imageSet, BWStillImageProcessorTypeToShortString(self->_imageBufferType), self->_delegate);
}

- (BOOL)processIntelligentDistortionCorrection
{
  return self->_processIntelligentDistortionCorrection;
}

- (void)setProcessIntelligentDistortionCorrection:(BOOL)a3
{
  self->_processIntelligentDistortionCorrection = a3;
}

- (BOOL)processGeometricDistortionCorrection
{
  return self->_processGeometricDistortionCorrection;
}

- (void)setProcessGeometricDistortionCorrection:(BOOL)a3
{
  self->_processGeometricDistortionCorrection = a3;
}

- (BOOL)applyZoom
{
  return self->_applyZoom;
}

- (void)setApplyZoom:(BOOL)a3
{
  self->_applyZoom = a3;
}

- (BWIntelligentDistortionCorrectionProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSData)geometricDistortionCorrectionForwardPolynomial
{
  return self->_geometricDistortionCorrectionForwardPolynomial;
}

- (void)setGeometricDistortionCorrectionForwardPolynomial:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSData)geometricDistortionCorrectionInversePolynomial
{
  return self->_geometricDistortionCorrectionInversePolynomial;
}

- (void)setGeometricDistortionCorrectionInversePolynomial:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)applyStereoRectificationHomography
{
  return self->_applyStereoRectificationHomography;
}

- (void)setApplyStereoRectificationHomography:(BOOL)a3
{
  self->_applyStereoRectificationHomography = a3;
}

- (__n128)stereoRectificationInverseHomography
{
  return a1[8];
}

- (__n128)setStereoRectificationInverseHomography:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  return result;
}

- (BOOL)useBilinearInterpolation
{
  return self->_useBilinearInterpolation;
}

- (void)setUseBilinearInterpolation:(BOOL)a3
{
  self->_useBilinearInterpolation = a3;
}

- (CGPoint)geometricDistortionCorrectionOpticalCenterOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_geometricDistortionCorrectionOpticalCenterOffset.x;
  y = self->_geometricDistortionCorrectionOpticalCenterOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGeometricDistortionCorrectionOpticalCenterOffset:(CGPoint)a3
{
  self->_geometricDistortionCorrectionOpticalCenterOffset = a3;
}

- (BOOL)geometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset
{
  return self->_geometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset;
}

- (void)setGeometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset:(BOOL)a3
{
  self->_geometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset = a3;
}

- (void)setReceivedAllInputs:(BOOL)a3
{
  self->_receivedAllInputs = a3;
}

@end
