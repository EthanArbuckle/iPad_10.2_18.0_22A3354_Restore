@implementation BWStereoDisparityProcessorInput

- (void)dealloc
{
  opaqueCMSampleBuffer *referenceSbuf;
  opaqueCMSampleBuffer *auxiliarySbuf;
  objc_super v5;

  referenceSbuf = self->_referenceSbuf;
  if (referenceSbuf)
    CFRelease(referenceSbuf);
  auxiliarySbuf = self->_auxiliarySbuf;
  if (auxiliarySbuf)
    CFRelease(auxiliarySbuf);

  v5.receiver = self;
  v5.super_class = (Class)BWStereoDisparityProcessorInput;
  -[BWStillImageProcessorControllerInput dealloc](&v5, sel_dealloc);
}

- (BWStereoDisparityProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  BWStereoDisparityProcessorInput *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWStereoDisparityProcessorInput;
  v5 = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v8, sel_initWithSettings_portType_, a3, a4);
  if (v5)
  {
    v6 = (objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x20000) != 0
      && objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureType") == 10;
    v5->_equalizeTeleGainToMatchReference = v6;
    v5->_emitAuxiliaryInput = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count") != 0;
    v5->_expectedPortTypes = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "portTypes"));
  }
  return v5;
}

- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v5;
  CFTypeRef *v6;
  const void *v7;

  if (a3)
  {
    if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue"))v5 = 48;
    else
      v5 = 56;
    v6 = (CFTypeRef *)((char *)&self->super.super.isa + v5);
    v7 = *(Class *)((char *)&self->super.super.isa + v5);
    if (v7)
      CFRelease(v7);
    *v6 = CFRetain(a3);
    -[BWStereoDisparityProcessorInputDelegate inputReceivedNewInputData:](self->_delegate, "inputReceivedNewInputData:", self);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@ : ref:%p aux:%p emitAux:%d eqTele:%d"), v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_referenceSbuf, self->_auxiliarySbuf, self->_emitAuxiliaryInput, self->_equalizeTeleGainToMatchReference);
}

- (BWStereoDisparityProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (opaqueCMSampleBuffer)referenceSbuf
{
  return self->_referenceSbuf;
}

- (opaqueCMSampleBuffer)auxiliarySbuf
{
  return self->_auxiliarySbuf;
}

- (BOOL)equalizeTeleGainToMatchReference
{
  return self->_equalizeTeleGainToMatchReference;
}

- (void)setEqualizeTeleGainToMatchReference:(BOOL)a3
{
  self->_equalizeTeleGainToMatchReference = a3;
}

- (BOOL)emitAuxiliaryInput
{
  return self->_emitAuxiliaryInput;
}

- (void)setEmitAuxiliaryInput:(BOOL)a3
{
  self->_emitAuxiliaryInput = a3;
}

- (NSSet)expectedPortTypes
{
  return self->_expectedPortTypes;
}

- (void)setExpectedPortTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
