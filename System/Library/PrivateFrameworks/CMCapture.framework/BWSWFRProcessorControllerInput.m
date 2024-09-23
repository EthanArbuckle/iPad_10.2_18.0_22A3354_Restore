@implementation BWSWFRProcessorControllerInput

- (void)dealloc
{
  opaqueCMSampleBuffer *flashFrame;
  opaqueCMSampleBuffer *ambientFrame;
  objc_super v5;

  flashFrame = self->_flashFrame;
  if (flashFrame)
    CFRelease(flashFrame);
  ambientFrame = self->_ambientFrame;
  if (ambientFrame)
    CFRelease(ambientFrame);
  v5.receiver = self;
  v5.super_class = (Class)BWSWFRProcessorControllerInput;
  -[BWStillImageProcessorControllerInput dealloc](&v5, sel_dealloc);
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3
{
  BWStillImageProcessorControllerInputUpdatesDelegate *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;

  v5 = -[BWStillImageProcessorControllerInput delegate](self, "delegate");
  if (self->_addFrameFailed)
    goto LABEL_13;
  if (!a3)
    goto LABEL_12;
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v6)
    goto LABEL_12;
  v7 = v6;
  v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06878]), "BOOLValue");
  v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AE8]), "BOOLValue");
  if (v8)
  {
    if (!self->_ambientFrame)
    {
      self->_ambientFrame = a3;
      CFRetain(a3);
      -[BWStillImageProcessorControllerInputUpdatesDelegate input:addAmbientFrame:](v5, "input:addAmbientFrame:", self, self->_ambientFrame);
      goto LABEL_10;
    }
LABEL_12:
    self->_addFrameFailed = 1;
    goto LABEL_13;
  }
  if (!v9 || self->_flashFrame)
    goto LABEL_12;
  self->_flashFrame = a3;
  CFRetain(a3);
  -[BWStillImageProcessorControllerInputUpdatesDelegate input:addFlashFrame:](v5, "input:addFlashFrame:", self, self->_flashFrame);
LABEL_10:
  if (self->_addFrameFailed)
LABEL_13:
    -[BWStillImageProcessorControllerInputUpdatesDelegate inputAddFrameFailed:](v5, "inputAddFrameFailed:", self);
}

- (opaqueCMSampleBuffer)flashFrame
{
  return self->_flashFrame;
}

- (opaqueCMSampleBuffer)ambientFrame
{
  return self->_ambientFrame;
}

- (BOOL)addFrameFailed
{
  return self->_addFrameFailed;
}

@end
