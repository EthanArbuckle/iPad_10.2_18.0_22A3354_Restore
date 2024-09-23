@implementation BWRefinedCinematographyNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWRefinedCinematographyNode)initWithAudioEnabled:(BOOL)a3
{
  _BOOL4 v3;
  char *v4;
  BWRefinedCinematographyNode *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  BWNodeOutput *v9;
  BWNodeInput *v10;
  BWNodeOutput *v11;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BWRefinedCinematographyNode;
  v4 = -[BWNode init](&v13, sel_init);
  v5 = (BWRefinedCinematographyNode *)v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0CA2E18];
    v7 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v4 + 136) = *MEMORY[0x1E0CA2E18];
    v8 = *(_QWORD *)(v6 + 16);
    *((_QWORD *)v4 + 19) = v8;
    *((_OWORD *)v4 + 7) = v7;
    *((_QWORD *)v4 + 16) = v8;
    *((_QWORD *)v4 + 20) = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeInput setFormatRequirements:](v5->_videoInput, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v5->_videoInput, "setPassthroughMode:", 1);
    -[BWNode addInput:](v5, "addInput:", v5->_videoInput);
    v9 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v5);
    v5->_videoOutput = v9;
    -[BWNodeOutput setName:](v9, "setName:", CFSTR("PassThru"));
    -[BWNodeOutput setPassthroughMode:](v5->_videoOutput, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v5, "addOutput:", v5->_videoOutput);
    if (v3)
    {
      v10 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1936684398, v5);
      v5->_audioInput = v10;
      -[BWNode addInput:](v5, "addInput:", v10);
      v11 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1936684398, v5);
      v5->_audioOutput = v11;
      -[BWNode addOutput:](v5, "addOutput:", v11);
    }
    v5->_refinementSession = (PTCinematographyRefinement *)objc_msgSend(objc_alloc((Class)getPTCinematographyRefinementClass()), "initWithOptions:", 0);
  }
  return v5;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  int *p_numEODMessagesReceived;
  unsigned int v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_numEODMessagesReceived = &self->_numEODMessagesReceived;
  do
    v5 = __ldxr((unsigned int *)p_numEODMessagesReceived);
  while (__stxr(v5 + 1, (unsigned int *)p_numEODMessagesReceived));
  if (-[NSArray count](-[BWNode inputs](self, "inputs", a3), "count") == v5 + 1)
  {
    -[BWRefinedCinematographyNode _flush]((uint64_t)self);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[BWNode outputs](self, "outputs", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "markEndOfLiveOutput");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
    *p_numEODMessagesReceived = 0;
  }
}

- (void)_flush
{
  __int128 v2;
  CMTimeEpoch v3;
  __int128 v4;
  CMTimeEpoch v5;
  OSStatus v6;
  CMSampleBufferRef v7;
  CMSampleBufferRef v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  CMTime rhs;
  CMTime lhs;
  CMSampleTimingInfo sampleTimingArray;
  CMSampleBufferRef v15;

  if (a1)
  {
    v15 = 0;
    if (*(_BYTE *)(a1 + 104))
    {
      objc_msgSend(*(id *)(a1 + 96), "stopRecording");
      *(_BYTE *)(a1 + 104) = 0;
      v2 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v2;
      v3 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
      v4 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
      *(_OWORD *)&sampleTimingArray.duration.epoch = v4;
      v5 = *(_QWORD *)(a1 + 152);
      sampleTimingArray.decodeTimeStamp.epoch = v3;
      sampleTimingArray.presentationTimeStamp.epoch = v5;
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)(a1 + 136);
      lhs = *(CMTime *)(a1 + 112);
      rhs = *(CMTime *)(a1 + 136);
      CMTimeSubtract(&sampleTimingArray.duration, &lhs, &rhs);
      v6 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v15);
      v7 = v15;
      if (!v6)
      {
        CMSetAttachment(v15, CFSTR("RefinedCinematographyStreamEndMarker"), MEMORY[0x1E0C9AAB0], 1u);
        -[BWRefinedCinematographyNode _attachRefinedFramesToSbuf:](a1, v15);
        v8 = v15;
        CMSetAttachment(v15, CFSTR("CinematicAudioDialogueLevel"), &unk_1E4A02420, 1u);
        CMSetAttachment(v8, CFSTR("CinematicAudioAmbienceLevel"), &unk_1E4A02420, 1u);
        objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v15);
        v7 = v15;
      }
    }
    else
    {
      v7 = 0;
    }
    v9 = MEMORY[0x1E0CA2E18];
    v10 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(a1 + 136) = *MEMORY[0x1E0CA2E18];
    v11 = *(_QWORD *)(v9 + 16);
    *(_QWORD *)(a1 + 152) = v11;
    *(_OWORD *)(a1 + 112) = v10;
    *(_QWORD *)(a1 + 128) = v11;
    if (v7)
      CFRelease(v7);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWRefinedCinematographyNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("CinematographyMetadataProducer");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  int *v4;

  if (self->_videoInput == a4)
    v4 = &OBJC_IVAR___BWRefinedCinematographyNode__videoOutput;
  else
    v4 = &OBJC_IVAR___BWRefinedCinematographyNode__audioOutput;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v4), "setFormat:", a3);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  int *v5;

  if (self->_videoInput == a5)
    v5 = &OBJC_IVAR___BWRefinedCinematographyNode__videoOutput;
  else
    v5 = &OBJC_IVAR___BWRefinedCinematographyNode__audioOutput;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v5), "makeConfiguredFormatLive", a3, a4);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  _DWORD *v7;
  int *v8;
  CFTypeRef v9;
  const void *v10;
  CFTypeID v11;
  void *v12;
  uint64_t v13;
  PTCinematographyRefinement *refinementSession;
  CMTime v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (self->_videoInput == a4)
  {
    if (BWSampleBufferIsMarkerBuffer(a3))
    {
      v9 = CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
      if (v9)
      {
        v10 = v9;
        v11 = CFGetTypeID(v9);
        if (v11 == CFStringGetTypeID())
        {
          if (CFEqual(v10, CFSTR("Stop"))
            || CFEqual(v10, CFSTR("Pause"))
            || CFEqual(v10, CFSTR("Flush"))
            || CFEqual(v10, CFSTR("Terminate"))
            || CFEqual(v10, CFSTR("StreamForcedOff")))
          {
            -[BWRefinedCinematographyNode _flush]((uint64_t)self);
          }
          else if (CFEqual(v10, CFSTR("Start")))
          {
            -[PTCinematographyRefinement startRecording](self->_refinementSession, "startRecording");
            self->_isRefinementSessionActive = 1;
          }
        }
      }
    }
    else
    {
      v12 = (void *)CMGetAttachment(a3, CFSTR("CinematicVideoCinematographyMetadata"), 0);
      if (v12)
      {
        v13 = objc_msgSend(v12, "objectForKeyedSubscript:", 0x1E4959E18);
        refinementSession = self->_refinementSession;
        v16[0] = v13;
        -[PTCinematographyRefinement addFrames:](refinementSession, "addFrames:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1));
      }
      -[BWRefinedCinematographyNode _attachRefinedFramesToSbuf:]((uint64_t)self, a3);
    }
    if (*v7 == 1)
      kdebug_trace();
    v8 = &OBJC_IVAR___BWRefinedCinematographyNode__videoOutput;
  }
  else
  {
    if ((self->_firstAudioPTS.flags & 1) == 0)
    {
      CMSampleBufferGetPresentationTimeStamp(&v15, a3);
      self->_firstAudioPTS = ($95D729B680665BEAEFA1D6FCA8238556)v15;
    }
    CMSampleBufferGetPresentationTimeStamp(&v15, a3);
    self->_lastAudioPTS = ($95D729B680665BEAEFA1D6FCA8238556)v15;
    v8 = &OBJC_IVAR___BWRefinedCinematographyNode__audioOutput;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v8), "emitSampleBuffer:", a3);
}

