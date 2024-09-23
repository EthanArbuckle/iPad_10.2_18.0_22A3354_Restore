@implementation BWSoftISPProcessorControllerRequest

- (BWSoftISPProcessorControllerRequest)initWithInput:(id)a3 delegate:(id)a4
{
  BWSoftISPProcessorControllerRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWSoftISPProcessorControllerRequest;
  v4 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:](&v6, sel_initWithInput_delegate_, a3, a4);
  if (v4)
  {
    objc_opt_self();
    v4->_uniqueID = ++uniqueID_sCurrentUniqueID;
  }
  return v4;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *outputFrame;
  objc_super v4;

  outputFrame = self->_outputFrame;
  if (outputFrame)
    CFRelease(outputFrame);
  v4.receiver = self;
  v4.super_class = (Class)BWSoftISPProcessorControllerRequest;
  -[BWStillImageProcessorControllerRequest dealloc](&v4, sel_dealloc);
}

- (unint64_t)outputType
{
  return 1;
}

- (BOOL)readyForProcessing
{
  return -[BWStillImageProcessorControllerInput frame](-[BWStillImageProcessorControllerRequest input](self, "input"), "frame") != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSoftISPProcessorControllerRequest;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, UniqueID:%llu"), -[BWStillImageProcessorControllerRequest description](&v3, sel_description), self->_uniqueID);
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (opaqueCMSampleBuffer)outputFrame
{
  return self->_outputFrame;
}

- (void)setOutputFrame:(opaqueCMSampleBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
