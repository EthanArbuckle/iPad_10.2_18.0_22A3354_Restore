@implementation BWSmartStyleRenderingProcessorInput

- (void)dealloc
{
  opaqueCMSampleBuffer *inputFrame;
  objc_super v4;

  inputFrame = self->_inputFrame;
  if (inputFrame)
    CFRelease(inputFrame);
  v4.receiver = self;
  v4.super_class = (Class)BWSmartStyleRenderingProcessorInput;
  -[BWStillImageProcessorControllerInput dealloc](&v4, sel_dealloc);
}

- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferType:(unint64_t)a4
{
  BWStillImageProcessorControllerInputUpdatesDelegate *v7;
  opaqueCMSampleBuffer *inputFrame;

  v7 = -[BWStillImageProcessorControllerInput delegate](self, "delegate");
  self->_inputBufferType = a4;
  if (self->_addFrameFailed)
    goto LABEL_7;
  if (!a3 || !CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0))
  {
    self->_addFrameFailed = 1;
LABEL_7:
    -[BWStillImageProcessorControllerInputUpdatesDelegate inputAddFrameFailed:](v7, "inputAddFrameFailed:", self);
    return;
  }
  inputFrame = self->_inputFrame;
  self->_inputFrame = a3;
  CFRetain(a3);
  if (inputFrame)
    CFRelease(inputFrame);
  -[BWStillImageProcessorControllerInputUpdatesDelegate input:addFrame:](v7, "input:addFrame:", self, self->_inputFrame);
  if (self->_addFrameFailed)
    goto LABEL_7;
}

- (BWSmartStyleRenderingProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  BWSmartStyleRenderingProcessorInput *v5;
  BWSmartStyleRenderingProcessorInput *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWSmartStyleRenderingProcessorInput;
  v5 = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v8, sel_initWithSettings_portType_, a3, a4);
  v6 = v5;
  if (v5)
    v5->_applyOnly = -[BWSmartStyleRenderingProcessorInput _isApplyOnly:]((_BOOL8)v5, a3);
  return v6;
}

- (BOOL)_isApplyOnly:(_BOOL8)result
{
  int v3;
  _BOOL4 v6;

  if (result)
  {
    v3 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    v6 = (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) == 0 && v3 != 2 && v3 != 11;
    if (v3 == 12)
      v6 = 0;
    return v3 != 10 && v6;
  }
  return result;
}

- (opaqueCMSampleBuffer)inputFrame
{
  return self->_inputFrame;
}

- (BOOL)addFrameFailed
{
  return self->_addFrameFailed;
}

- (BOOL)applyOnly
{
  return self->_applyOnly;
}

- (BOOL)isEnqueued
{
  return self->_enqueued;
}

- (void)setEnqueued:(BOOL)a3
{
  self->_enqueued = a3;
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unint64_t)bufferType
{
  return self->_bufferType;
}

- (unint64_t)inputBufferType
{
  return self->_inputBufferType;
}

@end
