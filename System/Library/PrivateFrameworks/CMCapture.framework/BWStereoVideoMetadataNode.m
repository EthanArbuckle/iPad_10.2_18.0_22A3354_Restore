@implementation BWStereoVideoMetadataNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWStereoVideoMetadataNode)initWithPorts:(id)a3 secondaryPort:(id)a4 cameraInfoByPortType:(id)a5 errStatus:(int *)a6
{
  BWNodeInput *v11;
  BWVideoFormatRequirements *v12;
  BWNodeOutput *v13;
  BWVideoFormatRequirements *v14;
  int v15;
  __CFData *v16;
  int v17;
  float32x4_t bytes;
  objc_super v20;

  if (objc_msgSend(a3, "isEqualToString:", a4))
  {
    FigDebugAssert3();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)BWStereoVideoMetadataNode;
    self = -[BWNode init](&v20, sel_init);
    if (!self)
    {
      *a6 = 0;
      return self;
    }
    v11 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, self);
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setFormatRequirements:", v12);

    -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
    -[BWNode addInput:](self, "addInput:", v11);

    v13 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, self);
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v13, "primaryMediaConfiguration"), "setFormatRequirements:", v14);

    -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v13, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
    -[BWNode addOutput:](self, "addOutput:", v13);

    bytes = 0uLL;
    v15 = BWStereoUtilitiesComputeRectificationQuaternion((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, &bytes);
    if (v15)
    {
      v17 = v15;
      FigDebugAssert3();
      goto LABEL_6;
    }
    v16 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)&bytes, 16);
    self->_serializedRectificationQuaternion = v16;
    if (v16)
    {
      v17 = 0;
      self->_consecutiveSpatiallyAggressiveFramesThreshold = 30;
      goto LABEL_6;
    }
    FigDebugAssert3();
  }
  v17 = FigSignalErrorAt();
LABEL_6:
  *a6 = v17;
  if (v17)
  {

    return 0;
  }
  return self;
}

- (void)dealloc
{
  __CFData *serializedRectificationQuaternion;
  objc_super v4;

  serializedRectificationQuaternion = self->_serializedRectificationQuaternion;
  if (serializedRectificationQuaternion)
    CFRelease(serializedRectificationQuaternion);
  v4.receiver = self;
  v4.super_class = (Class)BWStereoVideoMetadataNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("RealtimeStereoVideo");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStereoVideoMetadataNode;
  -[BWNode didReachEndOfDataForInput:](&v3, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CFTypeRef v6;
  const void *v7;
  void *v8;
  char v9;
  int consecutiveSpatiallyAggressiveFramesThreshold;
  int v11;
  int numberOfLuxLevelAggressiveFrames;
  int v13;
  int v14;
  int numberOfFocusDistanceAggressiveFrames;
  double Seconds;
  $95D729B680665BEAEFA1D6FCA8238556 startingPTS;
  CMTime lhs;
  CMTime v19;
  CMTime v20;

  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    memset(&v20, 0, sizeof(v20));
    CMSampleBufferGetPresentationTimeStamp(&v20, a3);
    v6 = CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
    if (v6)
    {
      v7 = v6;
      if (CFEqual(v6, CFSTR("Start")) || CFEqual(v7, CFSTR("Resume")))
      {
        self->_numberOfConsecutiveLuxLevelAggressiveFrames = 0;
        self->_numberOfConsecutiveFocusDistanceAggressiveFrames = 0;
        if (CFEqual(v7, CFSTR("Start")))
        {
          self->_numberOfFramesEvaluatedForAggressiveStatus = 0;
          self->_numberOfLuxLevelAggressiveFrames = 0;
          self->_numberOfFocusDistanceAggressiveFrames = 0;
          CMSampleBufferGetPresentationTimeStamp(&v19, a3);
          self->_startingPTS = ($95D729B680665BEAEFA1D6FCA8238556)v19;
          self->_aggregateStereoVideoCaptureStatus = 0;
        }
      }
      else if ((CFEqual(v7, CFSTR("Stop")) || CFEqual(v7, CFSTR("Terminate")))
             && self->_numberOfFramesEvaluatedForAggressiveStatus >= 1)
      {
        memset(&v19, 0, sizeof(v19));
        lhs = v20;
        startingPTS = self->_startingPTS;
        CMTimeSubtract(&v19, &lhs, (CMTime *)&startingPTS);
        if ((v19.flags & 1) != 0)
        {
          lhs = v19;
          startingPTS = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          if (CMTimeCompare(&lhs, (CMTime *)&startingPTS) >= 1)
          {
            lhs = v19;
            Seconds = CMTimeGetSeconds(&lhs);
            lhs = v20;
            -[BWStereoVideoMetadataNode _sendSpatialAggressorsSeenMarkerBufferForPTS:measuredDuration:]((uint64_t)self, (uint64_t)&lhs, Seconds);
          }
        }
      }
    }
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
  }
  else
  {
    v8 = (void *)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", 0x1E495A198);
    if (v8)
    {
      v9 = objc_msgSend(v8, "intValue");
      ++self->_numberOfFramesEvaluatedForAggressiveStatus;
      if ((v9 & 2) != 0)
      {
        consecutiveSpatiallyAggressiveFramesThreshold = self->_consecutiveSpatiallyAggressiveFramesThreshold;
        v11 = self->_numberOfConsecutiveLuxLevelAggressiveFrames + 1;
        self->_numberOfConsecutiveLuxLevelAggressiveFrames = v11;
        if (v11 >= consecutiveSpatiallyAggressiveFramesThreshold)
        {
          numberOfLuxLevelAggressiveFrames = self->_numberOfLuxLevelAggressiveFrames;
          self->_numberOfLuxLevelAggressiveFrames = numberOfLuxLevelAggressiveFrames + 1;
          if (self->_numberOfConsecutiveLuxLevelAggressiveFrames == consecutiveSpatiallyAggressiveFramesThreshold)
          {
            self->_numberOfLuxLevelAggressiveFrames = numberOfLuxLevelAggressiveFrames
                                                    + consecutiveSpatiallyAggressiveFramesThreshold;
            self->_aggregateStereoVideoCaptureStatus |= 2u;
          }
        }
      }
      else
      {
        self->_numberOfConsecutiveLuxLevelAggressiveFrames = 0;
      }
      if ((v9 & 4) != 0)
      {
        v13 = self->_consecutiveSpatiallyAggressiveFramesThreshold;
        v14 = self->_numberOfConsecutiveFocusDistanceAggressiveFrames + 1;
        self->_numberOfConsecutiveFocusDistanceAggressiveFrames = v14;
        if (v14 >= v13)
        {
          numberOfFocusDistanceAggressiveFrames = self->_numberOfFocusDistanceAggressiveFrames;
          self->_numberOfFocusDistanceAggressiveFrames = numberOfFocusDistanceAggressiveFrames + 1;
          if (self->_numberOfConsecutiveFocusDistanceAggressiveFrames == v13)
          {
            self->_numberOfFocusDistanceAggressiveFrames = numberOfFocusDistanceAggressiveFrames + v13;
            self->_aggregateStereoVideoCaptureStatus |= 4u;
          }
        }
      }
      else
      {
        self->_numberOfConsecutiveFocusDistanceAggressiveFrames = 0;
      }
    }
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08870], self->_serializedRectificationQuaternion, 1u);
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
  }
}

