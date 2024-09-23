@implementation BWLearnedNRInput

- (void)dealloc
{
  opaqueCMSampleBuffer *inputFrame;
  objc_super v4;

  inputFrame = self->_inputFrame;
  if (inputFrame)
    CFRelease(inputFrame);
  v4.receiver = self;
  v4.super_class = (Class)BWLearnedNRInput;
  -[BWStillImageProcessorControllerInput dealloc](&v4, sel_dealloc);
}

- (void)setInputFrame:(opaqueCMSampleBuffer *)a3
{
  opaqueCMSampleBuffer *inputFrame;
  opaqueCMSampleBuffer *v6;

  if (a3)
  {
    inputFrame = self->_inputFrame;
    if (inputFrame)
      CFRelease(inputFrame);
    v6 = (opaqueCMSampleBuffer *)CFRetain(a3);
    self->_inputFrame = v6;
    -[BWLearnedNRInputDelegate input:setInputFrame:](self->_delegate, "input:setInputFrame:", self, v6);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (BWLearnedNRInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (opaqueCMSampleBuffer)inputFrame
{
  return self->_inputFrame;
}

@end
