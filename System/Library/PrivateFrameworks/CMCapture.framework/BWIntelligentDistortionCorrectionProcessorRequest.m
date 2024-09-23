@implementation BWIntelligentDistortionCorrectionProcessorRequest

- (_QWORD)initWithInput:(void *)a3 delegate:
{
  _QWORD *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)BWIntelligentDistortionCorrectionProcessorRequest;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BWIntelligentDistortionCorrectionProcessorInput setDelegate:](self->_input, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)BWIntelligentDistortionCorrectionProcessorRequest;
  -[BWIntelligentDistortionCorrectionProcessorRequest dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self->_input, "captureSettings"), "settingsID");
  v6 = BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "captureType"));
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@ input:<%@ %p>"), v4, self, v5, v6, -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "portType"), objc_opt_class(), self->_input);
}

- (BWStillImageProcessorControllerDelegate)delegate
{
  return self->_delegate;
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (BWIntelligentDistortionCorrectionProcessorInput)input
{
  return self->_input;
}

@end
