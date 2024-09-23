@implementation BWRedEyeReductionControllerInput

- (void)dealloc
{
  opaqueCMSampleBuffer *primaryImage;
  opaqueCMSampleBuffer *auxImage;
  objc_super v5;

  primaryImage = self->_primaryImage;
  if (primaryImage)
    CFRelease(primaryImage);
  auxImage = self->_auxImage;
  if (auxImage)
    CFRelease(auxImage);

  v5.receiver = self;
  v5.super_class = (Class)BWRedEyeReductionControllerInput;
  -[BWStillImageProcessorControllerInput dealloc](&v5, sel_dealloc);
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3 faceObservations:(id)a4
{
  uint64_t v7;

  if (!a3)
    goto LABEL_10;
  v7 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D60]), "BOOLValue")? 64: 56;
  if (*(Class *)((char *)&self->super.super.isa + v7))
    goto LABEL_10;
  *(Class *)((char *)&self->super.super.isa + v7) = (Class)CFRetain(a3);
  if (a4)
  {

    self->_faceObservations = (NSArray *)a4;
  }
  -[BWRedEyeReductionControllerInputDelegate didReceiveFrameForInput:](self->_inputDelegate, "didReceiveFrameForInput:", self);
  if (self->_primaryImage)
  {
    if (self->_auxImage)
LABEL_10:
      -[BWRedEyeReductionControllerInputDelegate didReceiveAllFramesForInput:](self->_inputDelegate, "didReceiveAllFramesForInput:", self, a4);
  }
}

- (BOOL)requiresSensorInterfaceRawPropagation
{
  unsigned int v3;
  NSUInteger v4;

  v3 = -[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags");
  v4 = -[NSArray count](-[BWStillImageCaptureSettings captureStreamSettings](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureStreamSettings"), "count");
  if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags") & 0x200) != 0)return 0;
  else
    return (v4 == 1) & (v3 >> 11);
}

+ (BOOL)requiresInferencesFromFrame:(opaqueCMSampleBuffer *)a3
{
  return objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D60]), "BOOLValue") ^ 1;
}

- (opaqueCMSampleBuffer)primaryImage
{
  return self->_primaryImage;
}

- (opaqueCMSampleBuffer)auxImage
{
  return self->_auxImage;
}

- (NSArray)faceObservations
{
  return self->_faceObservations;
}

- (BWRedEyeReductionControllerInputDelegate)inputDelegate
{
  return self->_inputDelegate;
}

- (void)setInputDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BWStillImageProcessorControllerDelegate)processorControllerDelegate
{
  return self->_processorControllerDelegate;
}

- (void)setProcessorControllerDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setRequiresSensorInterfaceRawPropagation:(BOOL)a3
{
  self->_requiresSensorInterfaceRawPropagation = a3;
}

@end
