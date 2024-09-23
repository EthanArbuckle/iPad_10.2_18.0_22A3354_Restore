@implementation BWScalerProcessorControllerInput

- (BWScalerProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4
{
  BWScalerProcessorControllerInput *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWScalerProcessorControllerInput;
  result = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v5, sel_initWithSettings_portType_, a3, a4);
  if (result)
    result->_applyZoom = 1;
  return result;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *frame;
  objc_super v4;

  frame = self->_frame;
  if (frame)
    CFRelease(frame);
  v4.receiver = self;
  v4.super_class = (Class)BWScalerProcessorControllerInput;
  -[BWStillImageProcessorControllerInput dealloc](&v4, sel_dealloc);
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3 bufferType:(unint64_t)a4
{
  opaqueCMSampleBuffer *frame;

  frame = self->_frame;
  self->_frame = a3;
  if (a3)
    CFRetain(a3);
  if (frame)
    CFRelease(frame);
  self->_bufferType = a4;
  -[BWStillImageProcessorControllerInputUpdatesDelegate inputChanged:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputChanged:", self);
}

- (opaqueCMSampleBuffer)frame
{
  return self->_frame;
}

- (unint64_t)bufferType
{
  return self->_bufferType;
}

- (BOOL)applyZoom
{
  return self->_applyZoom;
}

- (void)setApplyZoom:(BOOL)a3
{
  self->_applyZoom = a3;
}

@end
