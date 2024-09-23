@implementation BWSoftISPProcessorControllerInput

- (BWSoftISPProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4
{
  return -[BWSoftISPProcessorControllerInput initWithSettings:portType:gdcEnabled:](self, "initWithSettings:portType:gdcEnabled:", a3, a4, 0);
}

- (BWSoftISPProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4 gdcEnabled:(BOOL)a5
{
  BWSoftISPProcessorControllerInput *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWSoftISPProcessorControllerInput;
  result = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v7, sel_initWithSettings_portType_, a3, a4);
  if (result)
    result->_gdcEnabled = a5;
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
  v4.super_class = (Class)BWSoftISPProcessorControllerInput;
  -[BWStillImageProcessorControllerInput dealloc](&v4, sel_dealloc);
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3
{
  -[BWSoftISPProcessorControllerInput addFrame:processingMode:transferOwnership:](self, "addFrame:processingMode:transferOwnership:", a3, 0, 0);
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3 processingMode:(int)a4
{
  -[BWSoftISPProcessorControllerInput addFrame:processingMode:transferOwnership:](self, "addFrame:processingMode:transferOwnership:", a3, *(_QWORD *)&a4, 0);
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3 processingMode:(int)a4 transferOwnership:(BOOL)a5
{
  opaqueCMSampleBuffer *frame;

  frame = self->_frame;
  if (frame)
    CFRelease(frame);
  if (!a5 && a3)
    a3 = (opaqueCMSampleBuffer *)CFRetain(a3);
  self->_frame = a3;
  self->_processingMode = a4;
  -[BWStillImageProcessorControllerInputUpdatesDelegate input:addFrame:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "input:addFrame:", self, self->_frame);
}

- (id)description
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)BWSoftISPProcessorControllerInput;
  v4 = -[BWStillImageProcessorControllerInput description](&v6, sel_description);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, processingMode:%@ frame:%@ gdcEnabled:%d"), v4, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_processingMode), BWVideoSampleBufferToDisplayString(), self->_gdcEnabled);
}

- (opaqueCMSampleBuffer)frame
{
  return self->_frame;
}

- (void)setFrame:(opaqueCMSampleBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)processingMode
{
  return self->_processingMode;
}

- (BOOL)gdcEnabled
{
  return self->_gdcEnabled;
}

@end
