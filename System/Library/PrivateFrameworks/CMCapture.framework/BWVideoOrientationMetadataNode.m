@implementation BWVideoOrientationMetadataNode

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[5];

  if (-[BWNodeOutput consumer](self->super._output, "consumer", a3, a4, a5))
  {
    emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__BWVideoOrientationMetadataNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_async(emitSamplesDispatchQueue, block);
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)setSourcePosition:(int)a3
{
  if (self->_sourcePosition != a3)
    self->_sourcePosition = a3;
}

- (void)setSourceDeviceType:(int)a3
{
  if (self->_sourceDeviceType != a3)
    self->_sourceDeviceType = a3;
}

- (void)setPhysicalMirroringForMovieRecordingEnabled:(BOOL)a3
{
  self->_physicalMirroringForMovieRecordingEnabled = a3;
}

- (void)setMasterClock:(OpaqueCMClock *)a3
{
  OpaqueCMClock *masterClock;

  masterClock = self->_masterClock;
  self->_masterClock = a3;
  if (a3)
    CFRetain(a3);
  if (masterClock)
    CFRelease(masterClock);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  objc_super v5;

  if (!self->_masterClock)
  {
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99768];
    v4 = CFSTR("Cannot become active because masterClock was never set");
    goto LABEL_6;
  }
  if (!self->_sourcePosition)
  {
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99768];
    v4 = CFSTR("Cannot become active because a valid sourcePosition was never set");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0));
  }
  v5.receiver = self;
  v5.super_class = (Class)BWVideoOrientationMetadataNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v5, sel_prepareForCurrentConfigurationToBecomeLive);
}

uint64_t __90__BWVideoOrientationMetadataNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "makeConfiguredFormatLive");
}

- (BWVideoOrientationMetadataNode)init
{
  char *v2;
  BWNodeInput *v3;
  BWVideoFormatRequirements *v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  const __CFArray *v10;
  _QWORD *v11;
  BWNodeOutput *v12;
  CMClockRef HostTimeClock;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)BWVideoOrientationMetadataNode;
  v2 = -[BWNode init](&v15, sel_init);
  if (v2)
  {
    v3 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v2);
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v3, "setFormatRequirements:", v4);

    objc_msgSend(v2, "addInput:", v3);
    v5 = (const void *)*MEMORY[0x1E0CA2528];
    v6 = *MEMORY[0x1E0CA2590];
    v7 = (const void *)*MEMORY[0x1E0CA2518];
    v18[0] = *MEMORY[0x1E0CA2528];
    v18[1] = v7;
    v8 = *MEMORY[0x1E0CA2450];
    v19[0] = v6;
    v19[1] = v8;
    v18[2] = *MEMORY[0x1E0CA2538];
    v16 = *MEMORY[0x1E0CA2540];
    v17 = *MEMORY[0x1E0C9AE40];
    v19[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v9 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v10 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
    v11 = v2 + 128;
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v10, (CMMetadataFormatDescriptionRef *)v2 + 16))
    {

      return 0;
    }
    else
    {
      CFDictionaryGetValue(v9, v5);
      CFDictionaryGetValue(v9, v7);
      CFDictionaryGetValue(v9, (const void *)*MEMORY[0x1E0CA2520]);
      *((_DWORD *)v2 + 34) = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      v12 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v2);
      -[BWNodeOutput setName:](v12, "setName:", CFSTR("VideoOrientationMetadata"));
      -[BWNodeOutput setFormat:](v12, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:", *v11));
      objc_msgSend(v2, "addOutput:", v12);

      *((_QWORD *)v2 + 28) = FigDispatchQueueCreateWithPriority();
      HostTimeClock = CMClockGetHostTimeClock();
      *((_QWORD *)v2 + 12) = CFRetain(HostTimeClock);
      *(_OWORD *)(v2 + 152) = 0u;
      *(_OWORD *)(v2 + 168) = 0u;
      *(_OWORD *)(v2 + 184) = 0u;
      *(_OWORD *)(v2 + 200) = 0u;
      *((_DWORD *)v2 + 28) = 0;
      v2[116] = 0;
      *((_DWORD *)v2 + 30) = 0;
      *((_DWORD *)v2 + 31) = 0;
      *((_DWORD *)v2 + 36) = 0;
      *((_QWORD *)v2 + 27) = -[BWVideoOrientationTimeMachine initWithCapacity:formatDescription:metadataLocalID:]([BWVideoOrientationTimeMachine alloc], "initWithCapacity:formatDescription:metadataLocalID:", 100, *v11, *((unsigned int *)v2 + 34));
    }
  }
  return (BWVideoOrientationMetadataNode *)v2;
}