- (void)_sendSpatialAggressorsSeenMarkerBufferForPTS:(double)a3 measuredDuration:
{
  __int128 v5;
  CMTimeEpoch v6;
  __int128 v7;
  CMTimeEpoch v8;
  int v9;
  float v10;
  float v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  double v13;
  double v14;
  CMSampleTimingInfo sampleTimingArray;
  CMAttachmentBearerRef target;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v5;
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v7 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&sampleTimingArray.duration.epoch = v7;
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)a2;
    v8 = *(_QWORD *)(a2 + 16);
    sampleTimingArray.decodeTimeStamp.epoch = v6;
    target = 0;
    sampleTimingArray.presentationTimeStamp.epoch = v8;
    if (CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&target))
    {
      FigDebugAssert3();
    }
    else
    {
      v9 = *(_DWORD *)(a1 + 108);
      if (v9 < 1)
      {
        v11 = 0.0;
        v10 = 0.0;
      }
      else
      {
        v10 = (float)*(int *)(a1 + 116) / (float)v9;
        v11 = (float)*(int *)(a1 + 124) / (float)v9;
      }
      if (dword_1EE6BEAB8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSetAttachment(target, CFSTR("FileWriterAction"), CFSTR("SpatialAggressorsSeen"), 1u);
      CMSetAttachment(target, CFSTR("StereoVideoCaptureStatus"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 152)), 1u);
      CMSetAttachment(target, CFSTR("StereoVideoCaptureDuration"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3), 1u);
      *(float *)&v13 = v10;
      CMSetAttachment(target, CFSTR("StereoVideoCaptureStatusPercentageOfFramesWithAggressiveLuxLevel"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13), 1u);
      *(float *)&v14 = v11;
      CMSetAttachment(target, CFSTR("StereoVideoCaptureStatusPercentageOfFramesWithAggressiveFocusDistance"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14), 1u);
      objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", target);
    }
    if (target)
      CFRelease(target);
  }
}

@end
