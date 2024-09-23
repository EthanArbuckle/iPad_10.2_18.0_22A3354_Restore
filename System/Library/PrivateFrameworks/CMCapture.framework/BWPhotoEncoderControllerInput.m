@implementation BWPhotoEncoderControllerInput

- (_DWORD)initWithStillImageSettings:(uint64_t)a3 portType:(char)a4 requiresPhotosAdjustment:
{
  _DWORD *v5;
  _DWORD *v6;
  int v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)BWPhotoEncoderControllerInput;
  v5 = objc_msgSendSuper2(&v9, sel_initWithSettings_portType_, a2, a3);
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isStereoPhotoCapture"))
      v7 = 3;
    else
      v7 = 1;
    v6[10] = v7;
    *((_BYTE *)v6 + 44) = a4;
    *((_QWORD *)v6 + 9) = -1;
    *((_QWORD *)v6 + 10) = -1;
    *((_QWORD *)v6 + 11) = -1;
    *((_QWORD *)v6 + 13) = -1;
    *((_QWORD *)v6 + 14) = -1;
    *((_QWORD *)v6 + 15) = -1;
    *((_QWORD *)v6 + 16) = 0;
    *((_QWORD *)v6 + 18) = objc_alloc_init(MEMORY[0x1E0C99E20]);
    *((_QWORD *)v6 + 19) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *primarySampleBuffer;
  opaqueCMSampleBuffer *sbufToProcess;
  objc_super v5;

  primarySampleBuffer = self->_primarySampleBuffer;
  if (primarySampleBuffer)
    CFRelease(primarySampleBuffer);
  sbufToProcess = self->_sbufToProcess;
  if (sbufToProcess)
    CFRelease(sbufToProcess);

  v5.receiver = self;
  v5.super_class = (Class)BWPhotoEncoderControllerInput;
  -[BWStillImageProcessorControllerInput dealloc](&v5, sel_dealloc);
}

- (int64_t)settingsID
{
  return -[BWStillImageSettings settingsID](-[BWStillImageProcessorControllerInput stillImageSettings](self, "stillImageSettings"), "settingsID");
}

- (BOOL)isStereoPhotoCapture
{
  return -[BWStillImageCaptureSettings learnedNRStereoPhotoFrameFlag](-[BWStillImageSettings captureSettings](-[BWStillImageProcessorControllerInput stillImageSettings](self, "stillImageSettings"), "captureSettings"), "learnedNRStereoPhotoFrameFlag") != 0;
}

- (BOOL)receivedAllFramesInSingleContainer
{
  return self->_receivedFramesCount == self->_expectedFramesCount;
}

- (void)receivedFrame:(opaqueCMSampleBuffer *)a3 isPrimary:(BOOL)a4
{
  opaqueCMSampleBuffer *primarySampleBuffer;
  BOOL v5;

  ++self->_receivedFramesCount;
  if (self->_fatalErrorOccurred)
  {
    FigDebugAssert3();
  }
  else
  {
    primarySampleBuffer = self->_primarySampleBuffer;
    if (primarySampleBuffer)
      v5 = !a4;
    else
      v5 = 0;
    if (!v5)
    {
      self->_primarySampleBuffer = a3;
      if (a3)
        CFRetain(a3);
      if (primarySampleBuffer)
        CFRelease(primarySampleBuffer);
    }
  }
}