- (BWVideoOrientationTimeMachine)videoOrientationTimeMachine
{
  return self->_videoOrientationTimeMachine;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  OpaqueCMClock *clock;
  OpaqueCMClock *masterClock;
  opaqueCMFormatDescription *boxedMetadataFormatDescription;
  objc_super v6;

  clock = self->_clock;
  if (clock)
    CFRelease(clock);
  masterClock = self->_masterClock;
  if (masterClock)
    CFRelease(masterClock);
  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription)
    CFRelease(boxedMetadataFormatDescription);
  -[BWVideoOrientationMetadataNode _releaseCachedBBufs]((uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)BWVideoOrientationMetadataNode;
  -[BWNode dealloc](&v6, sel_dealloc);
}

- (void)_releaseCachedBBufs
{
  uint64_t i;
  const void *v3;

  if (a1)
  {
    for (i = 0; i != 64; i += 8)
    {
      v3 = *(const void **)(a1 + 152 + i);
      if (v3)
      {
        CFRelease(v3);
        *(_QWORD *)(a1 + 152 + i) = 0;
      }
    }
  }
}

- (void)updateVideoOrientation:(int)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[5];
  int v5;

  if ((a3 - 5) <= 0xFFFFFFFB)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__BWVideoOrientationMetadataNode_updateVideoOrientation___block_invoke;
    block[3] = &unk_1E4920568;
    block[4] = self;
    v5 = a3;
    dispatch_async(emitSamplesDispatchQueue, block);
  }
}

void __57__BWVideoOrientationMetadataNode_updateVideoOrientation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 112) != v2)
  {
    *(_DWORD *)(v1 + 112) = v2;
    -[BWVideoOrientationMetadataNode _determineExifOrientation](*(_QWORD *)(a1 + 32));
    -[BWVideoOrientationMetadataNode _emitBufferForNewStateIfRecording](*(_QWORD *)(a1 + 32));
  }
}

- (uint64_t)_determineExifOrientation
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 IsExtensionDeviceType;
  int v7;

  if (result)
  {
    v1 = result;
    v2 = *(_DWORD *)(result + 112);
    if (v2)
    {
      v3 = *(_DWORD *)(result + 120);
      if (v3)
      {
        v4 = *(unsigned __int8 *)(result + 116);
        v5 = v3 == 2;
        IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(*(_DWORD *)(result + 124));
        v7 = *(unsigned __int8 *)(v1 + 142);
        objc_msgSend((id)objc_msgSend((id)v1, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
        result = FigCaptureMetadataUtilitiesExifOrientationFromOrientationAndCameraPosition(v2, v4, v5, IsExtensionDeviceType, v7);
        *(_DWORD *)(v1 + 144) = result;
      }
    }
  }
  return result;
}

- (void)_emitBufferForNewStateIfRecording
{
  CMTime v2;
  CMTime time;
  CMTime v4;

  if (a1 && *(_BYTE *)(a1 + 143))
  {
    memset(&v4, 0, sizeof(v4));
    CMClockGetTime(&time, *(CMClockRef *)(a1 + 96));
    CMSyncConvertTime(&v4, &time, *(CMClockOrTimebaseRef *)(a1 + 96), *(CMClockOrTimebaseRef *)(a1 + 104));
    if ((v4.flags & 1) != 0)
    {
      v2 = v4;
      -[BWVideoOrientationMetadataNode _emitValidatedVideoOrientationSampleBufferForBoxedFormatOutputAtTime:](a1, (__int128 *)&v2.value);
    }
  }
}

- (void)updateVideoMirrored:(BOOL)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__BWVideoOrientationMetadataNode_updateVideoMirrored___block_invoke;
  v4[3] = &unk_1E491EE18;
  v4[4] = self;
  v5 = a3;
  dispatch_async(emitSamplesDispatchQueue, v4);
}

