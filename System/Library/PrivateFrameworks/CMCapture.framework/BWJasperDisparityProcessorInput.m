@implementation BWJasperDisparityProcessorInput

- (BWJasperDisparityProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWJasperDisparityProcessorInput;
  return -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v5, sel_initWithSettings_portType_, a3, a4);
}

- (void)dealloc
{
  opaqueCMSampleBuffer *colorBuffer;
  objc_super v4;

  colorBuffer = self->_colorBuffer;
  if (colorBuffer)
    CFRelease(colorBuffer);
  v4.receiver = self;
  v4.super_class = (Class)BWJasperDisparityProcessorInput;
  -[BWStillImageProcessorControllerInput dealloc](&v4, sel_dealloc);
}

- (void)setColorBufferPTS:(id *)a3 exposureTime:(double)a4
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_colorBufferPTS.value = *(_OWORD *)&a3->var0;
  self->_colorBufferPTS.epoch = var3;
  self->_colorBufferExposureTime = a4;
}

- (void)setColorBuffer:(opaqueCMSampleBuffer *)a3 type:(unint64_t)a4
{
  opaqueCMSampleBuffer *colorBuffer;
  opaqueCMSampleBuffer *v8;

  colorBuffer = self->_colorBuffer;
  if (colorBuffer)
    CFRelease(colorBuffer);
  if (a3)
    v8 = (opaqueCMSampleBuffer *)CFRetain(a3);
  else
    v8 = 0;
  self->_colorBuffer = v8;
  self->_colorBufferType = a4;
  if (-[BWJasperDisparityProcessorInput isReadyToExecute](self, "isReadyToExecute"))
    -[BWJasperDisparityProcessorInputDelegate inputReadyToExecute:](self->_delegate, "inputReadyToExecute:", self);
}

- (BOOL)isReadyToExecute
{
  return self->_colorBuffer || self->_skipProcessing;
}

- (void)executeNow
{
  -[BWJasperDisparityProcessorInputDelegate inputReadyToExecute:](self->_delegate, "inputReadyToExecute:", self);
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@, colorBuf:%p skip:%d"), v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_colorBuffer, self->_skipProcessing);
}

- (BWJasperDisparityProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)colorBufferType
{
  return self->_colorBufferType;
}

- (opaqueCMSampleBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (BOOL)skipProcessing
{
  return self->_skipProcessing;
}

- (void)setSkipProcessing:(BOOL)a3
{
  self->_skipProcessing = a3;
}

@end