- (void)finishedProcessingSbuf
{
  opaqueCMSampleBuffer *sbufToProcess;

  sbufToProcess = self->_sbufToProcess;
  if (sbufToProcess)
  {
    CFRelease(sbufToProcess);
    self->_sbufToProcess = 0;
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, receivedFramesCount:%u, expectedFramesCount:%u fatalErrorOccurred:%d"), objc_opt_class(), self, -[BWPhotoEncoderControllerInput settingsID](self, "settingsID"), self->_receivedFramesCount, self->_expectedFramesCount, self->_fatalErrorOccurred);
}

- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  opaqueCMSampleBuffer *sbufToProcess;
  int v6;

  if (a3)
  {
    sbufToProcess = self->_sbufToProcess;
    self->_sbufToProcess = a3;
    CFRetain(a3);
    if (sbufToProcess)
      CFRelease(sbufToProcess);
    v6 = BWStillImageProcessingFlagsForSampleBuffer(a3);
    -[BWPhotoEncoderControllerInput receivedFrame:isPrimary:](self, "receivedFrame:isPrimary:", a3, BWPhotoEncoderIsPrimaryFrame(v6));
    -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedNewInputData:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputReceivedNewInputData:", self);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)addAuxSbuf:(opaqueCMSampleBuffer *)a3 attachedMediakey:(id)a4 primaryImageMetadata:(id)a5 processingFlags:(unsigned int)a6
{
  uint64_t v6;

  v6 = *(_QWORD *)&a6;
  if (!self->_primaryImageMetadataForPrewarming)
    self->_primaryImageMetadataForPrewarming = (NSDictionary *)a5;
  if (!self->_processingFlagsForPrewarming)
    self->_processingFlagsForPrewarming = v6;
  if (-[BWStillImageProcessorControllerInput delegate](self, "delegate"))
    -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedNewAuxMedia:auxSbuf:attachedMediaKey:primaryImageMetadata:processingFlags:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputReceivedNewAuxMedia:auxSbuf:attachedMediaKey:primaryImageMetadata:processingFlags:", self, a3, a4, a5, v6);
  else
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stashedAttacheMediaSampleBuffersByAttachedMediaKey, "setObject:forKeyedSubscript:", a3, a4);
}

- (BOOL)requiresPhotosAdjustment
{
  return self->_requiresPhotosAdjustment;
}

- (unsigned)receivedFramesCount
{
  return self->_receivedFramesCount;
}

- (opaqueCMSampleBuffer)sbufToProcess
{
  return self->_sbufToProcess;
}

- (int64_t)reservedPrimaryImageHandle
{
  return self->_reservedPrimaryImageHandle;
}

- (void)setReservedPrimaryImageHandle:(int64_t)a3
{
  self->_reservedPrimaryImageHandle = a3;
}

- (int64_t)gainMapHandle
{
  return self->_gainMapHandle;
}

- (void)setGainMapHandle:(int64_t)a3
{
  self->_gainMapHandle = a3;
}

- (int64_t)toneMapAlternateGroupHandle
{
  return self->_toneMapAlternateGroupHandle;
}

- (void)setToneMapAlternateGroupHandle:(int64_t)a3
{
  self->_toneMapAlternateGroupHandle = a3;
}

- (opaqueCMSampleBuffer)primarySampleBuffer
{
  return self->_primarySampleBuffer;
}

- (BOOL)fatalErrorOccurred
{
  return self->_fatalErrorOccurred;
}

- (void)setFatalErrorOccurred:(BOOL)a3
{
  self->_fatalErrorOccurred = a3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)stereoPhotoImageHandles
{
  *($7B1F0C603D2048E240D0518A13F310F9 *)retstr = *($7B1F0C603D2048E240D0518A13F310F9 *)((char *)self + 104);
  return self;
}

- (void)setStereoPhotoImageHandles:(id *)a3
{
  int64_t var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_stereoPhotoImageHandles.mono = *(_OWORD *)&a3->var0;
  self->_stereoPhotoImageHandles.right = var2;
}

- (unint64_t)monoImageLocationType
{
  return self->_monoImageLocationType;
}

- (void)setMonoImageLocationType:(unint64_t)a3
{
  self->_monoImageLocationType = a3;
}

- (NSDictionary)decompressStyledBufferAttributes
{
  return self->_decompressStyledBufferAttributes;
}

- (void)setDecompressStyledBufferAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSMutableSet)encodedAttachedMediaKeys
{
  return self->_encodedAttachedMediaKeys;
}

- (NSMutableDictionary)stashedAttacheMediaSampleBuffersByAttachedMediaKey
{
  return self->_stashedAttacheMediaSampleBuffersByAttachedMediaKey;
}

- (NSDictionary)primaryImageMetadataForPrewarming
{
  return self->_primaryImageMetadataForPrewarming;
}

- (unsigned)processingFlagsForPrewarming
{
  return self->_processingFlagsForPrewarming;
}

- (BOOL)deltaMapIsValid
{
  return self->_deltaMapIsValid;
}

- (void)setDeltaMapIsValid:(BOOL)a3
{
  self->_deltaMapIsValid = a3;
}

@end
