@implementation BWDeferredCaptureControllerRequest

- (BOOL)readyForProcessing
{
  return -[BWDeferredCaptureControllerInput readyForProcessing]((id *)-[BWStillImageProcessorControllerRequest input](self, "input"));
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

@end