void __54__BWVideoOrientationMetadataNode_updateVideoMirrored___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 116) != v2)
  {
    *(_BYTE *)(v1 + 116) = v2;
    -[BWVideoOrientationMetadataNode _determineExifOrientation](*(_QWORD *)(a1 + 32));
    -[BWVideoOrientationMetadataNode _emitBufferForNewStateIfRecording](*(_QWORD *)(a1 + 32));
  }
}

- (OpaqueCMClock)masterClock
{
  OpaqueCMClock *masterClock;

  masterClock = self->_masterClock;
  if (masterClock)
  {
    CFRetain(self->_masterClock);
    CFAutorelease(masterClock);
  }
  return masterClock;
}

- (int)sourcePosition
{
  return self->_sourcePosition;
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (BOOL)physicalMirroringForMovieRecordingEnabled
{
  return self->_physicalMirroringForMovieRecordingEnabled;
}

- (id)nodeSubType
{
  return CFSTR("VideoOrientationMetadata");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[5];

  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BWVideoOrientationMetadataNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(emitSamplesDispatchQueue, block);
}

uint64_t __60__BWVideoOrientationMetadataNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 143) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "markEndOfLiveOutput");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  opaqueCMSampleBuffer *v4;
  void *v6;
  int recordVideoOrientationAndMirroringChanges;
  int v8;
  char v9;
  unsigned __int8 v10;
  NSObject *emitSamplesDispatchQueue;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[6];
  CMTime v15;
  CMTime v16;
  _QWORD block[6];
  unsigned __int8 v18;
  char v19;
  char v20;
  CMSampleBufferRef sampleBufferOut;

  v4 = a3;
  sampleBufferOut = 0;
  if (!BWSampleBufferIsMarkerBuffer(a3))
    return;
  if (qtmfsn_bufferSpecifiesFileWriterAction(v4, CFSTR("Start")))
  {
    v6 = (void *)CMGetAttachment(v4, CFSTR("RecordingSettings"), 0);
    if (!v6)
    {
      v10 = 0;
      recordVideoOrientationAndMirroringChanges = 0;
      v9 = 0;
      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      recordVideoOrientationAndMirroringChanges = objc_msgSend(v6, "recordVideoOrientationAndMirroringChanges");
      self->_recordVideoOrientationAndMirroringChanges = recordVideoOrientationAndMirroringChanges;
      self->_flipMetadataHorizontally = 0;
      if (self->_physicalMirroringForMovieRecordingEnabled)
      {
        if (!objc_msgSend(v6, "isIrisRecording") || (v8 = objc_msgSend(v6, "isIrisMovieRecording")) != 0)
          LOBYTE(v8) = objc_msgSend(v6, "videoMirrored");
        self->_flipMetadataHorizontally = v8;
      }
      if (!self->_recordVideoOrientationAndMirroringChanges
        && !CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, &sampleBufferOut))
      {
        v10 = 1;
        CMSetAttachment(sampleBufferOut, CFSTR("FileWriterStartActionModifier_NoDataWillBeProvidedForThisRecording"), (CFTypeRef)*MEMORY[0x1E0C9AE50], 1u);
        v9 = 0;
        v4 = sampleBufferOut;
        goto LABEL_23;
      }
      v9 = 0;
      goto LABEL_15;
    }
    v10 = 0;
LABEL_22:
    recordVideoOrientationAndMirroringChanges = 0;
    v9 = 0;
    v6 = 0;
    goto LABEL_23;
  }
  if (!qtmfsn_bufferSpecifiesFileWriterAction(v4, CFSTR("Resume")))
  {
    if ((qtmfsn_bufferSpecifiesFileWriterAction(v4, CFSTR("Stop")) & 1) != 0
      || (qtmfsn_bufferSpecifiesFileWriterAction(v4, CFSTR("Flush")) & 1) != 0
      || qtmfsn_bufferSpecifiesFileWriterAction(v4, CFSTR("Terminate")))
    {
      CMGetAttachment(v4, CFSTR("FileWriterAction"), 0);
      recordVideoOrientationAndMirroringChanges = 0;
      v6 = 0;
      v10 = 1;
      v9 = 1;
      goto LABEL_23;
    }
    v10 = qtmfsn_bufferSpecifiesFileWriterAction(v4, CFSTR("Pause"));
    goto LABEL_22;
  }
  v9 = 0;
  v6 = 0;
  recordVideoOrientationAndMirroringChanges = self->_recordVideoOrientationAndMirroringChanges;
