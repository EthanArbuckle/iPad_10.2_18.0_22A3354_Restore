@implementation BWDeepZoomProcessorInput

- (void)dealloc
{
  opaqueCMSampleBuffer *sampleBuffer;
  objc_super v4;

  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
    CFRelease(sampleBuffer);

  v4.receiver = self;
  v4.super_class = (Class)BWDeepZoomProcessorInput;
  -[BWStillImageProcessorControllerInput dealloc](&v4, sel_dealloc);
}

- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferType:(unint64_t)a4
{
  opaqueCMSampleBuffer *sampleBuffer;

  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
  {
    CFRelease(sampleBuffer);
    self->_sampleBuffer = 0;
  }
  self->_sampleBufferSet = 1;
  self->_bufferType = a4;
  if (a3)
    self->_sampleBuffer = (opaqueCMSampleBuffer *)CFRetain(a3);
  -[BWDeepZoomProcessorInputDelegate inputSampleBufferReceived:](self->_delegate, "inputSampleBufferReceived:", self);
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unint64_t)bufferType
{
  return self->_bufferType;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@ : sbuf:%p"), v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_sampleBuffer);
}

- (BOOL)sampleBufferSet
{
  return self->_sampleBufferSet;
}

- (void)setSampleBufferSet:(BOOL)a3
{
  self->_sampleBufferSet = a3;
}

- (BWDeepZoomProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)isEnqueued
{
  return self->_enqueued;
}

- (void)setEnqueued:(BOOL)a3
{
  self->_enqueued = a3;
}

@end
