@implementation BWStillImageProcessorControllerRequest

- (BWStillImageProcessorControllerRequest)initWithInput:(id)a3 delegate:(id)a4
{
  BWStillImageProcessorControllerRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWStillImageProcessorControllerRequest;
  v6 = -[BWStillImageProcessorControllerRequest init](&v8, sel_init);
  if (v6)
  {
    v6->_input = (BWStillImageProcessorControllerInput *)a3;
    v6->_delegate = (BWStillImageProcessorControllerDelegate *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BWStillImageProcessorControllerInput setDelegate:](self->_input, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorControllerRequest;
  -[BWStillImageProcessorControllerRequest dealloc](&v3, sel_dealloc);
}

- (BOOL)readyForProcessing
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[BWStillImageProcessorControllerRequest readyForProcessing] Must be implemented by subclasses."), 0));
}

- (unint64_t)outputType
{
  return 0;
}

- (opaqueCMSampleBuffer)outputFrame
{
  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@ captureRequestIdentifier:%@"), v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self->_input, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "captureType")), -[BWStillImageProcessorControllerInput portType](self->_input, "portType"), -[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageProcessorControllerInput settings](self->_input, "settings"), "captureRequestIdentifier"));
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (BWStillImageProcessorControllerInput)input
{
  return self->_input;
}

- (BWStillImageProcessorControllerDelegate)delegate
{
  return self->_delegate;
}

@end