- (void)_attachRefinedFramesToSbuf:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  CFDictionaryRef v8;
  id v9;
  void *v10;
  void *v11;
  id AssociatedObject;
  uint64_t v13;
  uint64_t v14;
  id v15;
  CMAttachmentBearerRef target;
  id obj;
  const __CFAllocator *allocator;
  uint64_t v19;
  void *value;
  CMTime time;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 96), "refinedFrames");
    if (objc_msgSend(v3, "count"))
    {
      target = a2;
      value = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (!v4)
        goto LABEL_20;
      v5 = v4;
      v19 = *(_QWORD *)v23;
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      obj = v3;
      while (1)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (v7)
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "time");
          else
            memset(&time, 0, sizeof(time));
          v8 = CMTimeCopyAsDictionary(&time, allocator);
          v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v26[0] = 0x1E4959DB8;
          v10 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "aperture");
          v27[0] = objc_msgSend(v10, "numberWithFloat:");
          v26[1] = 0x1E4959DF8;
          v11 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "focusDistance");
          v27[1] = objc_msgSend(v11, "numberWithFloat:");
          v27[2] = v8;
          v26[2] = 0x1E4937518;
          v26[3] = 0x1E4959E18;
          v27[3] = v7;
          objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4), 0x1E4959E98);
          AssociatedObject = objc_getAssociatedObject(v7, CFSTR("CinematicVideoTimedRenderingMetadata"));
          v13 = objc_opt_class();
          getPTTimedRenderingMetadataVersion1Class();
          if (v13 == objc_opt_class())
          {
            objc_msgSend(v7, "focusDistance");
            objc_msgSend(AssociatedObject, "setFocusDistance:");
            objc_msgSend(v7, "aperture");
            objc_msgSend(AssociatedObject, "setAperture:");
          }
          else
          {
            v14 = objc_opt_class();
            getPTTimedRenderingMetadataVersion2Class();
            if (v14 != objc_opt_class())
              goto LABEL_16;
            objc_msgSend(v7, "focusDistance");
            objc_msgSend(AssociatedObject, "setFocusDisparity:");
            objc_msgSend(v7, "aperture");
            objc_msgSend(AssociatedObject, "setFNumber:");
          }
          objc_msgSend(v9, "setObject:forKeyedSubscript:", AssociatedObject, 0x1E4959EB8);
LABEL_16:
          v15 = objc_getAssociatedObject(v7, CFSTR("CinematicVideoTimedStabilizationMetadata"));
          if (v15)
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, 0x1E4959ED8);
          objc_msgSend(value, "addObject:", v9);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (!v5)
        {
LABEL_20:
          CMSetAttachment(target, CFSTR("CinematicVideoMetadata"), value, 1u);

          return;
        }
      }
    }
  }
}

- (BWNodeInput)videoInput
{
  return self->_videoInput;
}

- (BWNodeInput)audioInput
{
  return self->_audioInput;
}

- (BWNodeOutput)videoOutput
{
  return self->_videoOutput;
}

- (BWNodeOutput)audioOutput
{
  return self->_audioOutput;
}

@end