LABEL_15:
  v10 = 1;
LABEL_23:
  CFRetain(v4);
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__BWVideoOrientationMetadataNode_renderSampleBuffer_forInput___block_invoke;
  block[3] = &unk_1E4926758;
  block[4] = self;
  block[5] = v4;
  v18 = v10;
  v19 = recordVideoOrientationAndMirroringChanges;
  v20 = v9;
  dispatch_async(emitSamplesDispatchQueue, block);
  if (recordVideoOrientationAndMirroringChanges)
  {
    memset(&v16, 0, sizeof(v16));
    CMSampleBufferGetPresentationTimeStamp(&v16, v4);
    v13 = self->_emitSamplesDispatchQueue;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __62__BWVideoOrientationMetadataNode_renderSampleBuffer_forInput___block_invoke_2;
    v14[3] = &unk_1E4921110;
    v14[4] = v6;
    v14[5] = self;
    v15 = v16;
    dispatch_async(v13, v14);
  }
  if (sampleBufferOut)
    CFRelease(sampleBufferOut);
}

void __62__BWVideoOrientationMetadataNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitSampleBuffer:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48) && !*(_BYTE *)(a1 + 49))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 143) = 0;
    if (*(_BYTE *)(a1 + 50))
    {
      -[BWVideoOrientationMetadataNode _releaseCachedBBufs](*(_QWORD *)(a1 + 32));
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
    }
  }
}

void __62__BWVideoOrientationMetadataNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  if ((int)objc_msgSend(*(id *)(a1 + 32), "videoOrientation") < 1
    || (int)objc_msgSend(*(id *)(a1 + 32), "videoOrientation") > 4)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 112) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 116) = 0;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 112) = objc_msgSend(*(id *)(a1 + 32), "videoOrientation");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 116) = objc_msgSend(*(id *)(a1 + 32), "videoMirrored");
  }
  -[BWVideoOrientationMetadataNode _determineExifOrientation](*(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  -[BWVideoOrientationMetadataNode _emitValidatedVideoOrientationSampleBufferForBoxedFormatOutputAtTime:](v2, &v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 143) = 1;
}

- (void)_emitValidatedVideoOrientationSampleBufferForBoxedFormatOutputAtTime:(uint64_t)a1
{
  int v4;
  uint64_t v5;
  OpaqueCMBlockBuffer *v6;
  uint64_t v7;
  OpaqueCMBlockBuffer *BoxedVideoOrientationBlockBuffer;
  const opaqueCMFormatDescription *v9;
  CMSampleBufferRef VideoOrientationSampleBuffer;
  CMSampleBufferRef v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  if (a1)
  {
    if ((*((_BYTE *)a2 + 12) & 1) != 0)
    {
      v4 = *(_DWORD *)(a1 + 144);
      if ((v4 - 9) >= 0xFFFFFFF8)
      {
        v5 = (v4 - 1);
        v6 = *(OpaqueCMBlockBuffer **)(a1 + 152 + 8 * v5);
        v7 = (__int16)v4;
        if (!v6)
        {
          BoxedVideoOrientationBlockBuffer = (OpaqueCMBlockBuffer *)FigCaptureMetadataUtilitiesCreateBoxedVideoOrientationBlockBuffer();
          if (!BoxedVideoOrientationBlockBuffer)
            return;
          v6 = BoxedVideoOrientationBlockBuffer;
          *(_QWORD *)(a1 + 152 + 8 * v5) = BoxedVideoOrientationBlockBuffer;
        }
        v9 = *(const opaqueCMFormatDescription **)(a1 + 128);
        v14 = *a2;
        v15 = *((_QWORD *)a2 + 2);
        VideoOrientationSampleBuffer = FigCaptureMetadataUtilitiesCreateVideoOrientationSampleBuffer((uint64_t)&v14, v6, v7, v9);
        if (VideoOrientationSampleBuffer)
        {
          v11 = VideoOrientationSampleBuffer;
          v12 = *(void **)(a1 + 216);
          v13 = *(__int16 *)(a1 + 144);
          v14 = *a2;
          v15 = *((_QWORD *)a2 + 2);
          objc_msgSend(v12, "addItemToCacheWithPTS:exifOrientation:", &v14, v13);
          objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v11);
          CFRelease(v11);
        }
      }
    }
  }
}

@end
